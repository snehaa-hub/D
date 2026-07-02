//set to list convert
 public class testlist {
       public static void myMethod(){
          set<Integer> setList = new set<Integer>{1,2,4,3,4};
            List<Integer> li = new List<Integer>{5,6,7};
             setList.addall(li);
            system.debug( setList);
        }
     
        public static void myMethod1(){ 
            List<Integer> li = new List<Integer>{5,6,7}; 
                set<Integer> setList = new set<Integer>{1,2,4,3,4};
             li.addall( setList);
            system.debug('li'+ li);
        }
//map to list convert

      public static void myMethod2(){
            Map<Integer, String> mmap =new  Map<Integer, String>{102 =>'A',103 =>'B', 104=>'C'};
            List<Integer> li = new List<Integer>{5,6,7};
            System.debug('Map: ' + mmap);
        System.debug('List: ' + li);
        }
     public static void myMethod3(){
            List<Integer> li = new List<Integer>{5,6,7};
            Map<Integer, String> mmap =new  Map<Integer, String>{102 =>'A',103 =>'B', 104=>'C'};  
                
            for (Integer i : li) {
            mmap.put(i, 'Default');         }
            
            System.debug('Final Map: ' + mmap);

}
}