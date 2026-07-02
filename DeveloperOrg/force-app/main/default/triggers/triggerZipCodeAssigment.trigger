trigger triggerZipCodeAssigment on zip_code_assigment__c (before insert,before update) {
    if(Trigger.isBefore && Trigger.isInsert || Trigger.isupdate){
        for(zip_code_assigment__c  zip:Trigger.New){
            zip.sync_account_Lead__c=True;
        }
    }

}