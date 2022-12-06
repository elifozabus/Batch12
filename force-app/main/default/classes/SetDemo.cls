public  class SetDemo {
    public static void citySet() {
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('Berlin');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('TOKYO');

        system.debug('Cities are ' + cities);

        
    }
    public static void randomIntegerSet() {
        set<integer> integerSet = new set<Integer>();
        integerSet.add(10);
        integerSet.add(15);
        integerSet.add(21);
        integerSet.add(15);
        integerSet.add(15);
        system.debug('Integer set ' + integerSet);
        
    }
    public static set<integer> setFromList(List<integer> intList) {
        //We will return SET OF INTEGER not just a integer
        //First of all, we will create a temporary set
        set<integer> setInt = new set<integer>();
        setInt.addAll(intList);
        return setInt;
    
    }
    public static set<string> uppercaseSet(set<string> setStr) {
        set<String> returnSet = new set<string>();
        for (string eachString : setStr) {
            string tempStr = eachString.toUpperCase();
            returnSet.add(tempStr);
            
        }

        return returnSet;
        
    }
    
}
