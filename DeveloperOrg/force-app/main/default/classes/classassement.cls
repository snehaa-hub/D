public class classassement {
    //Team C
    // 1
    public static void billing (List<Account> accList){
      // List<Account> listToUpdate = new List<Account>(); 
        for(Account acc : accList ){
            if(acc.ShippingCity==null && acc.ShippingState==null &&  acc.ShippingCountry==null && acc.ShippingStreet==null && acc.ShippingPostalCode==null){
               acc.ShippingCity =acc.BillingCity ;
               acc.ShippingState = acc.BillingState ;
               acc.ShippingCountry  = acc.BillingCountry;
               acc.ShippingStreet=  acc.BillingStreet; 
               acc.ShippingPostalCode =acc.BillingPostalCode ;
              
            }
		}
    }
    //Team C
    // 2
   public static void discount(List<Opportunity> opplist){
        for(Opportunity opp :opplist){
            if(opp.Discount__c >= 30){
                opp.addError('you cannot save');
          } 
        }
     }
    //Team C
    // 3
    public static void Createtask(List<Contact> conlist){
        List<Task> taskList = new List<Task>();
        for(contact con : conlist){
        
        Task task = new Task();
        task.Status ='In Progress';
        task.ActivityDate = Date.today().addDays(7);
        task.Subject='I Created Task';
        task.WhoId = con.Id;
        task.OwnerId = con.OwnerId;
        taskList.add(task);

        }
        insert taskList;
    }
    //Team c
    // 4
      public static void undeleted(List<Account>acclist){
          List<Account>Activeacc =new  List<Account>();
        for(Account acc:acclist ){
            if(acc.Status__c !='Active'){
                Activeacc.add(new Account(Id=acc.Id,Status__c='Active') );
                
                }
        }
          update Activeacc;
    }
    
}