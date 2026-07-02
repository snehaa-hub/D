public With Sharing class QueueClass Implements Queueable  {
    public  void execute(Queueablecontext qc){
        Map<Id,Account>intance=new Map<Id,Account>();
        for(Account acc : [select id from Account where Type='Customer - Direct']){
               intance.put(acc.Id,acc);
        }
         List<contact>conlist=new List<contact>();
               List<contact>conloop=[SELECT Id FROM contact WHERE AccountId IN: intance.keyset()];
               for(contact con : conloop ){
                   con.priority__c='High';
                   conlist.add(con);
               }
              update conlist; 
    }
    
}