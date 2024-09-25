trigger CaseTrigger on Case(before insert, before update) {
    fflib_SObjectDomain.triggerHandler(CasesTriggerHandler.class);
}