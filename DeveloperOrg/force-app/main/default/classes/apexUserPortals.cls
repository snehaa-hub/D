/**
* @File Name : apexUserPortals.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : August 7, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | August 7, 2025 |   | Initial Version
**/


    
    public with sharing class apexUserPortals {
    
    @AuraEnabled
    public static String saveJobApplication(userProtals__c user) {
        try {
            insert user;
            
            return 'Record Created Successfully';
        } catch (Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }
}