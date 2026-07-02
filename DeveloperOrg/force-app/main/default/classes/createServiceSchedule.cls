public class createServiceSchedule {

    public static void  contocreatess(List<Contract>conlist){
       List<Service_Schedule__c> serlist =New  List<Service_Schedule__c>();
        for(Contract con :conlist){
            Service_Schedule__c ser =New Service_Schedule__c();
              ser.Contract__c=con.Id;
              ser.Name= 'ServiceSchedule'+con.ContractTerm;
              ser.Service_Start_Date__c= Date.Today(); 
              ser.Service_Status__c='Yes';
              serlist.add(ser);
       }
            if (!serlist.isEmpty()) {
            insert serlist;
        }
    }
}