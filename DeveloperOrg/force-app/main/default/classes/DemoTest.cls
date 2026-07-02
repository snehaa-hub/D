@isTest
private class DemoTest {
    @istest
    public static void object(){
         system.debug('From initializeData');

        Account acc=new Account();
        acc.Name='Mthra';
        acc.Type='Customer - Direct';
        insert acc;
        
        contact con =new contact();
        con.LastName='Manoj';
        con.AccountId=acc.Id;
         insert con;
        Test.startTest();
        system.enqueuejob(new QueueClass());
         Test.stopTest();
        contact concon=[Select Name,priority__c FROM contact Where Id= :con.Id];
        system.assertEquals('High',concon.priority__c,'error');
    }        
}