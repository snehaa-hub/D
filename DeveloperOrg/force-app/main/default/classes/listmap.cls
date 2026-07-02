public class listmap {
    public static void Method(){
    
         Map<String,Map<String, String>> mmap =new Map<String, Map<String, String>>();
        
                   Map<String, String> name =new Map<String,String>();
                     name.put('1','joy');
                     name.put('2','poy'); 
                     name.put('3','toy');
                   
         Map<String, String> fruits =new Map<String,String>();
                     fruits.put('1','apple');
                     fruits.put('2','banana'); 
                     fruits.put('3','orange');
        
            Map<String, String> veges =new Map<String,String>();
                     veges.put('1','carrot');
                     veges.put('2','beans'); 
                     veges.put('3','beetroot');
        
                mmap.put('1',name);
                mmap.put('2',fruits);
                mmap.put('3',veges);
                    
                    for(String Key: mmap.keyset()){
                        system.debug(mmap.get(Key));
                        
                   // Map<String, String> triger = mmap.get(Key);
                         // system.debug(triger);
                    }

}
  /*  public static void Method1(){
       Map<Id,contact> convalue =New Map<Id,Contact>([Select FirstName, LastName From Contact LIMIT 2]);
        for(Id conid :convalue.Keyset()){
       Contact c1 = convalue.get(conid);
             system.debug(c1.FirstName + c1.LastName); 
         //   System.debug(convalue.get(conid).LastName);
        
        }
}
    public static void myMethod(){
        Map<String,String> mapvar =New  Map<String,String>();
        mapvar.put('1','sam');
        mapvar.put('2','tom');
        mapvar.put('2','sne');
       system.debug(mapvar.get('2'));
        
        Map<String, List<String>> mapvar1 =New  Map<String, List<String>>();
if(!mapvar1.containsKey('1')) {
           mapvar1.put('1', New List<String>());
    
    if(!mapvar1.containsKey('2')) {
           mapvar1.put('2', New List<String>());
        
        mapvar1.get('1','sam');
        mapvar1.get('2','tom');
        mapvar1.get('2','sne');
       system.debug(mapvar1.get('2'));
}
}
           }*/
}