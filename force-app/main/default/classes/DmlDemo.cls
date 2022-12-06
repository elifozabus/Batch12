public class DmlDemo {
    public static void dmlInsertDemo_stndObj(){
        // We will create account record using Apex.
        // 1. Creating new instance of account sObject
        Account acc = new account();
        // 2. Set the field values
        acc.Name = 'SoftInnovas';
        // 3. Now comes the DML. Saving yapiyoruz yani.
        insert acc; //BOOOOMM...
        //print it.
        system.debug('Inserted acc: ' + acc);

        
    }
    public static void dmlInsertDemo_cstmObj(){
        salesforce_project__c spNew = new salesforce_project__c();
        spNew.project_name__c = 'Learn DML ';
        spNew.description__c = 'I am doing great this.';
        insert spNew;
        system.debug('Inserted sp: ' + spNew);
    }
}
