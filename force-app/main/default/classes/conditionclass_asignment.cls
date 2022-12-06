public  class conditionclass_asignment {
    public string ifclassmethod(integer mon){
        string output_Month = 'Not a valid Month';
        if (mon == 1) {
            output_Month = 'January';    
        } if else (mon == 2) {
            output_Month = 'Februrary';    
        }else{
            output_Month;
        }
        return output_Month;
    }
    public string casemethod(string quart){
        string output_Quarter = 'Enter a proper Month name';
        if (quart == 'January', 'February', 'March'){
            output_Quarter = 'Quarter 1';
        }else{
            output_Quarter = 'Not a valid quarter';
        }
        return output_Quarter;
    }
   
}
