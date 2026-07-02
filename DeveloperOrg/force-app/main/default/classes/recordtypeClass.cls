public class recordtypeClass {
    
    public static void sendingMeassage(){
        
        List<RecordType> createRecord =[Select Id, Name, DeveloperName FROM RecordType Where Name = 'Customer Account'];
        
      //  List<Account> acclist =;
        List<Account> accloop=new  List<Account>();
        for(Account acc:[Select Id, RecordTypeId From Account WHERE RecordTypeId IN :createRecord]){
            Account account=new Account();
            account.Id=acc.Id;
            account.Meassage__c	='This Record Has Been Created';
            accloop.add(account);
        }
        update accloop;
    }
}