public  class Primitive3DataTypeDemo {
    public void printNewDateTime(){
        DateTime dt3 = DateTime.newInstance(2021, 7, 8, 9, 10, 11); //pst zone
        system.debug('dt3 is ' + dt3); //gmt zone

        // 4. Create newInstance from milliseconds
        // Construct a new datetime using milliseconds since Jan 1 1970 00:00:00 GMT
        //Yani create datetime with LONG (milliseconds)
        // Ve 1970 Jam 1 000000 + milliseconds => bizim new datetime olacak

        DateTime dt4 = DateTime.newInstance(0);
        system.debug('dt 4 =>' + dt4);

        DateTime dt4_1 = DateTime.newInstance(300000);
        system.debug('dt 4.1' + dt4_1);

        Long longTime = 1453244654745L;
        DateTime dt4_2 = DateTime.newInstance(longTime);
        system.debug('dt 4.2 =>' + dt4_2);

        // 5. Current Datetime
        DateTime dt6 = dateTime.now();
        system.debug (' dt6 is ' + dt6);

        // 5. Create GMT datetime using YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
        DateTime dt5 = DateTime.newInstanceGMT( 1998, 5, 24, 5, 8, 10);
        system.debug ('dt5 is ' + dt5);


    }    
}
