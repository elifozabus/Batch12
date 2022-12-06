Candidates.companyName = 'SoftInnovas';
system.debug('Start count candidates => ' + Candidates.countCandidates);

Candidates c1 = new Candidates();
Candidates.countCandidates++;
c1.name = 'Jerry';
c1.gender = 'Male';
c1.printCandidates();

system.debug( '------------');

Candidates c2 = new Candidates();
Candidates.countCandidates++;
c2.name = 'Elaine';
c2.gender = 'Female';
c2.printCandidates();

system.debug( '------------');

Candidates.companyName = 'Vandelay Industries';

Candidates c3 = new Candidates();
Candidates.countCandidates++;
c3.name = 'George';
c3.gender = 'Male';
c3.printCandidates();

system.debug( '------------');

c2.printCandidates();

system.debug( '------------');

c3.printCandidates();
system.debug('End count candidates => ' + Candidates.countCandidates);

c3.printCandidates();
system.debug(Candidates.countCandidates)