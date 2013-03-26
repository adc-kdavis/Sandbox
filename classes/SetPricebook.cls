public with sharing class SetPricebook {

public String acctId {get; set;}
public List<Pricebook2> pricebooks {get;set;}
//public String page {get; set;}

	public SetPricebook() {
	
		acctId = ApexPages.currentPage().getParameters().get('acctid');
		pricebooks = [SELECT Id, Name FROM Pricebook2 WHERE isActive = True];

	}

    public PageReference Cancel (){

        PageReference returnPage = new PageReference('/'+acctId);
        returnPage.setRedirect(true);
        system.debug('True');
        return returnPage;
    }   

    @RemoteAction
    public static String DirectToDetail (Id pbid){

        PageReference returnPage = new PageReference('/'+pbid);
        String redirect = returnPage.getUrl();
        return redirect;
    }  

    @RemoteAction
    public static String SelectBook (Id pbid, String aId){
    	
    	//system.debug('Enter'+acctId);

    	Pricebook2 pb = [SELECT Id, Name FROM Pricebook2 WHERE Id =: pbid];
    	system.debug(pb.Name);

    	if(pb != null){
    		system.debug('HEllo');
    		Account acct = [SELECT Id, Pricebook__c FROM Account WHERE Id =: aId Limit 1];
    		acct.Pricebook__c = pb.Name;
    		update acct;

    	PageReference url = new PageReference('/'+aId);
		String page = url.getUrl();
 		

        return page;
	
    	}

    	return null;
    }
}
