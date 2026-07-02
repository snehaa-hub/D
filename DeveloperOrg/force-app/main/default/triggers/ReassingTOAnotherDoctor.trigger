trigger ReassingTOAnotherDoctor on Doctor__c (before Delete){
       
   
             ReassingTOAnotherDoctor.reassignPatients(Trigger.old);
    
        
}