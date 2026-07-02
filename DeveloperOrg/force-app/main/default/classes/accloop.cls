public class accloop {
  /*   public static void myMethod(){
        List<Account> accList = new  List<Account>();
        List<Case> caseList = New List<Case>();
        List<Opportunity> opplist = New List<Opportunity>();
        
        Account acc=new Account();
         acc.Name='que';
        acc.phone='1312131215';
        
        Case cs = New Case();
        cs.status = 'New';
        cs.Origin = 'Web';
        cs.AccountId = acc.Id;
        
            
       Opportunity opp = New opportunity();
        opp.Name= acc.Name;
        opp.stageName ='Closed Lost';
        opp.closeDate = system.today();
        opp.AccountId = acc.Id;
       
        
         system.debug('CASE is created' +cs);
         system.debug('opportunity is created' +opp);
        }
    
      if(!caseList.isEmpty()){
insert caseList;
       }
               
        if(!oppList.isEmpty()){
            insert oppList;
        }
  }*/
   public static void maplist(){
// In Map one Key with Multiple Values
 Map<Integer, String> mmap = new Map<Integer, String>();
            mmap.put(1,'joy');
            mmap.put(2,'poy'); 
            mmap.put(2,'toy');
 			system.debug(mmap.get(1));
            system.debug(mmap.get(2));
//2  = {'poy',toy}
List<String> list1 = new List<String>();
Map<Integer, List<String>> mmap1 =new  Map<Integer, List<String>>();
if(!mmap1.containsKey(1)){
    mmap1.put(1, new list<string>());
}

if(!mmap1.containsKey(2)){
    mmap1.put(2, new list<string>());
}
 
mmap1.get(1).add('joy');
mmap1.get(2).add('poy');
mmap1.get(2).add('toy');
system.debug(mmap1.get(1));
system.debug(mmap1.get(2));
        
  }
    public static void Demo1(){
        
    Opportunity opp = New opportunity();
        opp.Name='Name';
        opp.stageName ='Closed Lost';
        opp.closeDate = system.today();
        system.debug('opp is created'+opp);
}
 
}