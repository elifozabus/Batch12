public with sharing class RestCallouts {
    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    //we are gonna take another animal details
    public static HttpResponse getAnimals(){
        //burdaki HttpResponse means what kind of data you want to get.
        //CALLOUT JOURNAL:

        //1.Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest(); //Once, istekte bulunacagim requesti hazirla bana diyorum.
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); //every system have uniquely identifed by url. mesela burda 'animals' demek animallarla  ilgili bir sey ogrenmek istiyorum demek.
        request.setMethod('GET'); //Kesinlikle UpperCase ile yaz hangi methodu kullanmak istiyorsan. Burda diyorum ki sen bana bu servisten bilgi al yani GET. Yani ben animals web servisinden get yapiyorum.

        //2.Prepare internet
        Http http = new Http(); 

        //3.Send the HttpRequest over the internet in order to receive HttpResponse back.
        HttpResponse response = http.send(request); //We send http request by using send method and we will receive HttpResponse back.

        //4.Process HttpResponse
        //Simdi bana kapali bir kutu geldi, ben bu kutuyu bazi metotlarla aciyorum:
        System.debug(response.getStatusCode()); //it's gonna tell us the operation has done successfully or not. Bu requetsim basarili oldu mu? Bunun cevabi 200'dur. 200 gelmisse debugta, yani benim status kodum 200 ise bu basarilidir demek. Ilk once genelde buna bakariz. The status code indicates whether the request was processed successfully or whether errors were encountered. If the request is successful, the server sends a status code of 200. You’ve probably seen some other status codes, such as 404 for file not found or 500 for an internal server error.
        System.debug(response.getBody()); //it will give us response body. What to they sent. Bilginin oldugu yer yeni.
        return response;

        //WE WILL EXECUTE THIS CLASS IN THE 'messageformats' APEX CLASS. ORAYA GIT.
    }

    /* Hoca fake API’larin olduğu bir website gönderdi bize ornek yapmak icin, https://www.instantwebtools.net/fake-rest-api .  Burda http metodu ‘GET’ olan bir Endpoint secti. -which is airplane*/

    /* Diyelim ki some Airlines managed by a third party and they posted their details. Sayfadaki Actions kisminda ‘ Go to Document’a gidince bu detailleri JSON formatta goruyoruz. So we need to convert this JSON  formula to sObject formula to store this JSON code. So nereye store edicez ama? sObject’te. Ama suan sObject yok, KENDIMIZ KURUCAZ. Object Manager’dan ‘Airlines’ diye object kurduk ve fieldlari ekledik. Bu fieldlar, JSON formula’da gordugumuz kodlar iste name, establshed, logo… falan.  Burda tek farklı olay, logo URL olduğu icin ayrı olarak bir de logo formula fieldi oluşturduk. Burda image url’ing sectik cunku amac url’i image’a cevirsin. Height ve width’i sildik opsiyonel onlar. */

    /*Bu use casede taslak su:
    1.Create Airlines object in order to store the data.
    2.Create a callout to get details.
    3.Convert the Json into Airlines object.
    4.Insert records.*/
    
    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http method: GET
    public static HttpResponse getAirlines(){
        //1. Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('GET');

        //2. Prepare Internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        if(response.getStatusCode() == 200){ //if response is successfull
            String jsonString = response.getBody();
            //Before testing, we should register the website now.
            //Ardindan, messageformats sayfasinda execute ediyoruz.
            //Convert the response body into List of Airline__c (yani from Json to sObject to store this Json code);
            //deserialize() method converts from Json to sObject,
            //serialize() method converts from sObject to Json
            //Field's API NAME SHOULD EXACTLY MACTH WITH JSON'S FIELDS.Mesela dosyada 'country' diye geciyor ama bizde 'country__c'. So we can't directly convert it. So WE'RE GONNA CREATE A PROPER CLASS. 
            //Google'da Json to Apex class yazinca sana class yapiyor ama hoca once ogrenmek icin kendimiz yapicaz sonra kulllanirsiniz diyor.
            //SIMDI FARKLI BIR YERDE CLASS OLUSTURUYORUZ. adi AIRLINEWRAPPER. Oraya git simdi. 
            //Geri donduk proper classi yaratip.:
            List<AirlineWrapper> wrappers = (List<AirlineWrapper>)JSON.deserialize(jsonString, List<AirlineWrapper>.class); //Suan bu bir bound gibi. We have more than one record of type AirlinesWrapper, so we are using list so in case we get more than one record, our wrapper can handle it.
            //Convert the wrappers into List<Airline__c>
            List<Airline__c> airlines = new List<Airline__c>();
            //hoca diyor ki ben sadece good data'yi almak istiyorum, bazi datalar sacma sapan yazilmis bazilarinin id'si yok falan cunku. O yuzden for'un icine if condition koyucaz.
            for(AirlineWrapper aw : wrappers){
                if(aw.id != null && aw.id.length() < 3 ) { 
                    Airline__c airline = new Airline__c();
                    //simdi object managerdan airline fields'a bak, json;dakilerle esle.
                    airline.Name = aw.id;
                    airline.Country__c = aw.country;
                    airline.Established__c = aw.established;
                    airline.Head_Quarters__c = aw.head_quaters;
                    airline.Logo_URL__c = aw.logo;
                    airline.Name__c = aw.name;
                    airline.Slogan__c = aw.slogan;
                    airline.Website__c = aw.website;
                    airlines.add(airline);
                }
            }
            try{
                insert airlines;
            } catch(Exception e){
                System.debug(e.getMessage());
            }
            
        }
        return response;
        //simdi 'messageformats.apex'te execute ediyoruz bunu.
    }
  
    //Simdi baska bir Use Case yapiyoruz. 
    //We created EmployeedD sObject from object manager first
    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //HttpMethod: GET
    public static HttpResponse getEmployees(){
        //1. Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');
        //2. Prepare Internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            System.debug(jsonString);
            //Convert the jsonString into Employee Response class:
            JSON.deserialize(jsonString, EmployeeResponse.class); //burda record var ve bir liste degil farkindaysan siteye baktiginda. Sadece 'data' labeli liste. Curly brace means single; rectangular brace means array(list).
            EmployeeResponse empRes = (EmployeeResponse)JSON.deserialize(jsonString, EmployeeResponse.class);
            List<EmployeeResponse.EmployeeWrapper> wrappers = empRes.data;
                //Convert each EmployeeWrapper into EmployeeD__c sObject record
                List<EmployeeD__c> employees = new List<EmployeeD__c>();
                for(EmployeeResponse.EmployeeWrapper wrap : wrappers){
                    EmployeeD__c emp = new EmployeeD__c();
                    emp.Name = String.valueOf(wrap.id); //id bir onteger cunku. Name ise string.
                    emp.Username__c = wrap.username;
                    emp.Employee_Name__c = wrap.name;
                    emp.Email__c = wrap.email;
                    emp.Gender__c = wrap.gender;
                    emp.Designation__c = wrap.designation;
                    emp.Phone_Number__c = wrap.phone_number;
                    emp.Complete_Address__c = wrap.complete_address;
                    employees.add(emp);
                }
                try{
                    insert employees;
                }catch(Exception ex){
                    system.debug(ex.getMessage()); 
                }
        }
        return response;
            //simdi 'messageformats.apex'te execute ediyoruz bunu.
    }

    //1 SUBAT:
   //Endpoint : https://softinn-dev-ed.my.salesforce.com/services/apexrest/Cases/5008d00000EJVsNAAX
   //Http Method: GET
   //NC means Named Credentials. BURDA TARGET'IN URL'ini KOYMUSTUK HATIRLA. O YUZDEN REMOTE SITE YAPMAYA GEREK YOK.
   public static HttpResponse getCasesUsingNC(){
    //1. Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_Practicerocks_Account/services/apexrest/Cases/5008d00000EJVsNAAX'); //Simdi normalde yukardaki endpointi buraya copy paste yapmam gerekirdi ama ben bu URL'den Named Credential'da bahsettigim icin zaten sadece olusturdugum Named Credential'in adini buraya koyuyorum. Onun basina da callout diye belirtiyorum. Simdi burasi sadece .com/'a kadar carry ediyor o yuzden gerisini ben kendim eklemek zorundayim.
        request.setMethod('GET');

        //2. Prepare Internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        System.debug(response.getStatusCode());
        System.debug(response.getStatus());
        System.debug(response.getBody());
        return response;
    }   //Simdi Messageformats.apex'e git orda execute dicez.

