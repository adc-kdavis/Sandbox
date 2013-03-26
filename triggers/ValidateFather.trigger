trigger ValidateFather on Falcon_Pedigree__c (after insert, after update) {

   /* map<string,Falcon_Pedigree__c> Falcons = new map<string,Falcon_Pedigree__c> ();
    
        for (Falcon_Pedigree__c F: [SELECT Band_Number__c, Name FROM Falcon_Pedigree__c]){
            
            Falcons.put(F.Band_Number__c, F);    //Now we have a populated map with all the falcons in the database 
                                                //with key as the band number
        }

    for (Falcon_Pedigree__c FP : Trigger.New){//The most recent records in the database in Trigger.New
        
        if(Falcons.containskey(FP.Fathers_Band_Number__c)){
        
            FP.Fathers_Name__c = Falcons.get(FP.Fathers_Band_Number__c).Name;
      
        }else{//If no record of the fathers band number is found
         
            FP.Fathers_Name__c = 'No father record found';
            
        }
    }*/
}


//Will prevent mispellings and duplicate records in the database