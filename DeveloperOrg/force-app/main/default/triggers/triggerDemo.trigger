trigger triggerDemo on Account (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if( Trigger.isBefore) {
        if(Trigger.isInsert){
         Samplertigger.sampleInsert(Trigger.new);   
        }
        if(Trigger.isUpdate){
         Samplertigger.sampleUpdate(Trigger.new);   
        }
        if(Trigger.isDelete){
         Samplertigger.sampleDelete(Trigger.old);   
        }
    }
    
    
   
}