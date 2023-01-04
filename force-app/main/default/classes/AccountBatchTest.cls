@isTest
public class AccountBatchTest {
    @isTest
    private static void testBatch1() {
        //1.Prepare data
        List<Account> listAcc = new List<Account>();
        for (integer i = 0; i<900; i++){
            account a = new Account();
            a.name = 'Pi test' + i;
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;
        //2.Test startest
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        //we cannot divide groups when we are executing batch from TEST class.
        //It must process in 1 CHUNK.

        //system.unexpecredException: No more than one executeBatch can be called from wihtin a test method.
        //Please make sure the iterable returned from you start method matches the batch size, resulting in the one executeBatch invocation.
        Id jobId = database.executeBatch(ab, 900);
        Test.stopTest();

        //3.assert
        List<Account> getAccounts = [SELECT id, description from Account];
        system.assert(getAccounts[0].Description.contains('batch'));
    }
}
