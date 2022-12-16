public class CaseHandler {
    public static void updateOriginCase (list<case> triggerNew, Map<id, case> oldMap){
        for (Case eachCase: triggerNew){
            if(eachCase.Origin != oldMap.get(eachCase.id).Origin ){
                system.debug('Case origin is changed for ' + eachCase.CaseNumber);
            }

            
        }

    }
    public static void caseOrigin(list<Case> triggerNew){
        if(Trigger.isBefore && Trigger.isInsert){
            for (Case eachCase :triggerNew){
                if(eachCase.Origin == 'Email'){
                    eachCase.Status = 'New';
                    eachCase.Priority = 'Medium';
                }
            }
        }
    }
}
