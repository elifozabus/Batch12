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
    @isTest
    private static void dmlInsert5test(){
        //Testing worldde bir record yok suan. Biz direk DmlDemo9.dmlInsertDemo_5() yapsak fetch yapacagi bir soql yok orda. Bu yuzden record create etmemiz lazim once.
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'SP test';
        sp.Status__c = 'New';
        insert sp;

        DmlDemo9.dmlInsertDemo_5();
        //to verify, we soql. Hani record olusturdugumuzda related kisminda biz ticketlari gorebiliyoruz ya default olan, onun simulasyonunu yapiyoruz yani burda.
        List<Salesforce_Ticket__c> listST = [SELECT id, subject__c, salesforce_project__c FROM Salesforce_Ticket__c WHERE Subject__c = 'Learn apex dml']; //1 tane create record yaptik neden list yapiyoruz? Cunku order of execution. Trigger calisiyor yine de. Burda proje olusturdumuzda default olrak ticketlar da geliyordu o yuzden bir tane bu classta, birtane de DmlDemo9'daki methoddaki recordu olusturuyor.
        system.assertEquals(sp.Id, listST[0].Salesforce_Project__c); //childin account id si ile parentin account idsi ayni mi diye assert ediyorum. Burda [0], bana ilk gelen recordu test ediyorum hepsini almaktansa, ilk recorda baksam yeter. O yuzden ilk record yani 0.index

    }
}