//-------------------------------------------------------------
        //2.Subat: CALLOUT:POST Ogreniyoruz
        //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
        //HtTP Method: POST
        //UseCase: Animal ornegini kullaniyoruz burda da. Ama post yapicaz
    public static HttpResponse postAnimal(){
        //burda 'post Animal' derken tek bir animladan bahsediyoruz yani thid party services will allow us to post one animal at a time. GEt animals derken yukarda, birden fazl aanimaldi.
            //1. Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        String body = '{"name" : "mighty moose"}';
        request.setBody(body); 
        request.setHeader('Content-Type', 'application/json;charset=UTF-8'); //Bunun amaci, what kind of content you're setting in your body. 'Content type' means body type; 'charset' ise character set demek which UTF-8 as default.

            //2. Prepare Internet
        Http http = new Http();

            //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

            //4. Process HttpResponse
        if(response.getStatusCode() == 201){
            system.debug('Request has been process successfully!');
        }else{
            System.debug('Somethign went wrong while creating anumal information: ' + response.getBody());
            //bunun sonunda reponse.getbody ekledim cunku diyorym ki eger bir sorun var sa bodyi bana getir ben orda goreyim sorunu direkt.
        }
        return response;
    }
   //go messageformats to execute.
   //----------------------------------------
   //Airlines calloutu yapmistik, buun icin de bir Airlines objecti olurturmustuk hatirla. Service appi'inin icinde bulabilirsin.
   //USECASE: whenever a record is getting created we want to do some automation ana this automation is making a callout to third party.
   //Solution Design:
   //1.way: Flow--> Invocable Apex yapacaksin--->Future Method yazacaksin bunun icinde de Callout yapacaksin.
   //2.way: Trigger -->Future Method(Callout)
   //Hoca 2. yolu seciyor bunu yapmak icin.
   //You cannot make DIRECTLY callout inside of trigger. So we're gonna create a futurr method which is asyncronus.We are gonna create future method which allowa callouts. In there, we will make the actual callout. And we have to call that Future method in the trigger. 
     //HOCA SIMDI AIRLINECALLOUTS diye bir class olusturuyor. Oraya git.
}