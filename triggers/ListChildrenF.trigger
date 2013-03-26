trigger ListChildrenF on Falcon_Pedigree__c (after insert) {

       // map<string, List<Falcon_Pedigree__c>> Fathers = new map<string, List<Falcon_Pedigree__c>> ();
       // List<Falcon_Pedigree__c> Birds = new List<Falcon_Pedigree__c> ();
        //Birds = [SELECT Band_Number__c, Name, Fathers_Band_Number__c FROM Falcon_Pedigree__c];
    
        //for(Falcon_Pedigree__c FP : Birds){
        
            //Fathers.put(FP.Fathers_Band_Number__c, Birds);
       // }
        
}