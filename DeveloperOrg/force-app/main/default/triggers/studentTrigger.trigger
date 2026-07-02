trigger studentTrigger on students__c (before insert,before update) {
       
               accountupdateIndustry.stuMethod(Trigger.New);

            
}