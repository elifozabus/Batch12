public class SoqlDemo2 {
    public static void soqlChildtoParent_1(){
        List<contact> listContact = [SELECT Id, name, account.industry, account.name FROM contact WHERE Account.Industry = 'Energy'];
        for (contact eachContact : listContact){
            string cntName = eachContact.Name;
            string cntId = eachContact.Id;
            string accountName = eachContact.account.name;
            string accountInd = eachContact.account.Industry;
            system.debug('Contact name is ' + cntName + ', account name is ' + accountName + 'and accoount industry is ' + accountInd);

        }

    }
    public static void soqlParenttoChild_1(){
        //query account record, print annual revenue. Type = 'Customer-Direct'
        //Outer query or main query is for account object.
        //Inner query is opportunity
        List<account> listAccOpp = [select id, name, annualrevenue, (select name, amount from Opportunities where stagename = 'Closed Won') from account where type = 'Customer-Direct'];
        for(account eachAcc:ListAccOpp){
            system.debug('Account name is ' + eachAcc.Name + ', annual revenue is ' + eachAcc.AnnualRevenue);
            List<opportunity> listOpp = eachAcc.Opportunities;
            for( opportunity eachOpp : listOpp){
                system.debug('-- opp name is ' + eachopp.Name + ', amount is ' + eachopp.Amount);
            }
        }
    }
    
}
