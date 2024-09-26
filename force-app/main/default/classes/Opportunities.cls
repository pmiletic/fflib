public with sharing class Opportunities extends fflib_SObjects {
  // Mandatory Required
  public Opportunities(List<SObject> records) {
    super(records);
  }

  // Optional constructor
  public Opportunities(List<SObject> records, Schema.SObjectType sObjectType) {
    super(records, sObjectType);
  }

  public static Opportunities newInstance(List<SObject> recordList) {
    return (Opportunities) Application.Domain.newInstance(recordList);
  }

  // Inner constructor class implementation
  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Opportunities((List<SObject>) objectList);
    }
  }

  // Domain methods
  public void setDescriptions() {
    for (Opportunity opp : (List<Opportunity>) this.getRecords()) {
      opp.Description = 'Date: ' + Datetime.now();
    }
  }
}
