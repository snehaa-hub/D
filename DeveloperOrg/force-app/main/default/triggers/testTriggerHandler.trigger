trigger testTriggerHandler on Training_Event__c (before insert,before update) {
    for (Training_Event__c train : (Trigger.New)){
        
        if(train.Location__c==Null){
        train.Type__c= 'Client';
        }
    }

}