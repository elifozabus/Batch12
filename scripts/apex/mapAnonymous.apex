//Bunun classi yok bosuna arama. Direk Anonymous file olusturduk
map<string, string> mapCntCurrency = new map<string, string>();
//we are going to put key (string) and values (integer). Melesela ayni keyde iki value var. Son valueye sahip key geverli oluyor undated oluyor cunku
// put ve add ayni seyler
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('Italy', 'Euro');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rupee');
mapCntCurrency.put('India', 'Rs');
mapCntCurrency.put('Turkey', 'Lira');
mapCntCurrency.put('El Salvador', 'Bitcoin');
system.debug('Map of country and currency ' + mapCntCurrency);

string IndiaCurrency = mapCntCurrency.get('India');
system.debug('India currency is...' + IndiaCurrency);
String country = 'Japan';
string countryCurrency = mapCntCurrency.get(country);
system.debug(country + ' currency is ... ' + countryCurrency);

//keySet ---> returns set<key_datatype>
Set<String> countrySet = mapCntCurrency.keySet();
system.debug('Set of country is ' + countrySet);

//values() -->returns List<value_datatype>
list<string> currencyList = mapCntCurrency.values();
system.debug('Currency list is ' + currencyList);

// keyset --> set of key (country)
set<string> countries  = mapCntCurrency.keySet();
for(string eachCountry : countries){
    system.debug('* each country is ' + eachCountry);
    string eachCurrency = mapCntCurrency.get(eachCountry);
    system.debug('** each currency is ' + eachCurrency);
    system.debug('--> Country is ' + eachCountry + ', its currency is ' + eachCurrency);
}