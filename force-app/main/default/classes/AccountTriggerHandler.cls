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
    public static void updateVIPforContacts(List<Account> accTriggerNew, List<Account> accTriggerOld,  Map<id, account> accTriggerOldMap,  Map<id, account> accTriggerNewMap){
        //mesela 10 updateten 4 u VIP field uzerinden oldu 6si diger fieldlerde update etti. o yuzden '!= kullanicaz ilerde'.
        //first set of account ids
        set<id> accountIds = new set<id>();
        //for trigger.new
        for (Account eachAcc : accTriggernew){
            //check if VIP is changed (if condition)
            if (eachAcc.vip__c != accTriggerOldMap.get(eachAcc.Id).vip__c){
                 //add acc id on set of accountids
                 accountIds.add(eachAcc.Id);

            }
        }
        //we have all acc ids where is vip is changed
        //get contacts of all the accounts where vip is changed. 10 contacts.
        List <contact> allContacts = [SELECT id, vip__c, accountID FROM contact where accountId in :accountIds];

        if (!allContacts.isEmpty()){
            //for loop of contact
            for (contact eachContact : allContacts){
                //set vip field same as account's vip field

          //update contacts
            account newAcc = accTriggerNewMap.get(eachContact.AccountId);
            boolean accVIP = newAcc.vip__c;
            eachContact.vip__c = accVIP;
            }

            update allContacts;

          
        }

    }
}
