trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    if (Trigger.isBefore){
        system.debug('We are in BEFORE Trigger.');
        if (Trigger.isInsert){
            system.debug('We are in BEFORE INSERT Trigger.');

        }
        if (Trigger.isUpdate){
            system.debug('We are in BEFORE UPDATE Trigger.');
        }
    }
    if (Trigger.isAfter){
        system.debug('We are in AFTER Trigger. LOL.');
        if(Trigger.isInsert){
            system.debug('We are in AFTER Insert Trigger.');
        }
        if (Trigger.isUpdate){
            system.debug('We are in AFTER Update Trigger.');
        }
    }

}