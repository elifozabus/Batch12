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
   
}
