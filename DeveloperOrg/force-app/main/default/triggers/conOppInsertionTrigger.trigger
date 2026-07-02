trigger conOppInsertionTrigger on Account (After insert,before Insert) {
    if(Trigger.IsAfter && Trigger.isInsert){
        objectsob.myMethod1(Trigger.New);
    }
    
}