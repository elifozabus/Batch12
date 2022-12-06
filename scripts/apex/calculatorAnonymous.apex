Calculator c1 = new Calculator();
c1.welcomeMessage();
string message = 'print my message';
c1.printNewMessage(message);  //c1.printNewMessage('print this now'); da olur.( string message = 'print my message'; kismi olmadan)
string r = c1.printAndReturnMsg('print this ASAP');
system.debug(r);
integer sum1 = c1.add(10, 15);
system.debug(sum1);

integer sum33= c1.add(10, 15, 25);
system.debug(sum33);

date newDate = date.newInstance(2016, 4, 8);
boolean lpCheck = c1.checkLeapYear(newDate);
system.debug(newDate + 'check leap year' + lpCheck);