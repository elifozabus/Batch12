public class CalculatorforStaticExample {
    public static void welcomeMessage(){
        system.debug('Welcome to Apex Calculator');
    } //ststaic ile new instance'a gerek duymuyorum.
      //For the constant situation if we don’t need any instance then static

    public static void printMessage(string str){
        system.debug(str);
    }
    public static integer add(integer a, integer b, integer c) {
        return (a+b+c);
        
    }
}
