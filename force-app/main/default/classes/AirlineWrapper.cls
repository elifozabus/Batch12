public with sharing class AirlineWrapper {
    //Airlines Json dosyasindaki fieldlara bak,  onlarin aynisi olacak burda. Case sensitive unutma. Class level variables olarak olusturuyoruz... Bu class is created to wrap the data temporary. Bridge gibi Jason'dan benim gercekten systeme eklemem icin.
    public String id; //hoca bunu basta integer yapmisti ama biz en son execute ettikten sonra exception verdi bize, cunku bir tane id'nin value su 324232345 gibi bir seymis. O da id limitini asiyor o yuzden string yapalim dedi.
    public String name;
    public String country;
    public String logo;
    public String slogan;
    public String head_quaters;
    public String website;
    public String established;

    //Eger Json'dan herhangi bir varibale istemiyorsan, direkt olusturma. Mesela ben orda slogani istemeseydim olusturmazdim diyor hoca.
    //Simdi RestCallouts'a geri donuyoruz convertion icin...
}