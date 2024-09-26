public with sharing class CasesTriggerHandler extends fflib_SObjectDomain {
  public CasesTriggerHandler(List<Case> records) {
    super(records);
  }

  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new CasesDomain(sObjectList);
    }
  }

  public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
    Cases cases = (Cases) Application.domain.newInstance(this.Records); // new Cases(this.Records);
    cases.setDescriptions();
  }
}
