public class AccountEmail {
   /* public static void ContactEmail(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
    // Map to hold accountId => new Email
    Map<Id, String> updatedEmails = new Map<Id, String>(); //------------ updatedEmails are use to create Instance for map

    for (Account acc : newAccounts) {//--------forloop is for bulk records /con (forloop)
        Account oldAcc = oldAccountMap.get(acc.Id);//--------is for oldMap /conId
        if (acc.Email__c != oldAcc.Email__c) {//--------to make sure old value is changed/con name
            updatedEmails.put(acc.Id, acc.Email__c);//---------putting the stored email and Id into an map instance
        } 
        //storing the accountId and see weather acc.email is not equal to old email an store in map Instance in it
        
    }

    if (!updatedEmails.isEmpty()) {//---------seeing if it is not empty
        
        List<Contact> contactsToUpdate = new List<Contact>();//--------creates a List Instance of contact
         // Query related contacts
        for (Contact con : [SELECT Id, Email, AccountId FROM Contact WHERE AccountId IN :updatedEmails.keySet()]) {//----we are querying Inside forloop to fetch AccountId in contact and store in map varable
            String newEmail = updatedEmails.get(con.AccountId);//--------updateing a new email to AccountId
            if (newEmail != null && con.Email != newEmail) {//------see if old value is not equal to new value
                
                con.Email = newEmail;//------if it is new value
                contactsToUpdate.add(con);//----add to List
            }
        }

      
            update contactsToUpdate; //--------DML update
        }
    }*/
    public static void contacttoaccount(List<contact> conloop){
        Map<Id,String>maptoAccount=New Map<Id,String>();
         system.debug('conloop 1');
        for(contact con :conloop){
            system.debug('conloop 2');
                           if(con.AccountId !=NULL  && con.Email !=NULL ){
                               system.debug('if 1');
                    maptoAccount.put(con.AccountId,con.Email);
                    system.debug('conemail');
                }
            
        }
        List<Account> acclist =  New  List<Account>();
        List<Account> accloop =[SELECT Id,Email__c from Account Where Id IN :maptoAccount.keyset()];
          system.debug(' accloop 1');
        for(Account acc :  accloop ){
            string newEmail =maptoAccount.get(acc.Id);
            system.debug(' accloop ');
            if(newEmail !=NULL && acc.Email__c !=newEmail){
                system.debug(' accloop 2');
                acc.Email__c=newEmail;
                acclist.add(acc);        
                  system.debug('newemail');
            }
            update  acclist;
            system.debug('acclist');
        }
        
    }
   /* public static void phonefelid(List<Account>accloop){
        for(Account acc:accloop){
            if(acc.Phone.length() != 10 ){
                acc.addError('phone must be 10 Number');
            }
        }
        
    }*/
  public static void erroriftrue(List<Account>acclist){
        for(Account acc:acclist) {
            if(acc.Active__c == 'Yes' ){
                acc.addError('Active is true it wont delete');
            }
        }
  }
}