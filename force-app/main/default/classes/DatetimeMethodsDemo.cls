public  class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        // 1.1 Calculate age in months
        // We need two days- birthdate and today's date
        // birthday variable
        Date birthDate = date.newInstance(1997, 7, 10);
        Date todayDate = date.today();
        integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Elif age in months is ' + ageInMonths);
    }
    public void calculateAgeInDays(){
        Date birthDate = date.newInstance(1997, 7, 10);
        Date todayDate = date.today();
        integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Elif age in days is ' + ageInDays);
    }
    public void printSubscriptionEndDate(){
        date subscriptionStartDate = date.today();
        date subscriptionEndDate = subscriptionStartDate.addDays(999);
        system.debug('Subscription End Date is ' + subscriptionEndDate);

        integer endDateYear = subscriptionEndDate.year();
        system.debug('End date year is ' + endDateYear);

        integer endDateMonth = subscriptionEndDate.month();
        system.debug('End date mounth is ' + endDateMonth);

        date pastSubscriptionDate = subscriptionStartDate.addDays(-999);
        system.debug('Is subscription ended today, then it started on ' + pastSubscriptionDate);
    }
    public void printOfferEndDateTime(){
        //Assume that offer starts right now,
        //and offer is valid till 51 hoours
        //Print offer end time

        //get current date time first
        Datetime dtNow = Datetime.now();
        Datetime offerEndDateTime = dtNow.addHours(51);
        system.debug('offer end soon ' + offerEndDateTime);
    }

    //send your birthdate in milliseconds to external system.
    public void birthdateInMilliSeconds(){
        Datetime birthTime = datetime.newInstance(1997, 7, 10, 20, 30, 0);

        //get my birthday in milliseconds
        long longBirthDate = birthTime.getTime();
        system.debug('my birtdate in long (milliseconds) is ' + longBirthDate);

    }
}
