Account ac1 = new Account();
ac1.Name = 'abc';
ac1.Industry = 'Energy';

Account ac2 = new Account();
ac2.Name = 'xyz';

account ac3 = new Account();
account ac4 = new Account();

List<Account> listAcc = new List<Account>{ac1, ac2, ac3, ac4};

//false--> insert good guys. do not insert bad ones.
//true--> if there is any 1 bad guy, don't insert ANYTHING.
List<Database.SaveResult> results = Database.insert(listAcc, false);

for(Database.SaveResult r : results){
    //.isSuccess()-->returns boolean
    //get.if() -> returns id
    //if not success, then getErrors() -->returns List<Database.Error>
    if (r.isSuccess()){
        system.debug('Record inserted successfully. Record id is: ' + r.getId());
    }else{
        system.debug('Errored out. Error is...' + r.getErrors());
    }
}
