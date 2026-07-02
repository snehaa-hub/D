@isTest
private class futuredemotest {
    @istest
    public static void testcreateaccount(){
        Test.starttest();
         futureDemo.demo();
         Test.StopTest();
         Integer counter = [SELECT Count()  FROM Account];
           system.AssertEquals(1 ,counter,'please check your Bussness');                 
    }
}