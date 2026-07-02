trigger aftertriggertrigger on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
    aftertriggerclass.classMethod(Trigger.new); 
           
}
 
    }