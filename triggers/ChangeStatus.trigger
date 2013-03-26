trigger ChangeStatus on Line_Item__c (before delete) {

	For (Line_Item__c li : [
        SELECT Id
        FROM Line_Item__c
        WHERE Invoice_Statement__r.Status__c = 'Negotiating'
        AND Id IN :Trigger.old]){

         		Trigger.oldMap.get(li.Id).addError('Must change status before deleting Line Item');
		} 

	}