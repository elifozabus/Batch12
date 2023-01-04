try{
    string s;
    s.toLowerCase();
    account ac = new Account();
    insert ac;
}catch(DmlException dex){
    system.debug('DML went wrong');
}catch(Exception ex){
    system.debug('Something went wrong buddy');
    system.debug('Exception message: ' + ex.getMessage());
    system.debug('Exception line number: ' + ex.getLineNumber());
}
system.debug('Apex is SIMPLE');