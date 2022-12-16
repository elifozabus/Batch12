trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    if (Trigger.isBefore){
        system.debug('We are in BEFORE Trigger.');
        if (Trigger.isUpdate){
            system.debug('We are in BEFORE UPDATE Trigger.');
            ContactTriggerHandler.updateContactValidation1(Trigger.new, Trigger.old, Trigger.newMap,Trigger.oldMap);
            ContactTriggerHandler.updateContactValidation2(Trigger.new, Trigger.old, Trigger.newMap,Trigger.oldMap);
        }
    }
}