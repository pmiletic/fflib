/*
 * Accounts domain class
 */
public with sharing class Cases extends fflib_SObjects {
  /*
   * @description Constructor
   * @param records
   */
  public Cases(List<SObject> records) {
    super(records);
  }

  /*
   * @description Optional Constructor
   * @param records - List<SObject>
   * @param sObjectType - Schema.SObjectType
   */
  public Cases(List<SObject> records, Schema.SObjectType sObjectType) {
    super(records, sObjectType);
  }

  /**
   * Dynamically constructs an instance of the Domain class for the given records
   *   Will return a Mock implementation if one has been provided via setMock
   *
   * @param records A concrete list (e.g. List<Account> vs List<SObject>) of records
   * @exception Throws an exception if the SObjectType cannot be determined from the list
   *              or the constructor for Domain class was not registered for the SObjectType
   **/
  public static Cases newInstance(List<Case> recordList) {
    return (Cases) Application.Domain.newInstance(recordList);
  }

  /*
   * @description Set case description
   */
  public void setDescriptions() {
    setFieldValue(Case.Description, 'Date: ' + Datetime.now());
  }

  /*
   * @description Inner IDomainConstructor class is needed for Application to provide this Cases as domain instance
   *
   * @returns Cases instance
   */
  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Cases((List<SObject>) objectList);
    }
  }
}
