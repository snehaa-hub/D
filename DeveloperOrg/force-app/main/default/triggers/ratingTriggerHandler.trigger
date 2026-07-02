trigger ratingTriggerHandler on Account (before insert, before update) {
    
   
  
        for(Account acc: Trigger.New){
               if(acc.Legacy_ERP__c != null && 
                  acc.Legacy_ERP__c.contains('Legacy Org A') && 
                  acc.Legacy_ERP__c.contains('Legacy Org B')) {
                  acc.Legacy_ERP__c.addError('You cannot select both Legacy Org A and Legacy Org B');
}
        }
          }