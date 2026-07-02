public class classdeleteundeleted {
    public static void classdeleted(){
         List<Person__c> acc =[SELECT Id FROM Person__c WHERE Name ='dfer' LIMIT 1 ];
        
             delete(acc);
    }
     public static void limitclass(){
    List<Person__c> acc =[SELECT Id FROM Person__c WHERE Name ='dfer' LIMIT 1 ALL Rows ];
        system.debug('query record');
        //Database.emptyRecycleBin
      
            undelete(acc);
}
    
}