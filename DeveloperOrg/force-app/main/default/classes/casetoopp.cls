public class casetoopp {
    public static void caseopp(List<Case>casopp){
        List<Opportunity>opplist=new List<Opportunity>();
               for(Case cse : casopp ){
                  
                   if(cse.Opportunity__c!=NULL){
                       opportunity opp=new opportunity(
                       Id=cse.Opportunity__c,
                      StageName='Closed Lost'
                       );
                      opplist.add(opp);
                   }
                   if (!oppList.isEmpty()) {
            update oppList;
        }
                   
                   
                   
                   
                   
                   
                   
                   //Opportunity opp=new Opportunity(Id=cse.public class casetoopp {
  //  public static void caseopp(List<Case>casopp){
      //  List<Opportunity>opplist=new List<Opportunity>();
             //  for(Case cse : casopp ){
                 //  Opportunity opp=new Opportunity(Id=cse.Opportunity__c,
                //   StageName='Closed Lost');
                 //   opplist.add(opp);
        }
      //  update opplist;
    
                  // StageName='Closed Lost');
                  //  opplist.add(opp);
       // }
     //   update opplist;
    }
    public static void upatetask (List<Lead> leadli){
        
        List<Task>taskli = NEW List<Task>();
        
        for(Lead list1 :leadli){
            if(list1.LeadSource =='Phone Inquiry'){
              Task t1 = New Task();
            t1.whoId =list1.Id;
            t1.status ='inProgress';
            t1.priority ='Hot';
            t1.Subject= 'i creted task';
            taskli.add(t1);
                system.debug(t1);
         }   
        }
       insert taskli;
        
    }
}