public class sql {
    public static void  demo(){
       List<Account>accloop=[SELECT Id,Name,phone,Rating,Active__c,Email__c FROM Account Where (phone != NULL AND Rating = 'Hot')OR ( Active__c ='yes' and Email__c  !=NUll)];

       for(Account acc : accloop){
            system.debug('accloop');
        }
       
    }
    
}
//SELECT Id, Name, phone, Rating, Active__c, Email__c FROM Account Where phone != NULL AND Rating = 'Hot'  AND Active__c ='yes'