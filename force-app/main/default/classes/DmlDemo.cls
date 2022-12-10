public class DmlDemo {
    public static void dmlInsertDemo_stndObj(){
        // We will create account record using Apex.
        // 1. Creating new instance of account sObject
        Account acc = new account();
        // 2. Set the field values
        acc.Name = 'SoftInnovas';
        system.debug('Not inserted yet: ' + acc);
        // Burda not inserted yet, yani daha store tmedik yani save etmedik bu yuzden sadece account name verecek ama insert yaptiktan sonra bize ID yi de verecek.
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
    public static void dmlUpdateDemo_2(){
        //1. Updat eyapicaz, once fetching yapmamiz lazim one recordu. soql returns account beacuse LIMIT 1. Yani one record return etmesini istedigimi zici list olusturmamiza gerek yok sadece account yazcak yeter:
        Account acc = [SELECT id, name FROM Account WHERE name = 'SoftInnovas' LIMIT 1];
        //update the acc name now:
        acc.Name = 'SoftInnovas Inc.';
        update acc;
    }
    public static void dmlUpdateDemo_3(){
        //Now we're gonna create a contact -account related- record
        Account acc = [SELECT id FROM Account WHERE name = 'SoftInnovas Inc.' LIMIT 1 ];
        Contact cnt = new contact();
        cnt.LastName = 'Biden';
        //Set the relationship now:
        cnt.AccountId = acc.Id;
        insert cnt;
        system.debug('Cnt->' + cnt);
    }
    /*public static void dmlCreateandUpdateDemo(){
        //Ben kendim pratik yapiyorum bunu
        Account acc = new account();
        acc.Name = 'Hello Testing';
        insert acc;
        Account fetch = [SELECT id FROM Account WHERE name = 'Hello Testing' LIMIT 1];
        Contact cnt = new contact();
        cnt.LastName = 'Dilbaz';
        cnt.AccountId = acc.Id;
        insert cnt; 
    // Boyle bir sey yaptim ama YAPMA IKI TANE INSERT YAPTIM BOYLECE GOVERNOR LIMITI TUKETMI SOLUYORUM. TOPLU INSERT YAPMAM LAZIM.
        

        
    }*/
    public static void dmlInsertDemo_4(){
        //Create new Salesforce Ticket for the latest created Salesforce Project
        Salesforce_Project__c sp = [SELECT id FROM Salesforce_Project__c ORDER BY CreatedDate DESC LIMIT 1];
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Learn apex dml';
        st.Priority__c = 'High'; 
        st.Status__c = 'New';
        st.Requested_by_date__c = date.today();
        //set the relationship now
        st.Salesforce_Project__c = sp.id;
        insert st;
    }
    //INSERT MULTIPLE RECORDS (BULKIFICATION):
    public static void dmlInsertMultiple_Right() {
        List<account> listAcc = new List<Account>();

        Account acc1 = new Account();
        acc1.name = 'acc bulk 1';
        listAcc.add(acc1);

        Account acc2 = new Account();
        acc2.name = 'acc bulk 2';
        listAcc.add(acc2);

        Account acc3 = new Account();
        acc3.name = 'acc bulk 3';
        listAcc.add(acc3);

        insert listAcc;

        
    }
    public static void dmlInsertDemo_5(){
        //Ben pratik yapiyorum suan:
        List<Contact> listofCont = new List<Contact>();
        Contact cnt1 = new Contact();
        cnt1.LastName = 'IS';
        listofCont.add(cnt1);

        Contact cnt2 = new Contact();
        cnt2.LastName = 'MA';
        listofCont.add(cnt2);

        Contact cnt3 = new Contact();
        cnt3.LastName = 'IL';
        listofCont.add(cnt3);

        insert listofCont;
    }

    public static void dmlInsertMultiple_2(){
        List<Account> listAcc = new List<Account>();
        for (Integer i = 0; i < 155; i++){
            account acc = new account();
            acc.Name = 'SoftInnovas V' + i;
            acc.Active__c = 'Yes';
            listAcc.add(acc);
        }
        //Execute insert statement ONLY when LIST is notEMPTY:
        if (!listAcc.isEmpty()){
            insert listAcc;
        }

    }
    public static void dmlUpdateMultiple(){
        List<Account> listAccount = [SELECT id, name, active__c FROM Account];
        //Update only those accounts for which active__ == 'YES'. So for this, I'am creating a new list which I will store what i want:
        List<Account> updateAccounts = new List<Account>();

        for (Account acc : listAccount){
            //check if acc active == yes:
            if(acc.Active__c == 'Yes'){
                //I also wanna change the names:
                acc.Name += ' via B.0';  // name = name + 'via B.0';
                updateAccounts.add(acc);
            }
        }
        //Simdi if condition yapicaz cunku eger yapmazsak, mesela Active status u Yes olmayanlar olabilir, . Ben hepsini update etsin diye disarda if condition hazirliyorum ki yeni olusturdugum liste sadece yes olanlari update etsin.
        if (!updateAccounts.isEmpty()){
            update updateAccounts; 
        }
    }
    //TO DELETE, ANONYMOUs DOSYADA



    
}
