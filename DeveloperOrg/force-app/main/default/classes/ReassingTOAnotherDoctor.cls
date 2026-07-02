public class ReassingTOAnotherDoctor {
    Public Static Void reassignPatients(List<Doctor__c>docloop){
        for(Doctor__c doc : docloop){
            
            List<patient__c>pat =[Select Id from patient__c Where Doctor__c = :doc.Id];
            
            Doctor__c fallbackdoc =[Select Id From Doctor__c Where Id not IN(Select Doctor__c from patient__c )Limit 1];
               
            for(patient__c  patients : pat){
                patients.Doctor__c = fallbackdoc.Id;
                
                Update patients;
            }
        }
    }
  
}