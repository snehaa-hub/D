//my type is VIP then i want to check my cheack box
trigger customtrigger on Customer_Type__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Customer_Type__c custom : Trigger.New){
            if(custom.Type__c =='VIP'){
                custom.Active__c=True;
            }
        }
    }
}