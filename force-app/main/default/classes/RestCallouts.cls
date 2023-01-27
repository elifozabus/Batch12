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
        System.debug(response.getStatusCode()); //it's gonna tell us the operation has done successfully or not. Bu requetsim basarili oldu mu? Bunun cevabi 200'dur. 200 gelmisse debugta, yani benim status kodum 200 ise bu basarilidir demek. Ilk once genelde buna bakariz.
        System.debug(response.getBody()); //it will give us response body. What to they sent. Bilginin oldugu yer yeni.
        return response;

        //WE WILL EXECUTE THIS CLASS IN THE 'messageformats' APEX CLASS. ORAYA GIT.

    }
}