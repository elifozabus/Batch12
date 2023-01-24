public class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<Salesforce_Project__c> spTriggerNew){
        //create an empty list of sf tickets because we want to create multiple tickets because we might have multiple projects.
        try{
            List<Salesforce_Ticket__c> stList = new List<Salesforce_Ticket__c>();
            DefaultTicketInfo__c defaultValues = DefaultTicketInfo__c.getOrgDefaults();

            //for each project create new ticket.
            for (Salesforce_Project__c eachSP : spTriggerNew){
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = defaultValues.Subject__c; //do not hard code this. make it a little dynamic.
                st.Priority__c = 'Medium';
                st.Salesforce_Project__c = eachSP.id; //this is relationship field.
                //add it on the list.
                st.Description__c = defaultValues.description__c;
                stList.add(st);
            }
            //insert only if we have at least one record in the list.
            if(!stList.isEmpty()){
                insert stList;
            }
        }catch(exception ex){
            system.debug('Exception msg: ' + ex.getMessage());
            for (Salesforce_Project__c eachSP : spTriggerNew){
                eachSP.addError('Error in createing ticket. Plase contact your developer.');  
            }
        }
    }
    
    /*public static void validateSPComplete (list<Salesforce_Project__c>        spTriggerNew, list <Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap ){
        //find all the projects which are completed
        Set<id> spIds = new set<id>();
        for(Salesforce_Project__c eachSP: spTriggerNew){
            if (eachSP.Status__c == 'Completed' && eachSP.Status__c != spTriggerOldMap.get(eachSP.id).Status__c){
                spIds.add(eachSP.id);
            }
        }
        //get all Non-completed tickets of all completed project. Neyi validation rule yapcaksan onu yaziyorsun:
        List<Salesforce_Ticket__c> listST = [select id, status__c, Salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in :spIds and status__c != 'Completed'];
        for (Salesforce_Ticket__c eachST : listST){
            Salesforce_Project__c sp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            sp.Status__c.addError('Cannot complete project because all tickets are not completed. Go away now.');
        }
    }
    @future
    public static void updateProjectDescription(set<id> spIds){
        system.debug('Inside future method. Okay?');
        List<Salesforce_Project__c> allSp = [Select id, description__c from Salesforce_Project__c where id in :spIds];
        for (Salesforce_Project__c eachSP : allSp){
            eachSP.Description__c+= 'Updated from future';
        }
        update allSp;
    }
    //call method a:
    public static void spCompletedStatus(list<Salesforce_Project__c> spTriggerNew, list <Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap ){
        //get set id for which project 'status' is changed to completed.
        //compare old and new to get if status is completed
        set<id> spIds = new set<id>();
        for(Salesforce_Project__c eachSp : spTriggerNew){
            if(eachSp.Status__c == 'Completed' && eachSp.Status__c != spTriggerOldMap.get(eachSp.Id).Status__c){
                spIds.add(eachSp.Id);
            }
        }

        //call future method to update all its tickets
        //call method b
        if(!spIds.isEmpty()){
            completeAllTickets(spIds);
        }
    }
    @future //b
    public static void completeAllTickets(set<id> spIds){
        //get all tickets which are not completed.
        List<Salesforce_Ticket__c> allST = [Select id, status__C, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in :spIds and status__c !='Completed'];
        //set status as completed
        for (Salesforce_Ticket__c eachST : allST){
            eachST.status__c = 'Completed';
        }
        update allST;
        //update all the tickets.

    }*/
    
}