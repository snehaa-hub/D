trigger managertrigger on Territory_Manager__c (before insert,before update) {
    if(Trigger.isBefore && Trigger.isInsert || Trigger.isupdate){
        for(Territory_Manager__c TM :Trigger.new) {
               TM.sync_account_Lead__c=True;
            }
        }
    }