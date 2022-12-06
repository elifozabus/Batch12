public  class SoqlDemo {
    public static void accountSOQL_1(){
        //[Query goes in here]<-- in square brackets.
        //It always return List<object>
        List<account> listAcc = [select id, name from account where name like '%A%'];
        system.debug('List of Account -> ' + listAcc);
    }
    public static void accountSOQL_11(){
        //if SOQL is returning JUST 1 RECORD, we can use sObject for that.
        Account acc = [SELECT ID, Name FROM Account order by Createddate desc LIMIT 1];
        system.debug('Latest created account is--> ' + acc);
    }
    public static void accountSOQL_2(){
        Account acc = [SELECT ID, Name, Phone, AccountNumber FROM Account ORDER BY CreatedDate desc LIMIT 1];
        system.debug('Latest account created is ' + acc);
        //If you wanna fetch a field from list, do this:
        //String accName = acc.Name;
        //String accPhone = acc.Phone;
        system.debug('accName = ' + acc.Name + ' phone is ' + acc.Phone);
        system.debug('account number is ' + acc.AccountNumber );
    }
    public static void accountSOQL_3(){
        list<account> listAcc = [select id, name, phone, accountnumber from account order by createddate desc];
        system.debug('All created account is ' + listAcc);
        for(Account eachAcc : listAcc){
            string accName = eachAcc.name;
            string accPhone = eachAcc.phone;
            system.debug('acc name is ' + accName + ', acc phone is ' + accPhone + ', accountnumber is ' + eachAcc.AccountNumber);
        }

    }
    public static void accountSOQL_filter(string accNameFilter){
        List<account> listAcc = [SELECT ID, Name, Phone FROM Account WHERE Name = :accNameFilter];
        system.debug('Filtered list account--> ' + listAcc);
    }
    public static void accountSOQL_filter(List<string> accNames){
        List<account> listAcc = [SELECT ID, Name, Phone FROM Account WHERE Name IN :accNames];
        system.debug('Filtered account --> ' + listAcc);
    }
}
