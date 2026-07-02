public class AccountRecord {
    public static void conacc(){
        Account acc=[SELECT Id FROM Account WHERE Name ='CCT' LIMIT 1];
        
        Contact fetch = New Contact();
        fetch.LastName = 'vasanthy';
        fetch.FirstName = 'P.G';
        fetch.AccountId = acc.Id;
        insert fetch;
        system.debug(fetch);
        
    }
    public static void conopp(){
        Contact con =[SELECT Id,LastName, AccountId FROM Contact WHERE LastName ='vasanthy' LIMIT 1];
        
        opportunity opp = New opportunity();
        opp.Name = 'sarkar';
        opp.StageName = 'Closed Won';
        opp.CloseDate =Date.Today();
        opp.AccountId = con.AccountId;
        opp.ContactId=con.Id;
        insert opp;
        system.debug(opp);
    }
    public static void object(){
        
        List<sobject> record =New List<sobject>();
        
        Account acc =New Account();
        acc.Name='raj';
        record.add(acc);
        
        contact con= New contact();
        con.LastName='prashanth';
        record.add(con);
        
        
        opportunity opp= New opportunity();
        opp.Name='zara';
        opp.CloseDate=system.Today();
        opp.StageName='Closed Lost';
        record.add(opp);
        insert record;
    }
    
     public static void account(List<Account> accountList,Map<Id,Account> accountOldMap){
        Map<Id,Account> accountMap = new Map<Id,Account>();
       
        for(Account getAccount: accountList){
            Account oldAccount = accountOldMap.get(getAccount.Id);
            if(oldAccount.BillingAddress  != getAccount.BillingAddress){
                accountMap.put(getAccount.Id, getAccount);
            }
          }
       
         List<Contact> contactList =[Select MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry
                                    FROM Contact WHERE AccountId IN :accountMap.keySet()];
       
        for(Contact getContact : contactList){
                getContact.MailingStreet = accountMap.get(getContact.AccountId).BillingStreet;
                getContact.MailingCity = accountMap.get(getContact.AccountId).BillingCity;
                getContact.MailingState = accountMap.get(getContact.AccountId).BillingState;
                getContact.MailingCountry  = accountMap.get(getContact.AccountId).BillingCountry ;
                getContact.MailingPostalCode = accountMap.get(getContact.AccountId).BillingPostalCode;
        }
       
        if(!contactList.isEmpty()){
            UPDATE contactList;
        }
   
    }
}