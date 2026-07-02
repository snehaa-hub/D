public class multistepwizard{
    public static void custom(){
        List<customer_2__c >recorddeleted = [SELECT Id FROM customer_2__c limit 7];
            
           
            delete recorddeleted;
    }
}