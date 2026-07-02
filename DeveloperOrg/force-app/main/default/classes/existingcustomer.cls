public class existingcustomer {
    public static void testopp(List<Opportunity>opplist){
        List<Opportunity> opploop =new List<Opportunity>();
        for(Opportunity opp : opplist ){
            
            if(opp.StageName=='Closed won' ){
                opp.Type='Existing Customer Replacement';
            }   
            
        }
    }
    //if account type is Prospect I want to update contact to  High
    
    public static void accountupdate(List<Account> accupdate){
        set<Id> accids = new set<Id>();
        for(Account acc: accupdate){
            if(acc.Type =='Prospect'){
                accids.add(acc.Id);
                
                
            }
            
        }
        List<contact> conToUpdate = new List<contact>();
        List<contact> conList = [select Id from contact where AccountId IN : accids];
        
        for(contact con : conList){
            con.priority__c = 'High';
            conToUpdate.add(con);
        }
        
        update conList;
        
    }
    //when case is Escalated my case ownerId Should resive email;
    public static void CA(List<case> caseList){
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(case con : caseList){
            if(con.status=='Escalated'){
                User owner = [select Id,Email from User Where Id =:con.ownerId LIMIT 1];
                if(owner.Email!=NULL){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new String[] { owner.Email});
                    mail.setSubject('Case Escalated');
                    mail.setPlainTextBody('Hello, your case "' + mail.Subject + '" has been escalated.');
                    emailList.add(mail);
                }
            }
        }
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }
        
    }
    //if my contact is in Leadsoruce=phone Inquiry prevent deletion
    public static void preventing(List<contact>conlist){
        for(contact C : conlist ){
            if(C.LeadSource =='phone Inquiry'){
                C.addError('prevent deletion');
            }
        }
    }
    //if Account type is technology partner related contact should not delete
    public static void Deleteli (List<Contact> listacc) {
        set<Id> setId = new set<Id>();
        for(Contact con:listacc) {
            system.debug('Contact Name'+ con.LastName);
            if(con.AccountId!= null) {
                setId.add(con.AccountId);
            }
        }
        
        Map<Id,Contact> conqurery = new Map<Id,Contact>([SELECT Id, Name,Account.Type FROM Contact WHERE AccountId IN: setId and Account.Type='Technology Partner']);
         system.debug('Contact conqurery '+ conqurery);
        for(Contact contact1:listacc) {
            if(conqurery.containsKey(contact1.Id)){
                contact1.addError('Account is Technology partner you dont delete contact');
            }
        }
    }
    
}