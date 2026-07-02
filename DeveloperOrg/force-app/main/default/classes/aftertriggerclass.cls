public class aftertriggerclass {
    public static void classMethod(List<Account> accClass){
       
        List<Contact> conList =new List<Contact>();
        
        for(Account acc : accClass){
       
            contact con= new contact();   
            con.FirstName = 'S. ';
            con.LastName =acc.Name;
            con.Email =acc.Name+'@123.com';
            con.AccountId = acc.Id;
            conList.add(con);
            
            }
           insert conlist;

    }
    
}