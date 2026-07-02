public class accountcreatecontact {
   public static void create(List<Account>create){
     List<contact> contacts = New  List<contact>();  
        for(account acc:create){    
    Contact C=new Contact();
     C.LastName='priya';
     C.AccountId=acc.Id;
      contacts.add(C);
   
    if(!contacts.IsEmpty()){
    insert contacts;
}
        }
    }
}