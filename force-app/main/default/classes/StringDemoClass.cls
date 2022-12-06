public class StringDemoClass {
    public void stringMethod1(){
        string sessionDescription = 'learning string methods in apex language';
        system.debug(sessionDescription);
        // 1. Length
        integer sessionStrLength = sessionDescription.length();
        system.debug('length of session description string is ... ' + sessionStrLength);

        // 2. Capital
        string capsSessionDesc = sessionDescription.toUpperCase();
        system.debug('in capitals -> ' + capsSessionDesc);

        // 3. Our string contains apex?
        Boolean containsApex = sessionDescription.contains('apex');
        system.debug('contains apex???' + containsApex);

        // 3.1 check salesforce (hoca burda iki sekil yaziyor ikisi de dogru cunku containsin parameteri string yani data type string no matter what biz bu parametrda obey oldugumuz surece sorun yok yani ikisi de dogru)
        string sf = 'salesforce';
        Boolean containsSF = sessionDescription.contains('salesforce');
        // Boolean containsSF2 = sessionDescription.contains('sf');
        system.debug('contains salesforce?' + containsSF);

        // 3.2 our string contains Apex?
        Boolean containsApex2 = sessionDescription.contains('Apex'); 
        system.debug('contains Apex?' + containsApex2); // apex!= Apex
        
        // 3.3 our string contains Apex?
        Boolean containsApex3 = sessionDescription.containsIgnoreCase('Apex'); 
        system.debug('contains ignore case Apex?' + containsApex3); 
        


    }
}
