public with sharing class Leads extends fflib_SObjects {
  // Mandatory Required
  public Leads(List<SObject> records) {
    super(records);
  }

  // Optional constructor
  public Leads(List<SObject> records, Schema.SObjectType sObjectType) {
    super(records, sObjectType);
  }

  public static Leads newInstance(List<SObject> recordList) {
    return (Leads) Application.Domain.newInstance(recordList);
  }

  // Inner constructor class implementation
  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Leads((List<SObject>) objectList);
    }
  }

  // Domain methods
  public void setDescriptions() {
    for (Lead lead : (List<Lead>) this.getRecords()) {
      lead.Description = 'Date: ' + Datetime.now();
    }
  }
}
