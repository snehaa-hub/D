public class folowersClass {
    public static void folow(List<Account> accClass){
        List<EntitySubscription> sublist = new List<EntitySubscription>();
        for(Account acc : accClass){
            EntitySubscription sub = new EntitySubscription();
            sub.ParentId=acc.Id;
            sub.SubscriberId=acc.POC__c;
            sublist.add(sub);
        }
        if(!sublist.isEmpty())  {
            insert sublist;
        }
    }
        public static void chatter(List<Opportunity> opplist,Map<Id,Opportunity> oldMap){
                   List<Feeditem> chatterLIst = new List<Feeditem>();
            
            CollaborationGroup coll =[SELECT Id FROM CollaborationGroup WHERE Name LIKE 'sales%' LIMIT 1];
                
     
            
            for(opportunity opp : opplist){
                
              if(opp.StageName == 'Closed Won' &&  oldMap.get(opp.Id).StageName != 'Closed Won'){
                    
               FeedItem item = new FeedItem();
              item.ParentId=coll.Id;
              item.Body='Opportunity has been '+opp.Name+' closed Won';
              chatterLIst.add(item);
                }
            
            }
            insert chatterLIst;
        }
    }