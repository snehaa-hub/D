public class Triangle extends Figure{

    public Triangle(Double d1, Double d2){

        super(d1,d2);

    }

   override public Double area(){

        return 0.5 * dim1 * dim2;

    }

    public  void showMessage(){

        System.debug('From showMessage');

    }
 
}