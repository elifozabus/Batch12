public class AccountTriggerHandler {
    public static void updateAccountDescription(List<Account> accTriggerNew, List<Account> accTriggerOld,  Map<id, account> accTriggerOldMap,  Map<id, account> accTriggerNewMap){
        
        for (Account eachAccount : accTriggerNew){
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAccount.Active__c == 'Yes'){
                
                updateDesc = true;
            }
            if(Trigger.isUpdate){
                //check if active field is updated to Yes.
                //First of all, get old Account value ->use oldMap
                    //get old active value
                //Then check new Account value-->using newMap
                    // get new active value
                Account oldAcc = accTriggerOldMap.get(eachAccount.Id);
                Account newAcc = accTriggerNewMap.get(eachAccount.Id);
                if(eachAccount.Active__c == 'Yes' && oldAcc.Active__c != newAcc.Active__c){
                    updateDesc = true;

                }
            }
            if (updateDesc){
                eachAccount.Description = 'Account is now active. Enjoy. Celebrate. Have fun.';
            }
        }

    }    
}
