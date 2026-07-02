public class  opportunitymap {
    public static void opplist(){
        List<opportunity> opploop =[SELECT Id,AccountId from opportunity where AccountId !=NULL Limit   1];
        Map<Id,List<opportunity>> opportunitylist = New Map<Id,List<opportunity>> ();
        for(opportunity opp : opploop ){
            if(!opportunitylist.containskey(opp.AccountId)){
                opportunitylist.put(opp.AccountId,new List<opportunity>());
            }
            opportunitylist.get(opp.AccountId).add(opp);
            system.debug(opportunitylist);
        }
        
    }
    public static void conlist(){
        List<contact> conloop =[SELECT Id,AccountId from contact];
        Map<Id,List<contact>> accountid =NEW Map<Id,List<contact>>();
        for(contact conid :conloop){
            if(!accountid.containskey(conid.AccountId)){
                accountid.put(conid.AccountId,NEW List<contact>());
            } 
            
            accountid.get(conid.AccountId).add(conid);
            system.debug(conloop);
            
        }
    }
    public static void opportunitylist(){
        List<opportunity>opploop =[select Id,contactid from opportunity where contactid !=NULL];
        Map<Id,List<opportunity>>conid =new Map<Id,List<opportunity>>();
        for(opportunity opp :opploop) {
            if(!conid.containskey(opp.contactId)){
                conid.put(opp.contactId,new List<opportunity>());
            }
            conid.get(opp.contactId).add(opp);
            system.debug(opploop);
            
        }
    }
        public static void oppAmountlist(){
            List<opportunity> opploop=[SELECT Id,AccountId,Name FROM  opportunity];
            Map<Id, Decimal> accids =NEW Map<Id, Decimal>();
            for(opportunity opp:opploop){
                if(!accids.containskey(opp.AccountId)){
                    accids.put(opp.AccountId,0);
                }
                accids.put(opp.AccountId,accids.get(opp.AccountId)+(opp.Amount !=NULL ? opp.Amount:0));
                    system.debug(opp);
                            }
                                                    
                    }
    public static void oppstringlist(){
            List<opportunity> opploop=[SELECT Id,AccountId,Name FROM  opportunity];
            Map<Id,List<string>> accids =NEW Map<Id, List<string>>();
            for(opportunity opp:opploop){
                if(!accids.containskey(opp.AccountId)){
                    accids.put(opp.AccountId,New List<string>());
                }
              accids.get(opp.AccountId).add(opp.Name);
                    system.debug(opp);
                            }                                                    
                }  
    
 
    public static void stringlist(){
            List<opportunity> opploop=[SELECT Id,AccountId,Name,stageName,Amount FROM  opportunity];
            Map<Id,List<string>> accids =NEW Map<Id, List<string>>();
            for(opportunity opp:opploop){
                if(!accids.containskey(opp.AccountId)){
                    accids.put(opp.AccountId,New List<string>());
                
                string nameandstage = opp.name +'  '+ opp.stagename +'  '+opp.Amount;
              accids.get(opp.AccountId).add(nameandstage);
                    system.debug('opp'+nameandstage);
                            }
                             }                       
                  }
    public static void twoids(){
    List<opportunity>contactlist=[select Id,AccountId,contactId,Name FROM  opportunity];
Map<string,List<opportunity>> mapofids =NEW Map<string,List<opportunity>>();
for(opportunity C : contactlist){
    string combine =string.valueof(C.AccountId)+' '+string.valueof(C.contactId);
    if(! mapofids.containskey( combine)){
        mapofids.put( combine,NEW List<opportunity>());
    }
       mapofids.get( combine).add(C);
    system.debug(C);
}
    }
}