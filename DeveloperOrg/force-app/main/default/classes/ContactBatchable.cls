public class ContactBatchable implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id,Status__c,Industry FROM Account]);
    }
  public void execute(Database.BatchableContext bc, List<Account> accloop) {
       List<contact> contacts=new  List<contact>();
        for(Account acc: accloop){
        if(acc.Status__c=='Active'){
            (acc.Industry='Agriculture');
        }
                contact c=new contact();
                c.FirstName='s';
                c.LastName='Apex';
                c.AccountId=acc.Id;
                  contacts.add(c);
            
            contact Con=new contact();
               Con.FirstName='T';
               Con.LastName='Apex';
                Con.AccountId=acc.Id;
                  contacts.add(Con);
                
                if(!contacts.IsEmpty()){
                     insert contacts;
            }
    } 
        }
     public void finish(Database.BatchableContext bc) {
        
       system.debug('Account batch');             
    }
    }