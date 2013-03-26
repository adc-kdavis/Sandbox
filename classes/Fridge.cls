public class Fridge implements KitchenUtility {

    public static final Integer stockThreshold = 5;
    private String modelNumber;      //Member variable
    private Integer numberInStock;	//Member variable 
    
    public static void toDebug(Fridge aFridge) {
        System.debug ('ModelNumber = ' + aFridge.modelNumber);
        System.debug ('Number in Stock = ' + aFridge.numberInStock);
	}
      
    public Fridge() {               
        modelNumber = 'XX-XX';			//Initializes these two values so they are not null
        numberInStock = 0;
    }
    
   public Integer ecoRating {
       get { return ecoRating; }
       set { ecoRating = value; if (ecoRating < 0) ecoRating =0; }
	}
    
    public Fridge(String theModelNumber, Integer theNumberInStock) { //Return method, that routes around the private class
        modelNumber = theModelNumber;
        numberInStock = theNumberInStock;
    }
        
    public void updateStock(Integer justSold) {  //Class method. Void says
        										 //updateStock returns no value
       											 //Method input type is integer value justSold
        	numberInStock = numberInStock - justSold; //Updates the numberInStock variable
    }
    
    public void setModelNumber(String theModelNumber) { //Method that allows user to set private class variable
    modelNumber = theModelNumber;
    }
    
    public String getModelNumber() { //Method with no input variable, that returns the private
        return modelNumber;			 //variable modelNumber.		
	}
}

//myFridge and myOtherFridge are instances or objects of the fridge class, which are given individual variables
//described in the fridge class

//Public says that all other Apex Classes have access to the class, class methods, and class variables.
//To keep other Apex classes from having access, use the private access modifier.