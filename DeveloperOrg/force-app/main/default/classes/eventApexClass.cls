/**
* @File Name : eventApexClass.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : April 22, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | April 22, 2025 |   | Initial Version
**/

public class eventApexClass {

@AuraEnabled(cacheable=true)
public static List<Training_Event__c> getMyEvents() {
    return [
        SELECT Id, Name, Start_Date__c,
               (SELECT Id, Participant__r.Name, Status__c FROM Registration__r)
        FROM Training_Event__c
        WHERE Training__c = :UserInfo.getUserId()];
}

}