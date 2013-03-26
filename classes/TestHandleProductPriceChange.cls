@isTest 
private class TestHandleProductPriceChange { //note the private class. The objects introduced are only allocated
                                             //to the TestHandleProductPriceChange class
    static testMethod void testPriceChange()  { //Void: No return value

//First test: Creates invoice statement and inserts it into the database.
                 Invoice_Statement__c invoice = new Invoice_Statement__c(Status__c = 'Negotiating');
                 //Creates new invoce statement assigned label invoice
                 //Created invoice is assigned "new" meaning updated with a negotiating status
                 
                 insert invoice;                             
                                              
//Second test: Creates new merchandise records
                Merchandise__c[] products = new Merchandise__c[]{
                    new Merchandise__c(Name = 'item 1', Description__c = 'test product 1', Price__c = 10, Total_Inventory__c = 10),
                    //Creates new merchandise: "item 1" with all data and values filled for testing
                    new Merchandise__c(Name = 'item 2', Description__c = 'test product 2', Price__c = 11, Total_Inventory__c = 10)
                    //Creates new merchandise: "item 2" with all data and values filled for testing
                };
                insert products;//Inserts item 1 and 2 into merchandise records
                
//Third test: Creates two new line items and inserts them into the invoice statement we created in the first test                                                                      
                Line_Item__c[] lineItems = new Line_Item__c[] {//[] creates open bracket for new line items to be created
                    new Line_Item__c(Invoice_Statement__c = invoice.id, Merchandise__c = products[0].id, Unit_Price__c = 10, Units_Sold__c = 3),
                    new Line_Item__c(Invoice_Statement__c = invoice.id, Merchandise__c = products[1].id, Unit_Price__c = 11, Units_Sold__c = 6)
                };
                insert lineItems;//Inserts line items into invoice statement             
                                   
//Force trigger                                   
        products[0].price__c = 20; // raise price 
        products[1].price__c = 5;  // lower price 
    
        Test.startTest();
        update products;
        Test.stopTest();             
                
                
                                                
                lineItems =
                [SELECT id, unit_price__c FROM Line_Item__c WHERE id IN :lineItems];
                System.assert(lineItems[0].unit_price__c == 10);  // unchanged 
                //Boolean condition to check whether lineItem[0] price is 10 after it was raised. Test success if this is true.      
                System.assert(lineItems[1].unit_price__c == 5);   // changed!!
                //Boolean condition to check whether lineItem[1] price is 5 after it was changed. To ensure discounted price is given.   
                //System asserts are a great way to test the performance of your code.                            
    }
}
//The @isTest annotation tells Force.com that all code within the Apex class is 
//code that tests the rest of your code.