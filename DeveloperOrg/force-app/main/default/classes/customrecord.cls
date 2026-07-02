public class customrecord {
    public static void tarinrank(){
    
        
           Training_Event__c Train = New Training_Event__c();
     Train.Name ='kala';
    Train.country__c ='USA';
    insert Train;
     
        Participant__c par =New Participant__c();
        par.Name = 'priya';
        par.Email__c ='priya@123.com';
        insert par;
    }
    
    public static void rankcustom (){
           Training_Event__c Train =[SELECT Id FROM Training_Event__c WHERE Name ='kala' LIMIT 1]; 
           Participant__c par = [SELECT Id FROM Participant__c WHERE Name ='priya'LIMIT 1];
        
    Registration__c reg = New  Registration__c();
    reg.Name ='chandra';
    reg.Status__c ='Registered';
    reg.Training_Event__c =Train.Id;
    reg.Participant__c = par.Id;
    insert reg;
    }  
    
}