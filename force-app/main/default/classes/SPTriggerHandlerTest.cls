@isTest
public class SPTriggerHandlerTest {
    @isTest
    private static void testSPFuture1() {
        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.Project_Name__c = 'SP Test 1';
        sp1.Status__c = 'New';
        sp1.Description__c = 'test1';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'SP Test 2';
        sp2.Status__c = 'New';
        sp2.Description__c = 'test2';

        List<Salesforce_Project__c> insSP = new List<Salesforce_Project__c>{sp1, sp2};
        insert insSP;

        set<id> setSPIds = new set<id>{sp1.Id, sp2.Id};

        Test.startTest();
        SalesforceProjectTriggerHandler.updateProjectDescription(setSPIds);
        Test.stopTest(); //this will ensure out future method is completed

        //assert
        List<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c];
        system.assert(allSP[0].Description__c.contains('future'));


    }
}
