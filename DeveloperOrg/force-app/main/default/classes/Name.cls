public class Name {
    public Integer Id;
    public void copy() {
     System.debug(Id);
        
    }
    // Creating an object
    public static void test(){
    Name myName = new Name();
    myName.Id =211;
    myName.copy();  // Output: Toyota is driving
} 
    

/*public class Animal {
    //<access modifier>data type <name of your state> = ''; 
    public String name = 'Milo';
    public Integer age = 2;
    public String colur = 'Brown';
    
    public static void talk(){
        system.debug('bow bow x');
    }
    public static void sleep(){
        system.debug('House');
    }
}*/
}