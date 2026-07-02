public class relationshipqurey {
    public static void rel1(){
     List<opportunity> opplist =[SELECT Id,Name,StageName,CloseDate,Account.Name,Account.Phone,Account.Industry FROM opportunity];

        for(opportunity opp :opplist){
            system.debug('Record of opplist : Name :'+opp.Name+ ', Account Name : '+opp.Account.Name+ ', Acc Phone : '+opp.Account.Phone+ ', Industry : '+opp.Account.Industry);
        }
    }
     public static void rel2(){
        List<opportunity> opplist1 =[SELECT Id,Name,StageName,CloseDate,Account.Name,Account.Industry FROM opportunity WHERE AccountId !=NULL];

        for(opportunity opp :opplist1){                          
            system.debug('Record of opplist : Name :'+opp.Name+ ', StageName : '+opp.StageName+ ', Acc Name : '+opp.Account.Name+ ', Industry : '+opp.Account.Industry);
        }
    }
     public static void rel3(){
        List<opportunity> opplist3=[SELECT Id,Name,StageName,CloseDate,Account.Name FROM opportunity WHERE AccountId=NULL];

        for(opportunity opp :opplist3){
            system.debug('Record of opplist : Name :'+opp.Name+ ', Account Name : '+opp.Account.Name);
        }
    }
     public static void rel4(){
        List<Account> accList =[SELECT Name, Rating, Industry,(Select Name,StageName,CloseDate FROM opportunities) FROM Account];
         for(Account acc :accList){
             system.debug('Account Name : '+acc.Name);
             system.debug('opp size -->'+acc.opportunities.size());
             for(opportunity opp :acc.opportunities){
                 system.debug('Record of opportunity : Name : '+opp.Name+ ', StageName : '+opp.StageName+ ', CloseDate : '+opp.CloseDate);
        	 }
             system.debug('-----------------------------------------------------------');
         }
    }
     public static void rel5(){
         List<Account> accTest =[SELECT Name, Rating, Industry,(SELECT Id, Name, StageName, CloseDate FROM opportunities) FROM Account
                                WHERE Id IN(SELECT AccountId FROM opportunity)];
           for(Account acc :accTest){
             system.debug('Account Name : '+acc.Name);
             for(opportunity opp :acc.opportunities){
                 system.debug('Record of opportunity : Name : '+opp.Name+ ', StageName : '+opp.StageName+ ', CloseDate : '+opp.CloseDate);
             }
     }
         }
     public static void rel6(){
        List<Account> accQuery =[SELECT Name, Industry,(SELECT Name,StageName,CloseDate FROM opportunities)FROM Account
                               WHERE Id NOT IN(SELECT AccountId FROM opportunity)];
         for(Account acc2 :accQuery){
             system.debug('Account Name :'+acc2.Name+',Industry:'+acc2.Industry);
             for(opportunity opp2 :acc2.opportunities){
                 system.debug('opp Name :'+opp2.Name+',StageName :'+opp2.StageName);
             }
         }
    }
}