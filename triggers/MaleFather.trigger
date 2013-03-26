trigger MaleFather on Falcon_Pedigree__c (before insert, before update) {
/*
    map<string, string> Fathers = new map<string, string> ();
        for(Falcon_Pedigree__c FP : [SELECT Name, Sex__c, Band_Number__c
                                     FROM Falcon_Pedigree__c]){
                                         
                                     Fathers.put(FP.Fathers_Band_Number__c, FP.Sex__c);
                                         
                                     }
    
    for(Falcon_Pedigree__c FChild : Trigger.New){
    
        if(Fathers.get(FChild.Band_Number__c) == 'Female'){
            Trigger.newMap.get(FChild.id).addError('Parent gender must match parent falcons record');
        }
    }*/
    
}