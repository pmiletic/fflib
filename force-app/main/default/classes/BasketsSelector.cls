/*
 * Baskets selector
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public inherited sharing class BasketsSelector extends fflib_SObjectSelector {
  /*
   * @description mandatory method used to create a new instance of a selecto
   */
  public static BasketsSelector newInstance() {
    return (BasketsSelector) Application.Selector.newInstance(
      Basket__c.SObjectType
    );
  }

  /*
   * @returns Schema.SObjectType
   */
  public Schema.SObjectType getSObjectType() {
    return Basket__c.SObjectType;
  }

  /*
   * @description Default selector fields
   *
   * @returns List<Schema.SObjectField>
   */
  private List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Basket__c.Id,
      Basket__c.Name,
      Basket__c.Description__c
    };
  }

  /* Custom methods go here */

  /*
   * @description Returns list of records filtered by basketIds, default selector fields are used
   *
   * @param basketIds - Set<Id>
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectByIds(Set<Id> basketIds) {
    return (List<Basket__c>) this.selectSObjectsById(basketIds);
  }

  /*
   * @description Returns list of records filtered by accountIds, uses fflib_QueryFactory
   *
   * @param basketIds - Set<Id>
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectByIdsUsingNewQueryFactory(Set<Id> basketIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, true); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('Id IN :basketIds');

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records and related object
   *
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectDefaultFieldsWithParentAccount() {
    return Database.query(
      newQueryFactory() // includeSelectorFields = true
        .selectField('Account__r.Id')
        .selectField('Account__r.Name')
        .toSOQL()
    );
  }

  /*
   * @description Returns list of records, fields to query are listed in fieldsToQuery and set using selectFields method
   *
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectFieldsAndAccount() {
    Set<String> fieldsToQuery = new Set<String>{
      'Id',
      'Name',
      'Account__r.Id',
      'Account__r.Name'
    };

    fflib_QueryFactory query = newQueryFactory(false, false, false);
    query.selectFields(fieldsToQuery);

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records, uses default selector fields.
   *              Includes account information using AccountsSelector
   *
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectBasketsAndAccounts() {
    fflib_QueryFactory query = newQueryFactory(); // includeSelectorFields = true
    new AccountsSelector().configureQueryFactoryFields(query, 'Account__r');

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by basketIds, uses default selector fields and fieldsToQuery.
   *              Includes account information using direct listing in fieldsToQuery and selectField method
   *
   * @param basketIds - Set<Id>
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectByIdsAndAccountsDirect(Set<Id> basketIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id', 'Account__r.Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, true); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.selectField('Account__r.Name');
    query.setCondition('Id IN :basketIds');

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by basketIds, uses default selector fields and fieldsToQuery.
   *              Includes account information using direct listing in fieldsToQuery, selectField method and AccountsSelector
   *
   * @param basketIds - Set<Id>
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectByIdsAndAccountsUsingSelector(
    Set<Id> basketIds
  ) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id', 'Account__r.Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, true); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.selectField('Account__r.Name');
    query.setCondition('Id IN :basketIds');

    new AccountsSelector().configureQueryFactoryFields(query, 'Account__r');

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by basketIds, uses fieldset to provide fields info
   *
   * @param basketIds - Set<Id>
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectByIdsUsingFieldSet(Set<Id> basketIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, false); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.selectFieldSet(Schema.SObjectType.Basket__c.fieldSets.Academy);
    query.setCondition('Id IN :basketIds');

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by basketIds, uses fieldsToQuery to provide fields info
   *              ORDER BY - addOrdering method
   *              LIMIT - setLimit method
   *
   * @param basketIds - Set<Id>
   * @returns List<Basket__c>
   */
  public List<Basket__c> selectByIdsWithOrdering(Set<Id> basketIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id', 'Description__c' };

    fflib_QueryFactory query = newQueryFactory(false, false, false); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('Id IN :basketIds');
    query.addOrdering(
      'Description__c',
      fflib_QueryFactory.SortOrder.DESCENDING
    );
    query.setLimit(200);

    return (List<Basket__c>) Database.query(query.toSOQL());
  }

  /*
   * @description Selector override of the getOrderBy method
   *
   * @returns String
   */
  public override String getOrderBy() {
    return 'Name DESC';
  }
}
