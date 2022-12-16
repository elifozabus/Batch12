trigger OppTrigger on Opportunity (before insert, before update, after insert, after update) {
    if (Trigger.isBefore && Trigger.isUpdate){
       // OppTriggerHandler.updateOpp(trigger.oldMap, trigger.new);
     
       OppTriggerHandler.updateStage(trigger.New, trigger.oldMap);
    }
    


}
    