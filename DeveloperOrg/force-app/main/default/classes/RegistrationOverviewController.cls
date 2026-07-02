/**
* @File Name :  registrationOverviewController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : April 24, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | April 24, 2025 |   | Initial Version
**/

public with sharing class RegistrationOverviewController {
    @AuraEnabled(cacheable=true)
    public static List<Registration__c> getAllRegistrations(String statusFilter) {
        String query = 'SELECT Id, Status__c, Participant__r.Name, Training_Event__r.Name FROM Registration__c';
        if (!String.isBlank(statusFilter) && statusFilter != 'All') {
            query += ' WHERE Status__c = :statusFilter';
        }
        return Database.query(query);
    }
}