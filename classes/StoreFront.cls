public class StoreFront {

    public PageReference getProduct() {
        return null;
    }


    public String message { get; set; }//Creates variable message as a text string
    public PageReference shop() {
        message = 'You bought: ';
        for (DisplayMerchandise p: products) { //Conditional statement for DisplayMerchandise field in the product list.
        if (p.count > 0) {                     //If selected to buy more than 0 products(merchandise). Count defined in column on webpage  
           message += p.merchandise.name + ' (' + p.count + ')    '; 
           //message variable = You bought:
           //message += ---> message = You bought: + merchandise name + (number of merchandise purchased)
            }
        }
    return null; //Return no value if iterating outside of for loop.
    }
    DisplayMerchandise[] products; //Allocates a list of DisplayMerchandise instances to a list called products. [] indicates plural.


//Creating DisplayMerchandise class. Defining variables inside class.
    public class DisplayMerchandise {                        //Creates class DisplayMerchandise
        public Merchandise__c merchandise { get; set; }      //Creates merchandise variable set to custom object merchandise API name
        public Decimal count { get; set; }                   //Creates decimal variable count with DisplayMerchandise class
        public DisplayMerchandise(Merchandise__c item) {     //Allocates description of single value in DisplayMerchandise array.
            this.merchandise = item;                         //Assigns current merchandise variable to item
        }
    }

    public DisplayMerchandise[] getProducts() {     //displays an array of DisplayMerchandise objects
        if (products == null) {                     //If product contains no list of DisplayMerchandise
            products = new DisplayMerchandise[]{};  //Create new empty DisplayMerchandise list
            for (Merchandise__c item :              //For all merchandise with total inventory above zero. Assigns variable item to current merchandise__c object
                [SELECT id, name, description__c, price__c //Selects which fields to grab from object
                 FROM Merchandise__c                       //Indicates we want to access the merchandise object
                 WHERE Total_Inventory__c > 0]) {          //Condition statement limiting the search for merchandise with an active inventory  
               products.add(new DisplayMerchandise(item)); //adds current merchandise holding the item variable to the array DisplayMerchandise in the products list.
             }
         }
     return products;   //
    }
}