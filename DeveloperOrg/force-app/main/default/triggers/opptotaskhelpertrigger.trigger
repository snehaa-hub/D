trigger opptotaskhelpertrigger on Opportunity (before Update) {


     if  (Trigger.isBefore && Trigger.isupdate){

         for(Opportunity opp: Trigger.new) {
           if(opp.CloseDate == System.Today()){
               opp.Demo_Completed__c = true;
           } 
         }
  /*  if  (Trigger.isAfter && Trigger.isInsert){
         
         objectsob.oppmethed(Trigger.New);*/


}
}