public class AccountLeadOwnershipBatch implements Database.Batchable<SObject> {

    Id submitUserId;
    Map<String, zip_code_assigment__c> zipOwnerMap = new Map<String, zip_code_assigment__c>();

    public AccountLeadOwnershipBatch(Id currentUserId) {
        this.submitUserId = currentUserId;

        for (zip_code_assigment__c zip : [
            SELECT zip_code__c,
                   Territory_Manager__c,
                   Territory_Manager__r.State__c,
                   Territory_Manager__r.country__c,
                   Territory_Manager__r.zip_code__c,
                   Territory_Manager__r.Account_Manager__c,
                   Territory_Manager__r.Is_Deleted__c
            FROM zip_code_assigment__c
            WHERE Activated__c = TRUE
              AND sync_account_Lead__c = TRUE
        ]) {
            if (zip.zip_code__c != null) {
                zipOwnerMap.put(zip.zip_code__c.trim(), zip);
            }
        }
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT Id, State, Country, PostalCode, OwnerId
            FROM Lead
            WHERE State != null AND Country != null
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        List<Lead> leadsToUpdate = new List<Lead>();

        List<Territory_Manager__c> tms = [
            SELECT Id, State__c, country__c, zip_code__c,
                   Account_Manager__c, Activated__c, sync_account_Lead__c, Is_Deleted__c
            FROM Territory_Manager__c
            WHERE Activated__c = true AND sync_account_Lead__c = true
        ];

        for (Lead l : scope) {
            for (Territory_Manager__c tm : tms) {
                Boolean matchState = l.State?.trim().toLowerCase() == tm.State_Code__c?.trim().toLowerCase();
                Boolean matchCountry = l.Country?.trim().toLowerCase() == tm.Country_Code__c?.trim().toLowerCase();

                if (matchState && matchCountry) {
                    if (tm.zip_code__c != null) {
                        String postalCode = l.PostalCode?.trim();
                        if (postalCode != null && zipOwnerMap.containsKey(postalCode)) {
                            zip_code_assigment__c zip = zipOwnerMap.get(postalCode);
                            if (zip.Territory_Manager__c == tm.Id) {
                                l.OwnerId = tm.Is_Deleted__c ? submitUserId : tm.Account_Manager__c;
                                leadsToUpdate.add(l);
                                break;
                            }
                        }
                    } else {
                        l.OwnerId = tm.Is_Deleted__c ? submitUserId : tm.Account_Manager__c;
                        leadsToUpdate.add(l);
                        break;
                    }
                }
            }
        }

        if (!leadsToUpdate.isEmpty()) {
            update leadsToUpdate;
        }
    }

    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(new AccountOwnerUpdateBatch(submitUserId));
    }
}