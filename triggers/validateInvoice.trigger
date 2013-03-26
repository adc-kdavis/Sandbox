trigger validateInvoice on Invoice_Statement__c (after update) {//Important to have after update, if before update,
                                                                //Code would prevent switching from negotiating status    

      List<Invoice_Statement__c > inv = //sObject of type Invoice_Statement__c, alias inv
         [Select Id, Invoice_Value__c  //Indicates what fields to select from sObject
          FROM Invoice_Statement__c    //Indicates which object to select fields from
          Where Status__c = 'Negotiating'AND    //Filter, want to populate sObject list only with status Negotiating
          Id IN :Trigger.New];                 //and checks if Id's are in the Trigger.New List. Trigger.new contains
                                            //the list of sObjects after update has occurred.  
    For (Invoice_Statement__c I : inv){
          IF(I.Invoice_Value__c == 0){     //Conditional error statement
            Trigger.newMap.get(I.id).addError('Negotiating status requires at least one invoice');
          //Maps to the ID's of the new sObject records
          }
          
    }        
}