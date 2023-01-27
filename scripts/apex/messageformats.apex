//JSON: JavaScripty Object Notation

//We're gonna use double quote for strings and will not use them in integers and decimals.
//1 Studfent Detail - Single Record
{
    "Name" : "Elif",
    "Age" : 25;
    "Title" : "SF Developer",
    "Salary" : 50000.50
}

//2 students details in JSON format - Means array more than 1 which means use []:
[
    {
        "Name" : "Elif",
        "Age" : 25;
        "Title" : "SF Developer",
        "Salary" : 50000.50
    }
    {
        "Name" : "Bala",
        "Age" : 30;
        "Title" : "Architect",
        "Salary" : 3000.50
    }
]

//Get an Account record and convert the same into JSON format:
//serialize method converts to string our sObject
Opportunity opp = [SELECT Name, CloseDate, StageName, LeadSource FROM Opportunity WHERE CloseDate != null AND LeadSource != null AND StageName != null LIMIT 1];
String jsonString = JSON.serialize(opp);
system.debug(jsonString);

//Get 4 Opps and convert the same into JSON format
List<Opportunity> opp4 = [SELECT Name, CloseDate, StageName, LeadSource FROM Opportunity WHERE CloseDate != null AND LeadSource != null AND StageName != null LIMIT 4];
String jsonString4 = JSON.serialize(opp4);
system.debug(jsonString4);

//Callout Test
//bunu execute ettiginde System Callout Exception alacaksin: 'Anoutharized Endpoints'. Bunun icin orgta Home>Remote Site Settings'e girip yeni bir tane olustur. Orda endpointi yani url'i copy paste yapacaksin. bizimm url burda mesela : https://th-apex-http-callout.herokuapp.com/animals.
RestCallouts.getAnimals();