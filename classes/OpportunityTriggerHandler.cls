public without sharing class OpportunityTriggerHandler {
    
    public static void AugmentOpportunityName(List<Opportunity> opportunities, string textToAdd){
        for(Opportunity thisOpp : opportunities){
            thisOpp.Name += textToAdd;
        }
    }

}
