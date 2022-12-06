public with sharing class ListDemo {
   public static string candidatesList(integer i) {

    List<string> listCandidates = new list<string>();
    listCandidates.add('Marc'); //0
    listCandidates.add('Elon'); //1
    listCandidates.add('Bill'); //2
    listCandidates.add('Marc'); //3
    system.debug('List of candidates is ' + listCandidates);
    string returnString = '';
    integer sizeOfList = listCandidates.size();

    if(i >= 0 && i < sizeOfList){
        returnString = listCandidates[i];
    } else {
        returnString = 'No values found. Stay in limits';
    }
    return returnString;
   }
   public static void randomIntegerList() {
    List<integer> listInteger = new list<integer>();
    listInteger.add(10);  //Indexes will always be integer.
    listInteger.add(15);
    listInteger.add(20);
    listInteger.add(5);
    listInteger.add(15);
    listInteger.add(20);

    integer valueAt3index = listInteger.get(3);
    // or
    integer valueAt3index2 = listInteger[3];
    system.debug('Random integer list is ' + listInteger);
    system.debug('Value at index 3 is ' + valueAt3index);
   }

   public static void allCats(){
    list<cat> listCat = new list<cat>();
    //we can add only instances of CAT.
    cat batch12Cat = new cat ('fluffyskins', 'white');
    cat batch12Cat2 = new cat('simba', 'brown');
    cat batch12Cat3 = new cat('blackpepper', 'black');
    listCat.add(batch12Cat);
    listCat.add(batch12Cat2);
    listCat.add(batch12Cat3);
    listCat.add(batch12Cat);
    system.debug('List of cats ' + listCat);
  }
}
