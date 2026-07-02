public with sharing class TerritorySummaryController {
@AuraEnabled
public static List<String> getTerritoryNames() {
    List<String> names = new List<String>();
    for (Territory_Manager__c tm : [
        SELECT Name 
        FROM Territory_Manager__c 
        WHERE Activated__c = TRUE AND sync_account_Lead__c = TRUE
    ]) {
        names.add(tm.Name);
    }
    return names;
}
    @AuraEnabled(cacheable=true)
public static List<User> getAccountManager (String searchTerm) {
    Set<Id> userIds = new Set<Id>();
    for (Territory_Manager__c tm : [
            SELECT Account_Manager__c FROM Territory_Manager__c WHERE Account_Manager__c != null AND Activated__c = TRUE
              AND sync_account_Lead__c = TRUE
        ]) {
        userIds.add(tm.Account_Manager__c);
    }
    try {
        return [
            SELECT Id, Name FROM User  
            WHERE  
                Id IN :userIds 
            AND Name LIKE :('%' + searchTerm + '%')
            ORDER BY Name 
        ];
    } catch (Exception ex) {
        throw new AuraHandledException('An error occurred: ' + ex.getMessage());
    }
}

@AuraEnabled(cacheable=true)
public static List<String> getZipCodesByTerritories(List<String> territoryNames) {
    List<String> zipCodes = new List<String>();
    if (territoryNames == null || territoryNames.isEmpty()) return zipCodes;

    for (zip_code_assigment__c zip : [
        SELECT zip_code__c

        FROM zip_code_assigment__c
        WHERE  Activated__c = TRUE
              AND sync_account_Lead__c = TRUE AND Territory_Manager__r.Name IN :territoryNames
    ]) {
        zipCodes.add(zip.zip_code__c);
    }
    return zipCodes;
}

@AuraEnabled(cacheable=true)
public static List<String> getManagersByTerritories(List<String> territoryNames) {
    Set<String> uniqueMgrs = new Set<String>();
    if (territoryNames == null || territoryNames.isEmpty()) return new List<String>();


    for (Territory_Manager__c tm : [
        SELECT Account_Manager__r.Name
        FROM Territory_Manager__c
        WHERE Name IN :territoryNames
    ]) {
        if (tm.Account_Manager__r != null) {
            uniqueMgrs.add(tm.Account_Manager__r.Name);
        }
    }
    return new List<String>(uniqueMgrs);
}
    @AuraEnabled(cacheable=true)
    public static List<Territory_Manager__c> getTerritoryManagers (String searchTerm) {
try {
    return [
        SELECT Id, Name
        FROM Territory_Manager__c
        WHERE  Activated__c = TRUE
              AND sync_account_Lead__c = TRUE
             AND Name LIKE :('%' + searchTerm + '%')
        ORDER BY Name
    ];
} catch (Exception ex) {
    throw new AuraHandledException('An error occurred: ' + ex.getMessage());
}
}

@AuraEnabled
public static List<Map<String, Object>> getSummaryData(
    List<String> territories,
    List<String> zipCodes,
    List<String> managers
) {
    List<Map<String, Object>> resultList = new List<Map<String, Object>>();
    Boolean isManagerMode = (managers != null && !managers.isEmpty());

    // Step 1: Get Territory Managers
    List<Territory_Manager__c> tms;
    if (isManagerMode) {
        tms = [SELECT Id, Name, country__c, State__c, Account_Manager__r.Name
               FROM Territory_Manager__c
               WHERE Account_Manager__r.Name IN :managers AND sync_account_Lead__c = TRUE AND Activated__c = TRUE];
    } else if (territories != null && !territories.isEmpty()) {
        tms = [SELECT Id, Name, country__c, State__c, Account_Manager__r.Name
               FROM Territory_Manager__c
               WHERE Name IN :territories AND sync_account_Lead__c = TRUE AND Activated__c = TRUE];
    } else {
        tms = [SELECT Id, Name, country__c, State__c, Account_Manager__r.Name
               FROM Territory_Manager__c
               WHERE sync_account_Lead__c = TRUE AND Activated__c = TRUE];
    }

    // Step 2: Map Territory Name to Zip Codes
    Map<String, Set<String>> territoryZipMap = new Map<String, Set<String>>();
    Set<String> tmNames = new Set<String>();
    for (Territory_Manager__c tm : tms) {
        tmNames.add(tm.Name);
    }

    for (zip_code_assigment__c zip : [
        SELECT zip_code__c, Territory_Manager__r.Name
        FROM zip_code_assigment__c
        WHERE Territory_Manager__r.Name IN :tmNames AND Activated__c = TRUE
              AND sync_account_Lead__c = TRUE
    ]) {
        String tName = zip.Territory_Manager__r.Name;
        if (!territoryZipMap.containsKey(tName)) {
            territoryZipMap.put(tName, new Set<String>());
        }
        territoryZipMap.get(tName).add(zip.zip_code__c);
    }

    // Step 3: Get All Accounts and Leads
    List<Account> accounts = [SELECT BillingCountry, BillingState, BillingPostalCode FROM Account];
    List<Lead> leads = [SELECT Country, State, PostalCode FROM Lead];

    // Step 4: Matching
    for (Territory_Manager__c tm : tms) {
        String tName = tm.Name;
        String manager = tm.Account_Manager__r != null ? tm.Account_Manager__r.Name : '';
        Set<String> zipSet = territoryZipMap.get(tName) != null ? territoryZipMap.get(tName) : new Set<String>();

        // Step 4a: Filter out non-matching zipCodes if zipCodes filter is provided (only in territory mode)
        if (!isManagerMode && (zipCodes != null && !zipCodes.isEmpty())) {
            Boolean matchZip = false;
            for (String zip : zipCodes) {
                if (zipSet.contains(zip)) {
                    matchZip = true;
                    break;
                }
            }
            if (!matchZip) continue; // skip TM if no zip match
        }

        // Step 4b: Account matching
        Integer accCount = 0;
        for (Account acc : accounts) {
            Boolean accMatch =
                acc.BillingCountry == tm.country__c &&
                acc.BillingState == tm.State__c;

            if (isManagerMode) {
                if (accMatch) accCount++;
            } else if (zipCodes != null && !zipCodes.isEmpty()) {
                if (accMatch && zipCodes.contains(acc.BillingPostalCode)) accCount++;
            } else if (!zipSet.isEmpty()) {
                if (accMatch && zipSet.contains(acc.BillingPostalCode)) accCount++;
            } else {
                if (accMatch) accCount++;
            }
        }

        // Step 4c: Lead matching
        Integer leadCount = 0;
        for (Lead l : leads) {
            Boolean leadMatch =
                l.Country == tm.country__c &&
                l.State == tm.State__c;

            if (isManagerMode) {
                if (leadMatch) leadCount++;
            } else if (zipCodes != null && !zipCodes.isEmpty()) {
                if (leadMatch && zipCodes.contains(l.PostalCode)) leadCount++;
            } else if (!zipSet.isEmpty()) {
                if (leadMatch && zipSet.contains(l.PostalCode)) leadCount++;
            } else {
                if (leadMatch) leadCount++;
            }
        }

        // Step 5: Add to results
        if (accCount > 0) {
            resultList.add(new Map<String, Object>{
                'Id' => tm.Id,
                'TerritoryName' => tName,
                'Manager' => manager,
                'Type' => 'Account',
                'Count' => accCount
            });
        }

        if (leadCount > 0) {
            resultList.add(new Map<String, Object>{
                'Id' => tm.Id,
                'TerritoryName' => tName,
                'Manager' => manager,
                'Type' => 'Lead',
                'Count' => leadCount
            });
        }
    }

    return resultList;
}

@AuraEnabled
public static void accountChange() {
    Id userId = UserInfo.getUserId();
    Database.executeBatch(new AccountLeadOwnershipBatch(userId),200);

    
}
}