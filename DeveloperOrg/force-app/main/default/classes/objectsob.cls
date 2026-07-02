/*public class objectsob {
    public static void myMethod(){
   
            Contact con= new Contact();
              con.LastName='Potter';
              con.FirstName = 'HARRY' ;
              con.Phone= '4560123067';
              insert con;
              System.debug('Contact created'+con);
                  }
}

    }
}
        
   public class objectsob {
    public static void myMethod(){

   book__c book =[SELECT Id FROM Book__c LIMIT 1];   
        
        Person__c P1 = New Person__c();
         P1.Name = 'riya';
         P1.Date__c =system.Today()+2;
        P1.book__c = book.Id;
        insert P1;
        system.debug('Person__c created'+P1);
   }
 }
  public class objectsob {
    public static void myMethod(){

       List<company__c> company =[SELECT Id FROM company__c LIMIT 2];  
         if (company.size() >= 2) {
               customer__c c1=New customer__c();
                  c1.Name = 'path';
                  c1.company__c =company[0].id;
                
        customer__c c2=New customer__c();
                  c2.Name = 'ath';
                  c2.company__c =company[1].id;
                  insert New List<customer__c>{c1,c2};
                   system.debug('customer__c 1 created'+c1);
                   system.debug('customer__c  2 created'+c2);
    }
        else{
              system.debug('Record not found');
        }
  }
  }*/
 public class objectsob {
    public static void myMethod1(List<Account> accList){

  List<Contact> conList =new List<Contact>();
  List<Opportunity> oppList =New List<Opportunity>();
     
        for (Account acc : accList) {
       
         Contact con= New contact();
                con.LastName= acc.Name;
                con.Phone='2345612346';
                con.AccountId = acc.Id;
                conList.add(con);
               
      
         Opportunity opp = New Opportunity();
                 opp.Name = acc.Name;
                 opp.stageName ='Closed Lost';
                 opp.CloseDate = system.today();
                 opp.AccountId= acc.Id;
                 oppList.add(opp);
                 
                
             system.debug('Account acc created'+acc);
                system.debug('contact con created'+con);
                system.debug('Opportunity opp created'+opp);
       }
        if(!conList.isEmpty()){
            insert conList;
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
 }