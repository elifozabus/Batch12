public  class ForEachLoopDemo1 {
    public static void iterateIntegerList() {
        List<integer> listInteger = new list<integer>();
        listInteger.add(10);//0 //indexes will always be integer.
        listInteger.add(15);//1
        listInteger.add(21);//2
        listInteger.add(15);//3
        listInteger.add(15);//4

    // Print each element one by one. That's it.
        //datatype variablename 
        //of list  to use inside loop
    for (integer eachInteger : listInteger) {
        //Print all
        system.debug(eachInteger);
        
    }
        
    }
    public static integer add(list<integer> intList){
        //create a temporary variable to store SUM of all integers
        integer returnInt = 0;

        for (integer eachInte : intList){
            //add eachInte to returnInt
            system.debug('eachInte --> ' + eachInte);
            returnInt += eachInte;
            system.debug('returnInt --> ' + returnInt);
        }
        return returnInt;
    }
}
