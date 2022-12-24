@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void testUpdateDecsription(){//insert account record with active field as yes
        //1.prepare data
        Account acc1 = new account();
          acc1.Name = 'SI Test';
          acc1.Industry = 'Energy';
  
          Account acc2 = new account();
          acc2.Name = 'UI Test';
          acc2.Industry = 'Energy';
  
          Account acc3 = new account();
          acc3.Name = 'PI Test';
          acc3.Industry = 'Banking';
  
          List<account> listAcc = new list<account>{acc1, acc2, acc3};
          insert listAcc;

          //verify description
          //sogl
          Account checkInsertyes = [SELECT id, name, active__c FROM Account WHERE id = :acc2.id];
          system.assertEquals('Account is now Active. Enjoy, celebrate, have fun.', checkInsertyes.Description);//Bu description stringini handlerdanalman lazim, birebir aynisi olamli yoksa error veriyor.
          //check description
          //assert
          for(account a: listAcc){
            a.Active__c = 'Yes';
          }
          update listAcc;
          List<Account> allAcc = [SELECT  id, name, active__c, Description fROM Account];
          system.assertEquals('Account is now Active. Enjoy, celebrate, have fun.', allAcc[0].Description); 
        
    }
    
}
