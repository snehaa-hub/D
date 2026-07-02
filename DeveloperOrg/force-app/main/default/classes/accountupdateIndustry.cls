public class accountupdateIndustry {
    /* Public static void industryCheck(List<Account> accList, Map<id, Account> oldValue){
      set<id> accId = new set<id>();
        for(Account acc : accList){
            if(acc.Industry!=oldValue.get(acc.id).Industry){
                accId.add(acc.Id);
                
            } 
            System.debug(accId);
        } 
        List<Account> acc1 = [Select id,Industry,(Select id,Description from Contacts) From Account Where Id IN:accId];
        List<contact> conadd = new List<contact>();
        for(Account acc :acc1){
            System.debug(acc);
            for(Contact con1 :acc.Contacts){
                con1.Description = acc.Industry;
                conadd.add(con1);
                
            }
        }
                    update conadd;
}
        Public static void conMethod (List<Contact>conloop){
            List<contact>
        }*/
    public static void stuMethod (List<students__c>stulist){
        for(students__c stu :stulist){
    if( stu.teacher__c !=null && stu.subject__c=='English'){
        stu.tution__c =true;
    }
      
    }
            }
            }