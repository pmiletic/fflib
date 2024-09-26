/*
 * Cases triger handler
 */
public with sharing class CasesTriggerHandler extends fflib_SObjectDomain {
  /*
   * @description Constructor
   * @param records
   */
  public CasesTriggerHandler(List<Case> records) {
    super(records);
  }

  /*
   * @description Interface used to aid the triggerHandler in constructing instances of Domain classes
   * @returns AccountsTriggerHandler - instance
   */
  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new CasesDomain(sObjectList);
    }
  }

  /*
   * @description override for the beforeUpdate method
   */
  public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
    Cases cases = (Cases) Application.domain.newInstance(this.Records); // new Cases(this.Records);
    cases.setDescriptions();
  }
}
