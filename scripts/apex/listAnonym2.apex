list<string> listStr = new list<string>();
if(listStr.isEmpty()){
    system.debug('List is empty. Come on.');

}

listStr.add('some string');
boolean listIsEmpty = listStr.isEmpty();
if(!listIsEmpty){
    system.debug('list is not empty');
}

list<string> listStr2; //null
//We caanot use any mthod with null
liststr2.add('will this work?');