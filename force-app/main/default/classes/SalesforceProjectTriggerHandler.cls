public class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<Salesforce_Project__c> spTriggerNew){
        //create an empty list of sf tickets because we want to create multiple tickets because we might have multiple projects.
        List<Salesforce_Ticket__c> stList = new List<Salesforce_Ticket__c>();

       //for each project create new ticket.
       for (Salesforce_Project__c eachSP : spTriggerNew){
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Default st';
        st.Salesforce_Project__c = eachSP.id; //this is relationship field.
         //add it on the list.
        stList.add(st);
       }
       //insert only if we have at least one record in the list.
       if(!stList.isEmpty()){
        insert stList;
       }

    }
    public static void validateSPComplete (list<Salesforce_Project__c> spTriggerNew, list <Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap ){
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
   
}
