public class BirdController {
        
   public map<string, list<Falcon_Pedigree__c>> Falcons;
  
   public List<Falcon_Pedigree__c> getFalconlist(String Bird){ //Pass the text band number as a key
        
       return Falcons.get(Bird); //Use the passed band number as the father band number key to populate a list of records  
    }                                                     //With the band number key as the father band number. 
    
    public BirdController(){
        Falcons = new Map<string, List<Falcon_Pedigree__c>>();
        for (Falcon_Pedigree__c FP : [SELECT Band_Number__c, Fathers_Band_Number__c FROM Falcon_Pedigree__c]){ //Collects all birds
            
           Falcons.put(FP.Fathers_Band_Number__c, getFalconlist(FP.Band_Number__c));//Key is the parent band number, list is band numbers             
        
        }
    } 
}