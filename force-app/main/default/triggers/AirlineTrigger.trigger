trigger AirlineTrigger on Airline__c (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert ){
            //SIMDI HOCA HANDLER CLASS CREATE EDIYOR BURDA> AIRLINEHANDLER
            AirlineHandler.afterInsert(Trigger.newMap);

        }
    }

}