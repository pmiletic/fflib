/*
 * Accounts domain class
 */
public with sharing class Accounts extends fflib_SObjects {
  /*
   * @description Constructor
   * @param records
   */
  public Accounts(List<SObject> records) {
    super(records);
  }

  /*
   * @description Optional Constructor
   * @param records - List<SObject>
   * @param sObjectType - Schema.SObjectType
   */
  public Accounts(List<SObject> records, Schema.SObjectType sObjectType) {
    super(records, sObjectType);
  }

  /*
   * @description Inner IDomainConstructor class is needed for Application to provide this Accounts as domain instance
   *
   * @returns Accounts instance
   */
  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Accounts((List<SObject>) objectList);
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
  public static Accounts newInstance(List<Account> records) {
    return (Accounts) Application.Domain.newInstance(records);
  }

  /*
   * @return Returns list of sObjects
   */
  public List<Account> getAccounts() {
    return (List<Account>) getRecords();
  }

  /* Custom methods go here */

  /*
   * @description Reset phone and fax fields
   */
  public void cleanUpPhoneFields() {
    clearFields(new Set<Schema.SObjectField>{ Account.Phone, Account.Fax });
    /*for (Account record : getAccounts()) {
            record.Phone = null;
            record.Fax = null;
        }*/
  }

  /*
   * @description Example usage of clearField method. Clears the 'Name' field for all Account records
   */
  public void clearAccountName() {
    clearField(Account.Name);
  }

  /*
   * @description Example usage of clearFields method. Clears both the 'Name' and 'Phone' fields for all Account records
   */
  public void clearAccountNameAndPhone() {
    Set<Schema.SObjectField> fieldsToClear = new Set<Schema.SObjectField>{
      Account.Name,
      Account.Phone
    };
    clearFields(fieldsToClear);
  }

  /*
   * @description Example usage of error method with a message and SObject. Logs an error message for a specific Account record
   */
  public void logErrorForInvalidAccount(SObject invalidAccount) {
    error('Invalid Account record', invalidAccount);
  }

  /*
   * @description Example usage of error method with a message, SObject, and field. Logs an error message for a specific field in the Account record
   */
  public void logErrorForInvalidField(SObject invalidAccount) {
    error('Invalid Account Phone', invalidAccount, Account.Phone);
  }

  /*
   * @description Example usage of getIdFieldValues method. Retrieves the Ids of all Account records
   *
   * @return Set<Id>
   */
  public Set<Id> getAccountIds() {
    return getIdFieldValues(Account.Id);
  }

  /*
   * @description Example usage of getStringFieldValues method. Retrieves all unique names of the Account records
   *
   * @return Set<Id>
   */
  public Set<String> getAllAccountNames() {
    return getStringFieldValues(Account.Name);
  }

  /*
   * @description Example usage of getFieldValues method. Retrieves all unique values of the AnnualRevenue field
   *
   * @return Set<Object>
   */
  public Set<Object> getAllAccountAnnualRevenues() {
    return getFieldValues(Account.AnnualRevenue);
  }

  /*
   * @description Example usage of getRecordsByFieldValue method. Retrieves Account records where Industry is the specified value
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsByIndustry(String industry) {
    return getRecordsByFieldValue(Account.Industry, industry);
  }

  /*
   * @description Example usage of getRecordsByFieldValues method. Retrieves Account records where Industry is one of the specified values
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsByIndustries(Set<String> industries) {
    Set<Object> industriesAsObjects = new Set<Object>();
    for (String industry : industries) {
      industriesAsObjects.add((Object) industry);
    }
    return getRecordsByFieldValues(Account.Industry, industriesAsObjects);
  }

  /*
   * @description Example usage of getRecordsWithBlankFieldValues method. Retrieves Account records where the Phone field is blank
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsWithBlankPhone() {
    return getRecordsWithBlankFieldValues(Account.Phone);
  }

  /*
   * @description Example usage of getRecordsWithBlankFieldValues for multiple fields. Retrieves Account records where both Name and Phone fields are blank
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsWithBlankNameAndPhone() {
    Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
      Account.Name,
      Account.Phone
    };
    return getRecordsWithBlankFieldValues(fields);
  }

  /*
   * @description Example usage of getRecordsWithAllBlankFieldValues method. Retrieves Account records where all specified fields are blank
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsWithAllFieldsBlank() {
    Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
      Account.Name,
      Account.Phone,
      Account.Industry
    };
    return getRecordsWithAllBlankFieldValues(fields);
  }

  /*
   * @description Example usage of getRecordsWithNotBlankFieldValues method. Retrieves Account records where the Industry field is not blank
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsWithNotBlankIndustry() {
    return getRecordsWithNotBlankFieldValues(Account.Industry);
  }

  /*
   * @description Example usage of getRecordsWithNotBlankFieldValues for multiple fields. Retrieves Account records where both Name and Phone fields are not blank
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsWithNotBlankNameAndPhone() {
    Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
      Account.Name,
      Account.Phone
    };
    return getRecordsWithNotBlankFieldValues(fields);
  }

  /*
   * @description Example usage of getRecordsWithAllNotBlankFieldValues method. Retrieves Account records where all specified fields are not blank
   *
   * @return Set<SObject>
   */
  public List<SObject> getAccountsWithAllFieldsNotBlank() {
    Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
      Account.Name,
      Account.Phone,
      Account.Industry
    };
    return getRecordsWithAllNotBlankFieldValues(fields);
  }

  /*
   * @description Example usage of setFieldValue method. Sets the Industry field to 'Technology' for all Account records
   *
   * @return Set<SObject>
   */
  public void setIndustryToTechnology() {
    setFieldValue(Account.Industry, 'Technology');
  }

  /*
   * @description Example usage of setFieldValueByMap method. Updates the Phone field based on a mapping of old to new values
   *
   * @return Set<SObject>
   */
  public void updateAccountPhoneBasedOnMap() {
    Map<Object, Object> phoneUpdateMap = new Map<Object, Object>{
      '123-456-7890' => '987-654-3210',
      '111-111-1111' => '222-222-2222'
    };
    setFieldValueByMap(Account.Phone, Account.Phone, phoneUpdateMap);
  }
}
