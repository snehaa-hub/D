trigger createServiceScheduleforcontract on Contract (After insert) {
   if(Trigger.isAfter  && Trigger.isinsert){
       createServiceSchedule.contocreatess(trigger.New);
}
}