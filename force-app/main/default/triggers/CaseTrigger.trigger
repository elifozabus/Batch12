trigger CaseTrigger on Case (before insert, before update) {
    if (trigger.isUpdate){
        //count number of times trigger runs.
        //bunun icin handler classi kurmak lazim orda yapmak lazim.
        system.debug('Before update trigger ran');
        CaseTriggerHandler.countTriggerExecution++;
        system.debug('# of times trigger ran -> ' + CaseTriggerHandler.countTriggerExecution);

        CaseTriggerHandler.countRecordsUpdated+= trigger.size; //bu trigger.new.size(); demek
        system.debug('# of total records updated==> ' + CaseTriggerHandler.countRecordsUpdated);

    }

}