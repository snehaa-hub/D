public class operationdml {
    public static void dmlclass(){
        
        contact con =New contact();
        con.FirstName='s';
        con.LastName='diya';
      
            
         contact con1 =New contact();
         con1.FirstName='V';
            
         List<contact> condml= New  List<contact>{con, con1 };

            try{
                 insert condml;
            }catch(Exception e){
                system.debug(e.getMessage());
            }
            
    }     
       public static void dmlmethod(){
        
        contact con =New contact();
        con.FirstName='s';
        con.LastName='diya';
      
            
         contact con1 =New contact();
         con1.FirstName='V';
            
         List<contact> condml= New  List<contact>{con, con1 };
             

          List<Database.SaveResult> saveResultList = Database.insert(condml,True);
           for(Database.SaveResult result:saveResultList){
               
               if(result.isSuccess()){
                   system.debug(result.getId());
               }else{
                   system.debug(result.getErrors());
               }
               
           }
           
}
}