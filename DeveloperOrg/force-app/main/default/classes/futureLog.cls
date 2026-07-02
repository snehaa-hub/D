public class futureLog {
    @Future
    public static void logss(set<Id>conId){
        List<Async_Log__c> logs=new List<Async_Log__c>();
        for(Id contactId  :conId){
             Async_Log__c log =new Async_Log__c();
            log.Contact__c=contactId;
            log.Action__c='update contact as Inactive';
            log.Logged_Date__c=system.now();
            logs.add(log);
        }
        insert logs;
    }
}