trigger discountrequesttrigger on Discount_Request__c (before update) {

    for(Discount_Request__c dis:Trigger.New){
        if(dis.Requested_Discount__c <= 10) {
    dis.addError('You cannot delete a discount request with 10% or less.');
}

    }
}