trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    if (Trigger.isBefore && Trigger.isUpdate){
        CaseHandler.updateOriginCase(Trigger.new, Trigger.oldMap);
        CaseHandler.caseOrigin(Trigger.new);
        
        
    }

}