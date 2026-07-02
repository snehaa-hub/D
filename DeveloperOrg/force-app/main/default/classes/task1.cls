public class task1 {
    //1
    public static void acckit(String AccountName){
  List<Account> acclist =[SELECT Id,Name FROM Account WHERE Name = : AccountName ];
            account record =New Account();
        if(acclist.isEmpty()){//acclist !=Null &&  !acclist.isEmpty() && acclist.size() !=0
            account acc =New Account();
            acc.Name = 'opps';
            acc.Type ='prospect';
            insert acc;
            record = acc;
            
        } 
       else if(!acclist.IsEmpty()){ 
           record = acclist[0];
        }
        contact con = New contact();
            con.FirstName='R';
            con.LastName='ram';
            con.AccountId=record.Id;
            insert con;

}//2
    public static void oppClosedate(){
         List<Opportunity> oppsToUpdate = [SELECT Id,Name, CloseDate, StageName FROM Opportunity 
                                          WHERE CloseDate < TODAY AND IsClosed = false];
        for (Opportunity opp : oppsToUpdate) {
            System.debug(opp);
            opp.StageName = 'Closed - Lost';
        }
        update oppsToUpdate;
    }
    //3
      public static void DeleteLead(){
          List<Lead>Dellead=[SELECT Id,Name,Email,Phone FRom Lead WHERE Email=NULL AND Phone=NULL];
          delete Dellead;
    
    }
    //4
 public static void conunderaccid(){//String accName
     List<contact> conlist =[SELECT Id, Name, AccountId FROM contact WHERE AccountId !=NULL];//Account.Name = :accName
     
       for (contact con : conlist) {
            con.Title = 'Client Manager';
            System.debug(con);

        }
     update conlist;
 }
   
    //5
   
        public static void oppsltage(){
   
    List<Opportunity> stageOppList =[SELECT Name, Amount, StageName, CloseDate FROM Opportunity WHERE Amount >100000 ];
           
       List<Opportunity> clonedOppList = new List<Opportunity>();
        
        for (Opportunity opp : stageOppList) {
            
            Opportunity newOpp = new Opportunity();
            newOpp.Name = opp.Name + ' - Clone';
            newOpp.Amount = opp.Amount;
            newOpp.CloseDate = opp.CloseDate; // CloseDate is required
            newOpp.StageName = 'Prospect'; // Set new Stage
            
            clonedOppList.add(newOpp);
        }
        if (!clonedOppList.isEmpty()) {
            insert clonedOppList;
            System.debug('Number of cloned Opportunities inserted: ' + clonedOppList.size());
        } 
} 
}