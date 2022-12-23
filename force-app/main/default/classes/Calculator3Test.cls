@isTest
public class Calculator3Test {
    private static void aNormalMethod(){
        system.debug('This is still allowed');
    }
    // Test method features.
    //1. static
    //2. void
    //3. no parameters
    //4. test method can be Public or Private. We're not gonna uset it out of class anyway.
    @isTest
    public static void testMessage() {
        //Call two methods from Calculator3 class here. Ama ordakiler static degil o yuzden cagirmayaiz. bu yuzden insatance olusturmamiz lazim.
        Calculator3 c = new Calculator3();
        c.WelcomeMessage();
        c.printNewMessage('Printitng from test method now.');
        
    }
    @isTest
    private static void testAdd1(){ //We're testing add method now.
        integer i= 10;
        integer j = 15;
        Calculator3 c = new Calculator3();
        integer sum1 = c.add(i, j);
        //We have not yet verified it.
        //as per hour human calculation --> sum1==>25
        //assertion
        system.assertEquals(25, sum1);
    }
    @isTest
    private static void testAdd21(){ //We're testing add method now.
        Calculator3 c = new Calculator3();
        integer sum1 = c.add(10, 15, 25);
        //We have not yet verified it.
        //as per hour human calculation --> sum1==>25
        //assertion
        system.assertEquals(50, sum1);
    }
    
    
}
