public with sharing class CaseInvocable {
    //If you want to store data permanently, then go for create sObject. If you need storing the data temporarily or carry the data temporaryly from one place to another place, then go for the concept whic is calles PROPER CLASS. Proper Claass icinde sadece variable tasir asla metot falan yoktur.
    //first, we will create a Proper Class, whic is carrying more than one information, AMA BUNU ALTTA YAZICAM 'public class InpurRequest...' ile baslayan.ve onu inuput olarak simdi yazacagim classa alicam. Class icinde class gibi. Ve enson @invocable anno.ekliyorum.

    @InvocableMethod(label='Send Email & Save Activity'
    description='This method sends an email and saves the same as activity'
    category='Case')
    public static void sendEmailSaveActivity(List<InputRequest> inputs) {
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        //iterate over the inputs and create an email for each
        for(InputRequest input : inputs) {
             //hoca googledan SingleEmailMessage metodunu gosterdi.
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setSubject('Case Created: ' + input.caseNumber);
            msg.setPlainTextBody('A case has been created for your query. Please quote the case number available in the subject when you talk to customer care!');
            msg.setTargetObjectId(input.contactId);
            msg.setSaveAsActivity(true); //a copy of the email will inserted in the current record.
            msgs.add(msg);
        }
        if(!msgs.isEmpty()) {
            Messaging.sendEmail(msgs);
        }
    }

    public class InputRequest {
        @InvocableVariable(label='Contact ID' description='Contact ID' required=true)
        public Id contactId;

        @InvocableVariable(label='Case Number' description='Case Number' required=true)
        public String caseNumber;
    }     
}








