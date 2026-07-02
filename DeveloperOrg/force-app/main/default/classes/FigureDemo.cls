public class FigureDemo {


    public static void listDemo(){

        List<sObject> objList = new List<sObject>();

        objList.add(new Account(Name='Acme Demo from SObject'));

        objList.add(new Contact(FirstName='Bala',LastName='Murugan'));

        insert objList;//Polymorphism

    }


    //Generic Parameters - A super type reference can refer sub-type instances

    public static void callMethods(Figure fig,String msg){

        System.debug(msg+fig.area());

        if(fig instanceof Triangle){

            Triangle tri = (Triangle)fig;

            tri.showMessage();

        }

    }

    public static void demo(){

        //callMethods(new Rectangle(10,20),'Area of a Rectangle'); 

        callMethods(new Triangle(10,20),'Area of a Triangle');  

    }

}