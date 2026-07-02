public class Customsoql {
    Public static void conText(){
        List<book__c> test =[SELECT Name FROM book__c LIMIT 2 OFFSET 2];
        system.debug('test'+test);
}
    public static void custom(){
          List<book__c> cuslist =[SELECT Name FROM book__c WHERE date_of_making__c = Null];
          system.debug('cuslist:'+cuslist  );
 }
    public static void icecube(){
        
List<Feedback__c> icee = [SELECT Name, Rating__c FROM Feedback__c WHERE Rating__c IN ('3','4','5') ];
          system.debug('icee'+icee);
    }
   
}