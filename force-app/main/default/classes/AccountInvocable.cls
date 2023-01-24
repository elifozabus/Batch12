public with sharing class AccountInvocable {
//'with sharing yani security protocols sharing oluyor demek.'
    @InvocableMethod(label = 'Close Opportunities'
    description = 'This method is going to update the StageName of all opportunities under the given Account to Closed Lost'
    category = 'My Quick Actions')
    public static void closeOpportunities(List<Id> accountIds){
        //you need to query to get all the opps under the given accounts
        List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity WHERE AccountId IN :accountIds AND StageName NOT IN ('Closed Won', 'Closed Lost')];
        for (Opportunity opp : opps){
            opp.StageName = 'Closed Lost';
        }
        if(!opps.isEmpty()){
            try {
                update opps;
            } catch(Exception ex){
                //create a log
            }
        }
      


    }

}