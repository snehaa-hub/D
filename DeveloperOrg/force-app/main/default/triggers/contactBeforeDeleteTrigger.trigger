trigger contactBeforeDeleteTrigger on Contact (before delete,after insert,Before Insert,after update) {
     /* if(Trigger.isAfter  && Trigger.isinsert){
       createServiceSchedule.contocreatess(trigger.New);
      Map<Id,string> mapofId = New Map<Id,string>();
          for (contact con :Trigger.New) {
              if(con.LastName !=NULL && con.AccountId !=NULL){
                  mapofId.put(con.AccountId,con.LastName);
              }
          }
              List<Account> accloop =New List<Account>();
        List<Account> relatedacc = 
                         [SELECT Id,name,Description from Account Where Id IN :mapofId.keyset() ];
                       for(Account acc : relatedacc){
                  string NewDescription = mapofId.get(acc.Id);
              if (NewDescription != null && acc.Description!=NewDescription){
                  
                    acc.Description = NewDescription;
                        accloop.add(acc);
              }
        }      
        update accloop;
    }
    

     }*/ 
}