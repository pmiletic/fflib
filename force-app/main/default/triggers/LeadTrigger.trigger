trigger LeadTrigger on Lead(before update) {
    fflib_SObjectDomain.triggerHandler(LeadTriggerHandler.class);
}
