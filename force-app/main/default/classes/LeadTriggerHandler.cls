/*
 * Leads triger handler
 */
public with sharing class LeadTriggerHandler extends TriggerHandlerBase {
  /*
   * @description Constructor
   * @param sObjectList
   */
  public LeadTriggerHandler(List<SObject> records) {
    super(records);
  }

  /*
   * @description Optional Constructor
   * @param records - List<SObject>
   * @param sObjectType - Schema.SObjectType
   */
  public LeadTriggerHandler(
    List<SObject> records,
    Schema.SObjectType sObjectType
  ) {
    super(records, sObjectType);
  }

  /*
   * @description Interface used to aid the triggerHandler in constructing instances of Domain classes
   * @returns AccountsTriggerHandler - instance
   */
  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new LeadTriggerHandler(sObjectList);
    }
  }

  /*
   * @description override for the beforeUpdate method
   */
  public override void beforeUpdate(Map<Id, SObject> existingRecords) {
    Leads leads = Leads.newInstance(this.Records);
    leads.setDescriptions();
  }
}
