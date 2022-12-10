DmlDemo.dmlInsertDemo_stndObj();
DmlDemo.dmlInsertDemo_cstmObj();
DmlDemo.dmlUpdateDemo_2();
DmlDemo.dmlUpdateDemo_3();
DmlDemo.dmlCreateandUpdateDemo();
DmlDemo.dmlInsertDemo_4();
DmlDemo.dmlInsertMultiple_Right();
DmlDemo.dmlInsertDemo_5();
DmlDemo.dmlInsertMultiple_2();
DmlDemo.dmlUpdateMultiple();

//To DELETE, once neyi silecegimi create ediyorum listeden:
// Bunu yazmasam daolur aslinda-->list<account> listAccount = [SELECT id FROM account WHERE cretaeddate = THIS_WEEK limit 100];
//sonra delete listAccount; yapardik ama direk sunu da yapabiliriz:
delete [SELECT id FROM account WHERE createddate = THIS_WEEK limit 100];
