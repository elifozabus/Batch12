public class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new date instance');
        
        // create new date instance     YEAR MONTH DAY
        Date newDate = Date.newInstance(1997, 7, 10);
        system.debug('new date is '+ newDate);

        Date newDate2 = Date.newInstance(2022, 11, 11);
        system.debug('new date2 is ' + newDate2);

        // to get today's date:
        Date todayDate = date.today();
        system.debug('today\'s date ' + todayDate);
    }


    public void printNewTime(){
        //Data typea ve parameter sayisina dikkat etmen lazim iki parameter varsa 3 giremezsin.
        //create new time instance   Hour, Minute, Second, Milliseconds
        Time myTime= Time.newInstance(2, 25, 45, 0);
        system.debug('my time is '+ myTime);
    }

    public void printNewDateTime(){
        Date newDate = date.today();
        Time newTime= Time.newInstance(2, 25, 45, 0);

        // 1. create new datetime from DATE and TIME
        DateTime dt1 = Datetime.newInstance(newDate, newTime);
        system.debug('dt1 is ' + dt1);
        
        // 2.Create new datetime using year, month, day
        Datetime dt2 = DateTime.newInstance(2001, 4, 14); //What will be the time? Salesforce user's timezone.Automatically.
        system.debug('dt2 is ' + dt2); //printing is in GMT.
    }
}