public class Stu extends Person{

    String rollNo;

    public Stu(String name,String rollNo){

        super(name);

        System.debug('From Student constructor');

        this.rollNo = rollNo;

    }

   override public void display(){

        super.display();

        System.debug('Roll No'+rollNo);

    }
 
}