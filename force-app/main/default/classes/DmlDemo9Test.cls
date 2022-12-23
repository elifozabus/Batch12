@isTest
public class DmlDemo9Test {
    @isTest
    public static void dmlInsert1Test() {
        //DML in TEST
        DmlDemo9.dmlInsertDemo_stndObj(); //call dml method
        //Will it insert record in org? NO

        //It will insert record in Testing world.

        //How to verified then?
        //by getting the record from testing world.
        //Soql yapicaz yani. --> We cannot get records from org.
                          // --> We get the records from testing world.
        List<Account> listAcc = [SELECT id, name from Account WHERE name = 'SoftInnovas'];
        system.assertEquals(1, listAcc.size());
        system.assertEquals('SoftInnovas', listAcc[0].Name);
    }
    @isTest
    private static void dmlInsert4Test(){
        //Create  Accountn record before calling method.
        Account acc = new account();
        acc.name = 'SoftInnovas Inc.';
        insert acc;
        DmlDemo9.dmlInsertDemo_4();
        //how to verify?
        List<Contact> allContacts = [SELECT id, name, LastName FROM Contact WHERE lastname = 'Biden'];
        system.assertEquals('Biden', allContacts[0].LastName);

    }
}
