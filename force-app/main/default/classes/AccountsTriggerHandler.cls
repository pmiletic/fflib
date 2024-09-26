/*
 * Accounts triger handler
 */
public with sharing class AccountsTriggerHandler extends TriggerHandlerBase {
  /*
   * @description Constructor
   * @param sObjectList
   */
  public AccountsTriggerHandler(List<SObject> sObjectList) {
    super(sObjectList);
  }

  /*
   * @description Interface used to aid the triggerHandler in constructing instances of Domain classes
   * @returns AccountsTriggerHandler - instance
   */
  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new AccountsTriggerHandler(sObjectList);
    }
  }

  /*
   * @description override for the beforeUpdate method
   */
  public override void beforeUpdate(Map<Id, SObject> existingRecords) {
    Accounts.newInstance(
        (List<Account>) getChangedRecords(
          new Set<Schema.SObjectField>{
            Schema.Account.Phone,
            Schema.Account.Fax
          }
        )
      )
      .cleanUpPhoneFields();
  }

  public List<SObject> getAccountsWithChangedNameOrPhone() {
    Set<String> fieldsToCheck = new Set<String>{ 'Phone', 'Fax' };
    return getChangedRecords(fieldsToCheck);
  }

  public List<SObject> getAccountsWithChangedFields() {
    Set<Schema.SObjectField> fieldsToCheck = new Set<Schema.SObjectField>{
      Account.Name,
      Account.Phone,
      Account.Fax,
      Account.Industry
    };

    return getChangedRecords(fieldsToCheck);
  }

  /*
   * @description Update Priority if Type Changed
   */
  public void updatePriorityIfTypeChangedVariantOne() {
    List<SObject> subset = getChangedRecords(
      new Set<Schema.SObjectField>{ Account.Type }
    );

    if (subset.isEmpty()) {
      return;
    }

    Accounts accounts = new Accounts((List<Account>) subset);

    Map<Object, Object> typeToPriorityMap = new Map<Object, Object>{
      'Prospect' => 'Low',
      'Customer - Direct' => 'High',
      'Customer - Channel' => 'Medium'
    };

    accounts.setFieldValueByMap(
      Account.Type,
      Account.CustomerPriority__c,
      typeToPriorityMap
    );
  }

  /*
   * @description Update Priority if Type Changed
   */
  public void updatePriorityIfTypeChangedVariantTwo() {
    List<SObject> subset = getChangedRecords(
      new Set<Schema.SObjectField>{ Account.Type }
    );

    if (subset.isEmpty()) {
      return;
    }

    Map<Object, Object> typeToPriorityMap = new Map<Object, Object>{
      'Prospect' => 'Low',
      'Customer - Direct' => 'High',
      'Customer - Channel' => 'Medium'
    };

    Accounts.newInstance(subset)
      .updateAccountsPriorityOnTypeChange(typeToPriorityMap);
  }
}
