public with sharing class TerritoryAccountLeadHandler  {

    @AuraEnabled(cacheable=true)
    public static List<String> getTerritoryNames() {
        List<Territory_Manager__c> tmList = [SELECT Name FROM Territory_Manager__c];
        List<String> names = new List<String>();
        for (Territory_Manager__c tm : tmList) {
            names.add(tm.Name);
        }
        return names;
    }

    @AuraEnabled(cacheable=true)
    public static List<String> getZipCodesByTerritories(List<String> territoryNames) {
        List<zip_code_assigment__c> zipList = [
            SELECT zip_code__c, Name FROM zip_code_assigment__c	
            WHERE Territory_Manager__r.Name IN :territoryNames
        ];
        List<String> zipCodes = new List<String>();
        for (zip_code_assigment__c	zip : zipList) {
            zipCodes.add(zip.Name+' : '+zip.zip_code__c);
        }
        return zipCodes;
    }

    @AuraEnabled(cacheable=true)
public static List<String> getManagersByTerritories(List<String> territoryNames) {
    List<Territory_Manager__c> tms = [
        SELECT Account_Manager__r.Name FROM Territory_Manager__c
        WHERE Name IN :territoryNames
    ];
    
    Set<String> uniqueMgrs = new Set<String>();
    for (Territory_Manager__c tm : tms) {
        if (tm.Account_Manager__r != null)
            uniqueMgrs.add(tm.Account_Manager__r.Name);
    }

    return new List<String>(uniqueMgrs);
}

   @AuraEnabled
public static List<Map<String, Object>> getSummaryData(List<String> territories, List<String> zipCodes, List<String> managers) {
    List<Map<String, Object>> finalList = new List<Map<String, Object>>();

    // Step 1: Get all matching TMs
    List<Territory_Manager__c> tms = [
        SELECT Id, Name, Country_Code__c, State_Code__c, Account_Manager__r.Name
        FROM Territory_Manager__c
        WHERE Name IN :territories
    ];

    // Step 2: Get Zip Code → TM mapping
    Map<String, Set<String>> territoryToZips = new Map<String, Set<String>>();
    for (zip_code_assigment__c	 z : [
        SELECT zip_code__c	, Territory_Manager__r.Name
        FROM zip_code_assigment__c	
        WHERE Territory_Manager__r.Name IN :territories
    ]) {
        String terr = z.Territory_Manager__r.Name;
        if (!territoryToZips.containsKey(terr)) {
            territoryToZips.put(terr, new Set<String>());
        }
        territoryToZips.get(terr).add(z.zip_code__c	);
    }

    // Step 3: All Accounts & Leads
    List<Account> accList = [SELECT BillingCountry, BillingState, BillingPostalCode FROM Account];
    List<Lead> leadList = [SELECT Country, State, PostalCode FROM Lead];

    // Step 4: Loop over each TM
    for (Territory_Manager__c tm : tms) {
        String tmName = tm.Name;
        String managerName = tm.Account_Manager__r != null ? tm.Account_Manager__r.Name : null;
        Set<String> tmZips = territoryToZips.get(tmName);

        // Manager filter
        if (managers != null && !managers.isEmpty() && (managerName == null || !managers.contains(managerName))) {
            continue;
        }

        // Prepare filtered zip list per TM
        Set<String> zipFilter = new Set<String>();
        if (zipCodes != null && !zipCodes.isEmpty()) {
            for (String z : zipCodes) {
                if (z.contains(':')) {
                    String zipOnly = z.substring(z.indexOf(':') + 1).trim();
                    if (tmZips.contains(zipOnly)) {
                        zipFilter.add(zipOnly);
                    }
                }
            }
            // Skip if no zip matches for this TM
            if (zipFilter.isEmpty()) continue;
        } else {
            zipFilter = tmZips; // no filter → use all
        }

        // Account Count
        Integer accCount = 0;
        for (Account a : accList) {
            if (a.BillingCountry == tm.Country_Code__c &&
                a.BillingState == tm.State_Code__c &&
                zipFilter.contains(a.BillingPostalCode)) {
                accCount++;
            }
        }

        // Lead Count
        Integer leadCount = 0;
        for (Lead l : leadList) {
            if (l.Country == tm.Country_Code__c &&
                l.State == tm.State_Code__c &&
                zipFilter.contains(l.PostalCode)) {
                leadCount++;
            }
        }

        // Add final results
        if (accCount > 0) {
            finalList.add(new Map<String, Object>{
                'Id' => tm.Id,
                'TerritoryName' => tmName,
                'ZipCodes' => String.join(new List<String>(zipFilter), ','),
                'Manager' => managerName,
                'Type' => 'Account',
                'Count' => accCount
            });
        }
        if (leadCount > 0) {
            finalList.add(new Map<String, Object>{
                'Id' => tm.Id,
                'TerritoryName' => tmName,
                'ZipCodes' => String.join(new List<String>(zipFilter), ','),
                'Manager' => managerName,
                'Type' => 'Lead',
                'Count' => leadCount
            });
        }
    }

    return finalList;
}
}