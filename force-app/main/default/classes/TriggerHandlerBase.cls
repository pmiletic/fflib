/*
 * Base class that provides wrappers for fflib_SObjectDomain methods
*/
public virtual with sharing class TriggerHandlerBase extends fflib_SObjectDomain {
    
    /*
     * Constructor
    */
    public TriggerHandlerBase(List<SObject> sObjectList) {
        super(sObjectList);
    }

    /*
     * Optional constructor
    */
    public TriggerHandlerBase(
        List<SObject> sObjectList,
        Schema.SObjectType sObjectType
    ) {
        super(sObjectList, sObjectType);
    }

    /*
     * @description Override of the onBeforeUpdate method
     * @param existingRecords - Map<Id, SObject>
    */
    public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
        try {
            beforeUpdate(existingRecords);
        } catch (Exception ex) {
            handleException(ex);
        }
    }

    /*
     * @description Virtual methods for beforeUpdate
     * @param existingRecords - Map<Id, SObject>
    */
    public virtual void beforeUpdate(Map<Id, SObject> existingRecords) {
        return;
    }

    /*
     *  @description Exception handler, provide error handling here
    */
    private void handleException(Exception ex) {
        System.debug(ex.getMessage());
    }
}
