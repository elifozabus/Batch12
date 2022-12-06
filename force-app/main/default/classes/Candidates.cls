public   class Candidates {
   public string name;
   public string gender;
   public static string companyName;
   public static integer countCandidates = 0;

   public void printCandidates(){
    system.debug('Name of candidate is ' + name + ', genders is ' + gender);
    system.debug('Company name is ' + companyName);
    
   }

   public static void printCandidatesInfo(){
      //We CAN access static memebers in static method.
      system.debug('Company name in static method is ' + companyName);
      // We CANNOT access Non Static memebers in static method. Yani asagidaki seyi system debug yapamicaz.
      //system.debug('Name is ' + name);

   }
}
