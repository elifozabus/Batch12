public  class AccountQueueableExample implements Queueable {
    List<Account> listAcc = new List<Account>();
    //constructor
    public AccountQueueableExample(List<Account> accounts){
        listAcc = accounts;
    }
    public void execute(QueueableContext qc){
        for (Account eachAcc : listAcc) {
            eachAcc.Name += '--SI';     
        }
        update listAcc;

    }
}
