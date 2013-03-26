trigger HandleProductPriceChange on Merchandise__c (after update) {
  
  // update invoice line items associated with open invoices
  
  List<Line_Item__c> openLineItems = //Creates a list called variable openLineItems
     [SELECT j.Unit_Price__c, j.Merchandise__r.Price__c //Select retrieves specified fields
     
     FROM Line_Item__c j //j now refers to Line_Item__c as an alias. j is a shorthand.
                         //From determines which object you want to access, in our case custom object Line Item
                         
     WHERE j.Invoice_Statement__r.Status__c = 'Negotiating'  //Condition statement. Return only negotioating records.
     
     AND j.Merchandise__r.id IN :Trigger.new //Second condition statement. Trigger.new initialized when records updated
     FOR UPDATE];//Lock records
  
  
  
  for  (Line_Item__c li: openLineItems) {
  
      if (li.Merchandise__r.Price__c < li.Unit_Price__c){ //If the price of the merchandise on record is
                                                          //smaller than the unit price value perform next line
                                                          
          li.Unit_Price__c = li.Merchandise__r.Price__c;  //Set the unit price equal to the discounted price.
                                                        }
  
  
  
                                        }  
                                        
 update openLineItems;    
 
  //**Notes**
  //Merchandise__r.Price__c tells the system to retrieve the value Price for the related Merchandise
  //Line_Item__c is the API name for the created field Line Item
  //Line_Item__c li iterates over an open Line Item and assigns it a current value of li.
  //li.Merchandise__r.Price__c will reference to the current Line Item or li value
}