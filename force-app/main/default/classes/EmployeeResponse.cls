public with sharing class EmployeeResponse {
    //this is proper class for getEmployee()
    public integer error;
    public String msg;
    public List<EmployeeWrapper> data; //jasonda data bir array o yuzden boyle yaptik, simdi class icinde bir class daha olusuturcaz. DOcumenta bak anlarsin. Orda error, msg ve data class var olarak belirlenmis once. O yuzden simdi wrapper yapicaz siradakiler icin.


    public class EmployeeWrapper{
        public integer id;
        public string username;
        public string name;
        public string email;
        public string gender;
        public string designation;
        public string phone_number;
        public string complete_address;
    }
}