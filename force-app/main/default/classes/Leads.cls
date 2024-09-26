/*
 * Leads domain class
 */
public with sharing class Leads extends fflib_SObjects {
  /*
   * @description Constructor
   * @param records
   */
  public Leads(List<SObject> records) {
    super(records);
  }

  /*
   * @description Optional Constructor
   * @param records - List<SObject>
   * @param sObjectType - Schema.SObjectType
   */
  public Leads(List<SObject> records, Schema.SObjectType sObjectType) {
    super(records, sObjectType);
  }

  /*
   * @description Inner IDomainConstructor class is needed for Application to provide this Accounts as domain instance
   *
   * @returns Accounts instance
   */
  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Leads((List<SObject>) objectList);
    }
  }

  /**
   * Dynamically constructs an instance of the Domain class for the given records
   *   Will return a Mock implementation if one has been provided via setMock
   *
   * @param records A concrete list (e.g. List<Account> vs List<SObject>) of records
   * @exception Throws an exception if the SObjectType cannot be determined from the list
   *              or the constructor for Domain class was not registered for the SObjectType
   **/
  public static Leads newInstance(List<SObject> recordList) {
    return (Leads) Application.Domain.newInstance(recordList);
  }

  /* Custom methods go here */

  /*
   * @description Set description value
   */
  public void setDescriptions() {
    setFieldValue(Lead.Description, 'Date: ' + Datetime.now());
    /*
    for (Lead lead : (List<Lead>) this.getRecords()) {
      lead.Description = 'Date: ' + Datetime.now();
    }
    */
  }
}
