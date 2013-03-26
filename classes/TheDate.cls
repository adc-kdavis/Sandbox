public class TheDate {


    
    public void grabDate(Integer Year, Integer Month, Integer Day){    
        
        
        Date myDate =  date.newInstance(Year, Month, Day);
        Date DateToday = Date.today();
        Integer days =  DateToday.daysBetween(myDate);
        system.debug(days);
        
    }
}

//dayOfYear