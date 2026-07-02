public class task2 {
   
    //6
    public static void invoce(){
         List<Invoice__c> invoiceList =new List<Invoice__c>();
        
        List<Opportunity> oppList =[SELECT Id, Name, StageName from Opportunity WHERE StageName ='Closed Won'];
        system.debug('oppList Name:'+oppList);
        
        For(Opportunity opp : oppList){
            
            Invoice__c invo = new Invoice__c();
            invo.Name = 'SamOpp';
            invo.Email__c ='samtiple@gmail.com';
            invo.Amount__c = 500000;
            invo.Opportunity__c = opp.Id;
            invoiceList.add(invo);
        }
        if(!invoiceList.isEmpty()){
            insert invoiceList;
            system.debug(invoiceList.size());
        }
        
    }
     //8
    public static void task (){
       List<Task> taskList =[SELECT Id FROM Task WHERE CreatedDate =LAST_N_MONTHS:6  AND Status ='Completed'];
        
        for(Task tk : taskList){
            system.debug(tk);
        }
        if(!taskList.isEmpty()){
            delete taskList;
        }else 
            system.debug('Lead record not found');
        }
    //9
    public static void priority(){
     
        List<Contact> conList =[SELECT Id, Name FROM contact WHERE priority__c ='High'];
        
        List<Case> caseList = new List<Case>();
        
        for(contact con :conList){
            
        Case cas = New Case();
        cas.Origin ='phone';
        cas.ContactId =con.Id;
        cas.Status ='New';
        caseList.add(cas);
    }
       if(!caseList.isEmpty()){
            insert caseList;
         system.debug(caseList.size());

  }
}
   //10
  public static void duplicateLead (){
        
      List<aggregateresult> result = [SELECT Email, COUNT(Id) FROM Lead where Email !=null GROUP BY Email HAVING COUNT(Id)>1];            
            
        List<String> emailList = new List<String>();
        
        for(aggregateresult agr :result){
            emailList.add((String)agr.get('Email'));
            
            List<Lead> leadList = [SELECT Id, Name, Email FROM Lead WHERE Email IN:emailList];
            
            for(Lead ld : leadList){
                ld.Is_Duplicate_Email__c =true;
            }
            if(!leadList.isEmpty()){
                update leadList;
            }
        }  
    }
}