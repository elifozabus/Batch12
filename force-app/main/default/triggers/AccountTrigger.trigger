trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    if (Trigger.isBefore){
       AccountTriggerHandler.updateAccountDescription(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate){
        //call method to update VIP fields of all contacts.
        AccountTriggerHandler.updateVIPforContacts(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }





    
    /*
    List<account> accTriggerNew =trigger.new;
    List<account> accTriggerOld =trigger.old;
    Map<id, account> accTriggerNewMap = trigger.newMap;
    Map<id, account> accTriggerOldMap = trigger.oldMap;
    //keys= ids of newmap and oldmap are SAME.

    if(Trigger.isAfter && Trigger.isUpdate){
        Set<id> accIds = accTriggerNewMap.keySet();
        set<id>oldAccIds = accTriggerOldMap.keySet();
        //for each loop of set of ids
        //get value of new account using id from new map
        //get value of old account using id from old map
        integer countWebsite = 0;
        for(id eachId : accIds){
            system.debug('eachId--> ' + eachId);
            account newAccount = accTriggerNewMap.get(eachId);
            system.debug('newAccount name--> ' + newAccount.Name);
            string newWebsite = newAccount.Website;

            account oldAccount = accTriggerOldMap.get(eachId);
            system.debug('oldAccount name --> ' + oldAccount.Name);
            string oldWebsite = oldAccount.Website;

            if (newWebsite !=oldWebsite){
                system.debug('Account ' + newaccount.Name + ' new website is ' + newWebsite);
                countWebsite++;
            }
        }
        system.debug('# of account website updated--> ' + countWebsite);
    }

   /* if(Trigger.isBefore && Trigger.isInsert){
        system.debug('Before insert trigger new: ' + accTriggerNew);
        system.debug('Before insert trigger old: ' + accTriggerOld);
        system.debug('Before insert trigger new map: ' + accTriggerNewMap);
        system.debug('Before insert trigger old map: ' + accTriggerOldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        system.debug('After insert trigger new: ' + accTriggerNew);
        system.debug('After insert trigger old: ' + accTriggerOld);
        system.debug('After insert trigger new map: ' + accTriggerNewMap);
        system.debug('After insert trigger old map:  ' + accTriggerOldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('Before update trigger new: ' + accTriggerNew);
        system.debug('Before update trigger old: ' + accTriggerOld);
        system.debug('Before update trigger new map: ' + accTriggerNewMap);
        system.debug('Before update trigger old map: ' + accTriggerOldMap);
    }
        
    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('After update trigger new: ' + accTriggerNew);
        system.debug('After update trigger old: ' + accTriggerOld);
        system.debug('After update trigger new map: ' + accTriggerNewMap);
        system.debug('After update trigger old map: ' + accTriggerOldMap);
    }






   /* if (Trigger.isAfter){
        List<account> accTriggerNew = trigger.new;
        set<id> accountIds = new set<id>();
        for(account newAcc: accTriggerNew){
            accountIds.add(newAcc.Id);
        }
        system.debug('Set of id >>> ' + accountIds);
    }
   
    /*
    if(Trigger.isAfter && Trigger.isUpdate){
        List<Account> accTriggerOld = trigger.old;
        for (account oldAcc : accTriggerOld){
            system.debug('Old acc id ' + oldAcc.id + ' old acc name is ' + oldAcc.Name);
        }

        List<Account> accTriggerNew = trigger.New;
        for (account newAcc : accTriggerNew){
            system.debug('New acc id ' + newAcc.id + ' new acc name is ' + newAcc.Name);
        }
    }


   /* if (Trigger.isBefore && Trigger.isInsert){
        system.debug('Before insert triger.old is ' + trigger.old); //null
    }
    if (Trigger.isAfter&& Trigger.isInsert){
        system.debug('After insert trigger.old is ' + trigger.old); //null
    } 
    if (Trigger.isBefore && Trigger.isUpdate){
        system.debug('Before insert triger.old is ' + trigger.old); //null
    }
    if (Trigger.isAfter&& Trigger.isUpdate){
        system.debug('After insert trigger.old is ' + trigger.old); //null
    }     
    

    /*List<Account> accTriggerNew = trigger.new;
    if (Trigger.isBefore && Trigger.isInsert){
        system.debug('BEFORE record in AFTER insert: ' + accTriggerNew);
        system.debug('BEFORE # of records inserted: ' + accTriggerNew.size());
        for (Account eachacc : accTriggerNew){
            system.debug('Account ID is ' + eachacc.id + ', Account Name is: ' + eachacc.name);
        }
    }
    if (Trigger.isAfter && Trigger.isInsert){
        system.debug('After record in AFTER insert: ' + accTriggerNew);
        system.debug('After # of records inserted: ' + accTriggerNew.size());
        for (Account eachacc : accTriggerNew){
            system.debug('Account ID is ' + eachacc.id + ', Account Name is: ' + eachacc.name);
        }
    }
    if (Trigger.isBefore && Trigger.isUpdate){
        system.debug('BEFORE record in AFTER Update: ' + accTriggerNew);
        system.debug('BEFORE # of records updated: ' + accTriggerNew.size());
        for (Account eachacc : accTriggerNew){
            system.debug('Account ID is ' + eachacc.id + ', Account Name is: ' + eachacc.name);
        }
    }
    if (Trigger.isAfter && Trigger.isUpdate){
        system.debug('After record in AFTER update: ' + accTriggerNew);
        system.debug('After # of records updated: ' + accTriggerNew.size());
        for (Account eachacc : accTriggerNew){
            system.debug('Account ID is ' + eachacc.id + ', Account Name is: ' + eachacc.name);
        }
    }
   
   
   
   
   
    /* if (Trigger.isAfter && Trigger.isInsert){
        system.debug('Record in after insert: ' + trigger.new);
    }
    
    
    /*if (Trigger.isBefore && Trigger.isInsert){
        system.debug('Account before insert trigger called');
    }
    if (Trigger.isAfter && Trigger.isInsert){
        system.debug('Account after insert trigger called');
    }
    if (Trigger.isBefore && Trigger.isUpdate){
        system.debug('Account before update trigger called');
    }
    if (Trigger.isAfter && Trigger.isUpdate){
        system.debug('Account after update trigger called');
    }



    /*if (Trigger.isInsert){
        system.debug('Account before insert trigger called');

    }
    if (Trigger.isUpdate){
        system.debug('Account before update trigger called');
    }
    


    /*if (Trigger.isBefore){
        system.debug('Account before insert trigger called');
    }
    if (Trigger.isAfter){
        system.debug('Account after insert trigger called');
    }*/
    
}


