public with sharing class OppoprtunityTriggerHandler extends TriggerHandlerBase {
  // Mandatory Required
  public OppoprtunityTriggerHandler(List<SObject> records) {
    super(records);
  }

  // Optional constructor
  public OppoprtunityTriggerHandler(
    List<SObject> records,
    Schema.SObjectType sObjectType
  ) {
    super(records, sObjectType);
  }

  // Inner constructor class implementation
  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new OppoprtunityTriggerHandler(sObjectList);
    }
  }

  public override void beforeUpdate(Map<Id, SObject> existingRecords) {
    Opportunities opportunities = Opportunities.newInstance(this.Records);
    opportunities.setDescriptions();
  }
}
