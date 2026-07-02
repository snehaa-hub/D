virtual public class Person {

    String name;
    public Person(){}


    public Person(String name){

        System.debug('From Person constructor');

        this.name = name;

    }

    virtual public void display(){

        System.debug('Name '+name);

    }
 
}