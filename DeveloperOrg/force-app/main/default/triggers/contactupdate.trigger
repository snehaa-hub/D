trigger contactupdate on Contact (After insert) {
    
   /* contactUser.concreateuser(Trigger.new);*/
   
       if(Trigger.isAfter && Trigger.isInsert){
        rollupsummary.rollup(Trigger.new); 
           
}
}