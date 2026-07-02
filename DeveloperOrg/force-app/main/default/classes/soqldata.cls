public class soqldata {
    public static void myMethod(){
           List<Account> lstAcc = [Select id, name, Type, Industry, AnnualRevenue, Rating, Fax  from Account 
                                                                 Where Industry In ('Banking','Education','Chemicals') ];
			

        for(Account acc : lstAcc)	{
            system.debug('lstAcc'+lstAcc);							

        }
    }
     Public static void conText(){
           List<Contact> conlist = [SELECT Id,Name,LastName From Contact Order by Name LIMIT 10 offset 10 ];
        for(Contact con : conlist){
                system.debug('conlist' + conlist);
    }
 }

 public static void thisMethod(){
           List<Account> Accrecord = [Select id, name, Type, Industry, AnnualRevenue, Rating, Fax  from Account where Name 
                                                                 LiKE 'ra%'];
			

        for(Account acc : Accrecord)	{
            system.debug('Accrecord'+Accrecord);		
    }
}
    public static void recMethod(){
        List<Account> Accrec = [SELECT Id, Name FROM Account WHERE Id  IN (SELECT AccountId FROM Opportunity)];
     for(Account acc : Accrec)	{
            system.debug('Accrec'+Accrec);		
     }
}
     public static void deleteMethod(){
    List<Account>del =[Select Id From Account WHERE Name LIKE 'AAA%'];
    delete del;
   
     }
    public static void undeleteMethod(){
        List<account>undel =[SELECT Id,Name From Account WHERE Name LIKE 'WWW%' And IsDeleted = True All ROWS];
         undelete undel;
  }

     public static void oppMethod(){
        List<opportunity> opp1 = [SELECT Name,CloseDate FROM opportunity WHERE Amount < 1000 ORDER BY Name];
    
 }
    public static void accMethod(){
        List<Account> Accitem = [SELECT Name,Type FROM Account WHERE Type = 'Propect'];
         for(Account acc : Accitem)	{
            system.debug('Accitem'+Accitem);		
     }
    
 }
     public static void conMethod(){
    List<contact>conid =[SELECT Name,Account.Name FROM Contact ];
     }   
    public static void oppsec(){
         List<opportunity> oppid =[SELECT Name,Amount,StageName FROM opportunity WHERE Amount >=100000 AND StageName ='Closed Won'];
        system.debug('oppid'+oppid);
    }
}

//SELECT Id FROM Account WHERE Id NOT IN(SELECT AccountId  FROM Contact)
//SELECT Id, (SELECT LastName FROM Contacts),(SELECT Name FROM opportunities) FROM Account