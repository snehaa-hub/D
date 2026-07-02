public class soqlTest {
    public static void contactloop(){
        List<contact> conloop =[SELECT Id,LastName from contact where AccountId =NULL];

        for(contact con : conloop){
        system.debug(con);
        }
}  
    public static void opportunityrecord(){
        List<opportunity>opploop =[SELECT Id,Amount from Opportunity  where AccountId !=NULL Limit 5];
       
        for(opportunity opp : opploop){
             system.debug(opp);
        }
    }
         public static void contactIndustry(){
        List<contact> conlist =[SELECT Id,LastName,Account.Industry from contact where Account.Industry ='Banking'];

        for(contact con : conlist){
        system.debug(con);
        }
    }
     public static void opportunitystagename(){
        List<opportunity>opplist =[SELECT Id,StageName,Account.Name from Opportunity where StageName='Closed Won' OR StageName='Closed Lost' ];
       
        for(opportunity opp : opplist){
             system.debug(opp);
        }
    }
    public static void opportunitycase(){
        List<Account>acclist =[SELECT Id, Name FROM Account WHERE Id NOT IN (SELECT AccountId FROM Opportunity)AND Id IN ( SELECT AccountId FROM Case) ];
       
        for(Account acc : acclist){
             system.debug(acc);
        }
    }
    public static void relatedopportunity(){
        List<Account>acclist =[SELECT Id, Name ,(select Id,name from Opportunities) FROM Account WHERE CreatedDate =Last_N_Days:30  ];
       
        for(Account acc : acclist){
             system.debug(acc);
        }
    }
     public static void leadnotconverted(){
        List<Lead>leads =[SELECT Id, Name  FROM Lead WHERE CreatedDate =Last_N_Days:365 AND IsConverted =false];

        for(Lead lead :leads){
             system.debug(lead);
        }
    }
    public static void aggregatequery(){
    List<case> aggregateloop =[select Id,Subject,ContactId,contact.AccountId FROM case];
    
    for(case C : aggregateloop){
        system.debug(C);
    }
  }
}