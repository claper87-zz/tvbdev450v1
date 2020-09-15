trigger OpportunityTrigger on Opportunity (before insert) {
    

    OpportunityTriggerHandler.AugmentOpportunityName(Trigger.New, ' - Augmented From Before Trigger');
    

}
