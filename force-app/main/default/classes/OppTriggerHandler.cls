public class OppTriggerHandler {
    public static void updateOpp(map<id, opportunity> oldMapTrig, list<opportunity> triggerNew){
        
        for (Opportunity eachOpp: triggerNew){
            system.debug('New Amount is: ' + eachOpp.Amount + ' Old Amount is ' +oldMapTrig.get(eachOpp.id).amount);
            system.debug('New apportunity name is ' + eachOpp.name + ' Old opportunity name is ' + oldMapTrig.get(eachOpp.id).name);
        }
    }
    public static void updateStage (List<Opportunity> triggerNew, Map<id, Opportunity> oldMapOpp){
        for (Opportunity eachOpp: triggerNew){
            if(eachOpp.StageName != oldMapOpp.get(eachOpp.Id).StageName){
                system.debug('Description is: ' + eachOpp.Description + ' Opputunity Name is: ' + eachOpp.Name);
            }
        }
        

    }
}
