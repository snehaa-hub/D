public class AccountOwnerUpdateBatch implements Database.Batchable<SObject>, Database.Stateful {

    Map<String, zip_code_assigment__c> zipOwnerMap = new Map<String, zip_code_assigment__c>();
    Id submitUserId;

    public AccountOwnerUpdateBatch(Id currentUserId) {
        this.submitUserId = currentUserId;

        for (zip_code_assigment__c zip : [
            SELECT Id, zip_code__c,
                   Territory_Manager__c,
                   Territory_Manager__r.State__c,
                   Territory_Manager__r.country__c,
                   Territory_Manager__r.zip_code__c,
                   Territory_Manager__r.Account_Manager__c,
                   Territory_Manager__r.Activated__c,
                   Territory_Manager__r.sync_account_Lead__c,
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
            SELECT Id, BillingState, BillingCountry, BillingPostalCode, OwnerId
            FROM Account
            WHERE BillingState != NULL AND BillingCountry != NULL
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        List<Account> toUpdate = new List<Account>();

        List<Territory_Manager__c> tms = [
            SELECT Id, State__c, country__c, zip_code__c,
                   Account_Manager__c, Activated__c, sync_account_Lead__c, Is_Deleted__c
            FROM Territory_Manager__c
            WHERE Activated__c = true AND sync_account_Lead__c = true
        ];

        for (Account acc : scope) {
            for (Territory_Manager__c tm : tms) {
                Boolean matchState = acc.BillingState?.trim().toLowerCase() == tm.State__c?.trim().toLowerCase();
                Boolean matchCountry = acc.BillingCountry?.trim().toLowerCase() == tm.country__c?.trim().toLowerCase();

                if (matchState && matchCountry) {
                    if (tm.zip_code__c != null) {
                        String postalCode = acc.BillingPostalCode?.trim();
                        if (postalCode != null && zipOwnerMap.containsKey(postalCode)) {
                            zip_code_assigment__c zipOwner = zipOwnerMap.get(postalCode);
                            if (zipOwner.Territory_Manager__c == tm.Id) {
                                acc.OwnerId = tm.Is_Deleted__c ? submitUserId : tm.Account_Manager__c;
                                toUpdate.add(acc);
                                break;
                            }
                        }
                    } else {
                        acc.OwnerId = tm.Is_Deleted__c ? submitUserId : tm.Account_Manager__c;
                        toUpdate.add(acc);
                        break;
                    }
                }
            }
        }

        if (!toUpdate.isEmpty()) {
            update toUpdate;
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Set Sync_Account_c = false and delete if Is_Deleted_c is true
        List<Territory_Manager__c> tmToUpdate = new List<Territory_Manager__c>();
        List<Territory_Manager__c> tmToDelete = new List<Territory_Manager__c>();
        for (Territory_Manager__c tm : [
            SELECT Id, Is_Deleted__c FROM Territory_Manager__c
            WHERE sync_account_Lead__c = true
        ]) {
            tm.sync_account_Lead__c = false;
            if (tm.Is_Deleted__c) {
                tmToDelete.add(tm);
            } else {
                tmToUpdate.add(tm);
            }
        }

        List<zip_code_assigment__c> zipToUpdate = new List<zip_code_assigment__c>();
        List<zip_code_assigment__c> zipToDelete = new List<zip_code_assigment__c>();
        for (zip_code_assigment__c zip : [
            SELECT Id, Territory_Manager__r.Is_Deleted__c
            FROM zip_code_assigment__c
            WHERE sync_account_Lead__c = true
        ]) {
            zip.sync_account_Lead__c = false;
            if (zip.Territory_Manager__r.Is_Deleted__c) {
                zipToDelete.add(zip);
            } else {
                zipToUpdate.add(zip);
            }
        }

        if (!tmToUpdate.isEmpty()) update tmToUpdate;
        if (!zipToUpdate.isEmpty()) update zipToUpdate;
        if (!tmToDelete.isEmpty()) delete tmToDelete;
        if (!zipToDelete.isEmpty()) delete zipToDelete;

    }
}