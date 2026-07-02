public class sizeIncerseClass{
    public static void accountTocontact(List<Account> accList){
        
    List<Contact> Condate = new List<Contact>();
        
    for(Account acc : accList){
        if(acc.Industry=='Banking'){
        
        contact con = new contact();
        con.LastName= acc.Name +'Duplicate';
        con.FirstName = acc.Name;
        con.Id= acc.Id;
          
        Condate.add(con);
        }   
    }
        insert Condate;
    }
}