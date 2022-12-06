public  class Calculator {
   public void welcomeMessage(){
    system.debug('Welcome to apex calc.');
   }
    // .                   string is data type msg is variable name of parameter
   public void printNewMessage(string msg){
    //msg only can be used INSIDE of class
    //OUTSIDE class, yani anonymous kismi, variable name of parameter DOES NOT MATTER
    //we always obey data type 
    system.debug(msg);

   }
   //void -> return nothing.
   // if we want to return string, write string.
   public string printAndReturnMsg(string msg2){
    system.debug(msg2);
    string returnStr = msg2 + '...OK, cool';
    return returnStr;
   }

   public integer add (integer a, integer b){
    integer sum = a + b;
    return sum;
   }
   // Two methods can be same if we have different number of parameters or datatype of parameters. Buna METHOD OVERLOADING deniyor.
   public integer add(integer a, integer b, integer c){
    integer sum = a + b + c;
    return sum;
   }
   
   // 1. param --> date
   // 2. return type is boolean
   public boolean checkLeapYear(date dt){
    integer year =dt.year(); //built in method.
    boolean lp = date.isLeapYear(year); //isLeapYear is also a built in method of DATE class.
    return lp;

   }
}
