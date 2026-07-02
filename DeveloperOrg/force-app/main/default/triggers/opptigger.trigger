trigger opptigger on Opportunity (before insert,before update,after insert,after update) {


     //Team C
    // 2
   
   // if(Trigger.isBefore) {
   // if(Trigger.isUpdate){
      //   classassement.discount(Trigger.new);   
    
    if(Trigger.isBefore  && Trigger.isupdate) {
       existingcustomer.testopp(Trigger.new);  
  }
     if(Trigger.isAfter  && Trigger.isupdate) {
          existingcustomer.testopp(Trigger.new);
      // opptotask.OLI(Trigger.newMap);  
  }
}