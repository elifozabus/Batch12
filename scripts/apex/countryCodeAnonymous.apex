//We want to access the custom setting here. 
Map<String, Country_Code__c> allCountryCode = Country_Code__c.getAll();
system.debug('All country code--> ' + allCountryCode);

//Counry name India, its code is IND
for(string eachCountry : allCountryCode.keySet()){
    Country_Code__c cc = allCountryCode.get(eachCountry); //tis gonna give us full record.
    system.debug('Country name is ' + eachCountry + ', its code is '  +allCountryCode.get(eachCountry).Code__c);
}