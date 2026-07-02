/**
* @File Name : OpportunityController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : March 18, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | March 18, 2025 |   | Initial Version
**/
	public with sharing class OpportunityController { //With sharing -> OWD and sharing
   
//    @AuraEnabled
//    public static void deleteOpportunity(String sid){
//       Opportunity opp = new Opportunity();
//       opp.Id = sid;
//       try{
//         delete as user opp; //User Mode
//       }catch(DMLException ex){
//         //throw new AuraHandledException(ex.getMessage());
//         throw new AuraHandledException(Label.CLOSED_DEAL_ERROR);
//       }
//    }


    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAllOpportunities(){
        return [SELECT Name,StageName,Amount,CloseDate
                FROM Opportunity 
                WHERE Amount !=null
                WITH SECURITY_ENFORCED
                ORDER BY Amount DESC
                LIMIT 10]; //Checks CRED and FLS
    }

     @AuraEnabled(cacheable=true)
    public static List<Opportunity> getWonOpportunities(){
        return [SELECT Name,StageName,Amount,CloseDate
                FROM Opportunity
                WHERE StageName = 'Closed Won' 
                WITH SECURITY_ENFORCED]; //Checks CRED and FLS
    }

      @AuraEnabled(cacheable=true)
    public static List<Opportunity> getLostOpportunities(){
        return [SELECT Name,StageName,Amount,CloseDate
                FROM Opportunity
                WHERE StageName = 'Closed Lost' 
                WITH SECURITY_ENFORCED]; //Checks CRED and FLS
    }
}