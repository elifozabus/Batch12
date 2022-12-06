public class LoopDemo {
    public void print_int_while(){
        integer count = 0;
        while (count <= 25) {
            system.debug(count);
            count++;
            
        }
    }

    public void print_N_numbers(integer n){
        for (Integer i = 0; i < n; i++) {
            system.debug(i);
            
        }
        
    }

    public void print_N_Odd_Numbers(integer startInt, integer endInt){
        //if startInt is bigger than endInt
        //then print---->NOT Allowed.
        //If startInd is smaller than endInt
        //then we print odd numbers
        for (Integer i = startInt; i < endInt; i++) {
            integer remainder = math.mod(i, 2); //i divide by 2 demek bu
            if (remainder == 1){
                system.debug(i);
            }
            
        }
    }
}
