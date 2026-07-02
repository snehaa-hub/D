public class newMap {
    public static void Method(){
       Map<String,Map<String,Map<String,String>>> officeid =New Map<String,Map<String,Map<String,String>>>();
      
        String office = 'New York';
        String department = 'IT';
        String employee = 'Alice';
        String role = 'Developer';
        
        if(!officeid.containsKey(office)){
          officeid.put(office,New Map<String,Map<String,String>>());
        }
          
        
        Map<String,Map<String,String>>departmentid = officeid.get(office);
          
        if(!departmentid.containsKey(department)){
          departmentid.put(department,New Map<String,String>());
        }
           
        
        Map<String,String>employeeid = departmentid.get(department);
            
        if(!employeeid.containsKey(employee)){
             employeeid.put(employee,role);
        }
        
         System.debug(office+ department +employee + role);
    }
                 
}