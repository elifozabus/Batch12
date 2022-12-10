trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    List<Account> accTriggerNew = trigger.new;
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


