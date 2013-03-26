trigger EnterCustomerUser on Contact (after insert) {

    if(Trigger.isinsert){
        for(Contact c : [SELECT ID, FirstName, LastName, Email FROM Contact WHERE ID IN :Trigger.NEW]){
 	       	
            User customerUser = new User ();
            	customerUser.Email = c.Email;
            	customerUser.FirstName = c.FirstName;
            	customerUser.LastName = c.LastName;
            	customerUser.Username = c.LastName + '@Test.com';
            	customerUser.CommunityNickname = c.FirstName + c.LastName;
            	customerUser.Alias = c.LastName;
            	customerUser.ProfileId = '00eG0000000K4oZ';
            	customerUser.LanguageLocaleKey  = 'en_US';
                customerUser.LocaleSidKey       = 'en_US';
                customerUser.TimeZoneSidKey     = 'America/Chicago';
                customerUser.EmailEncodingKey   = 'UTF-8';
            	
        		insert customerUser;
        }
    }
}