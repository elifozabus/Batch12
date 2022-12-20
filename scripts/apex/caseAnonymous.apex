List<Case> listC = new List<Case>();
//Her 200e kadar 1 kere caalisir. Mesela 306==2 kere, 

for (Integer i=0; i<205; i++){
    Case c = new Case();
    c.Subject = 'There is a bug';
    c.Description = 'Resolve it.';
    c.Origin = 'Web';
    c.Status = 'New';
    listC.add(c);
}
insert listC;

List<Case> getAllCases = [SELECT id, status FROM Case WHERE status = 'New'];
for(Case eachCase: getAllCases){
    eachCase.Status = 'Working';
}
update getAllCases;

//example: we are inserting 50 cases
    //we want to mark some cases MAYBE-DUPLICATED using subject
    //set>string> allSubjects
       //trigger.new loop we can compare
       //Ststic variables kullanarak bunu yapabiliriz
//1)Count number of triggers ran
