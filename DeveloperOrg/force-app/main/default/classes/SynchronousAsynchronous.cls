public class SynchronousAsynchronous implements Schedulable {
    public  void execute (SchedulableContext sc){
    Account acc=new Account();
       acc.Name='kanmani';
       acc.phone='546781239';
       Insert acc;
        
    Contact con=new Contact();
        con.FirstName='s';
        con.LastName='Hritiik';
        con.AccountId=acc.Id;
        Insert con;
   }
 }