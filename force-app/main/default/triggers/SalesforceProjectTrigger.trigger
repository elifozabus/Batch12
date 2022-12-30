trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {
    if (Trigger.isAfter && Trigger.isInsert){
        //here we will call handler to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(trigger.new);

        //call future method
        system.debug('Calling future method.NOW');
        SalesforceProjectTriggerHandler.updateProjectDescription(Trigger.newMap.keySet());
        system.debug('Called future method. DONE');
    }
    if (Trigger.isBefore && Trigger.isUpdate){
        //do the completion validation
        //SalesforceProjectTriggerHandler.validateSPComplete(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);

    }
    if(Trigger.isAfter && Trigger.isUpdate){
        //call method
        //call method a)
        SalesforceProjectTriggerHandler.spCompletedStatus(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);


    }

}