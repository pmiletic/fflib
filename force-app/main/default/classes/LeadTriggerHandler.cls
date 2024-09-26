public with sharing class LeadTriggerHandler extends TriggerHandlerBase {
  // Mandatory Required
  public LeadTriggerHandler(List<SObject> records) {
    super(records);
  }

  // Optional constructor
  public LeadTriggerHandler(
    List<SObject> records,
    Schema.SObjectType sObjectType
  ) {
    super(records, sObjectType);
  }

  // Inner constructor class implementation
  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new LeadTriggerHandler(sObjectList);
    }
  }

  public override void beforeUpdate(Map<Id, SObject> existingRecords) {
    Leads leads = Leads.newInstance(this.Records);
    leads.setDescriptions();
  }
}
