public class WarehouseUtil {
    
//Class-Level variables
    public double acceptedMarginOfError = 10.5; //Problem 3
    private Integer totalAmount;				//Problem 2
    public static string DoneString = 'Today we\'re saying Yay! to being done with chapter one.';//Problem 10
    
//List variables
    List<string> daysOfWeek = new List<string> {'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'};//Problem 6   
    Integer[] setOfAmounts; //Problem 9
        
    
//Initialize method. Problems 2 and 9        
    public void initialize(Integer theTotalAmount){
       	
        totalAmount = theTotalAmount; //Have to put totalAmount first because if we did = totalAmount,
    	system.debug(totalAmount); 	  //theTotalAmount would be set to null due to the syntax of code
    	setOfAmounts = new List<Integer>(); //Initializes an empty list
        
        if (theTotalAmount > 0){
            for (Integer i = 0; i <= theTotalAmount; i++){
                setOfAmounts.add(i);
            }
           	system.debug(setOfAmounts);//Prints out list of integers
        }
    }

    
    
//Method sets margin of error defined integer as a string value. Problem 4
    public string printMarginOfErrorAsInteger(){
     
       return String.valueOf(acceptedMarginOfError); 
    }

//Tests previous method
        public void testError(){
            if (printMarginOfErrorAsInteger() =='10.5'){
                system.debug('true');
            }
        }

    
    
//Method calculates and returns the difference in days between input date and current date. Problem 5
    public Integer getDifferenceInDays(Integer Year, Integer Month, Integer Day){    
        
       Date myDate =  date.newInstance(Year, Month, Day);
       Date DateToday = Date.today();
       Return DateToday.daysBetween(myDate);
        
    }
  
//Test method for the getDifferenceInDays method
          public void testMyMethod(){ 
            if (getDifferenceInDays(2012,12,7) > 8){ //The date of Senior Design Day :(
                system.debug('system works');   
            }
          }

    
    
//Method inputs a number corresponding to day of the week and returns string representation of week day. Problem 7
    public string printDayOfWeek(Integer WeekDay){
    
        if (WeekDay > 0 & WeekDay < 8){
        	return daysOfWeek.get(WeekDay - 1); //List starts with placeholder 0. Returns list element at the index
        }else{									//determined by users input - 1
    		return 'Day could not be found';
        }
    }
    
//Test method printDayOfWeek method. Inputs a weekday and its corresponding day, uses conditional statements to test functionality of method
    	public void TestWeek(Integer testNum, String theWeekDay){ //Test Method, enter weekday number and matching day string
            system.debug(printDayOfWeek(testNum));
            if (printDayOfWeek(testNum) == theWeekDay){
                system.debug('Method Works!');
            }else{
                system.debug('You screwed up :-[');
            }
        }

    
    
    
//Creates a substring Yay! from static string DoneString defined in class-Level. Problem 10
    public string yayChapterOneIsDone(){
        return DoneString.substring(19,23);        
    }
  
//Method outputs the substring from previous method in the console if executed
    public void OutputString(){
    	system.debug(yayChapterOneIsDone());
    }    
}