public class AccountUpdateHelper {
     //annonate method woth invocable so that it can be called from PB/Flows.
     @invocableMethod
    public static void  updateAccountWebsite(List<id> accIds){
        
        list<Account> listAcc = [SELECT id, website FROM Account WHERE id in :accIds];
        for (account eachAcc : listAcc){
            eachAcc.Website = 'www.softinnovas.com';
        }
        update listAcc;
    }
    
}
