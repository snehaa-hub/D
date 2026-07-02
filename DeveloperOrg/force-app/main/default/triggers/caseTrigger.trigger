trigger caseTrigger on Case (before Insert) {
    
    for(Case CA :Trigger.new){
        if(CA.Origin == 'Email' && CA.Subject.Contains ('Urgent')){
            CA.Priority ='High';
        }
    }
   
}