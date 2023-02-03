public class AirlineCallouts {

    @future(callout=true) //eger futuredan callout yapacaksan bunu yazmak gerek true diye.
    public static void postAirline(Id airlineId){
        //burda future method'dan dolayi paraamtere olarak sObject kullanamiyoruz. Sadece primitive veya colllection of primitive olcak.
        //Endpoint: https://api.instantwebtools.net/v1/airlines
        //Http Method: POST
        //1. Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('POST');
        //1.1 Prepare Get airline detail & prepare the same as json body.
        Airline__c airline = [SELECT Name, Country__c, Established__c, Head_Quarters__c, Logo_URL__c, Name__c, Slogan__c, Website__c FROM Airline__c WHERE Id =:airlineId LIMIT 1];//Object managerda Airline__c'den butun fieldlari istedk buraya. Aslinda Json'da hangi fieldlar varsa bizde olanlarla uyumlastirip istedik tabi Integration;in ilk derinde yaptigimiz gibi.
        //Bu arada LIMIT 1 yaptik cunku Soql kisminin solunda tek bir record istemis. List isteyeswydi List<Airline__c> airline yazardi.
        AirlineWrapper wrap = convertToWrapper(airline); //Asago prober class yapyor simdi.
        String body = JSON.serialize(wrap);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;char-set=UTF-8');

        //2. Prepare Internet.
        Http http = new Http();
        
        //3. Send the HttpRequest over the internet in order to receive HttpResponse back.
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        Application_Log__c log = new Application_Log__c(); //we use this object to store only errors generally, but for now, we're using it as a proof.
        log.Class_Method__c = 'AirlineCallouts: postAirline - ' + airlineId;
        log.Exception_Type__c = 'Success'; //sadece success oldugunu anlamak istiyorum daga dogrusu gormek istiyorum orda.
        log.Exception_Message__c = response.getStatusCode() + ' ' + response.getStatus();
        log.Stack_Trace__c = response.getBody();
        insert log;
    }
    //SIMDI TRIGGER OLSUTURUCAZ: AIRLINETRIGGER'A GIT....
    private static AirlineWrapper convertToWrapper(Airline__c airline){
        AirlineWrapper wrap = new AirlineWrapper();
        wrap.country = airline.Country__c;
        wrap.established = airline.Established__c;
        wrap.head_quaters = airline.Head_Quarters__c;
        wrap.logo = airline.Logo_URL__c;
        wrap.name = airline.Name__c;
        wrap.id = airline.Name;
        wrap.slogan = airline.Slogan__c;
        wrap.website = airline.Website__c;
        return wrap;

    }
   
}