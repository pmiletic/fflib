/*
 * Accounts selector
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public inherited sharing class AccountsSelector extends fflib_SObjectSelector {
  /*
   * @description mandatory method used to create a new instance of a selecto
   */
  public static AccountsSelector newInstance() {
    return (AccountsSelector) Application.Selector.newInstance(
      Account.SObjectType
    );
  }

  /*
   * @returns Schema.SObjectType
   */
  public Schema.SObjectType getSObjectType() {
    return Account.SObjectType;
  }

  /*
   * @description Default selector fields
   *
   * @returns List<Schema.SObjectField>
   */
  private List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Account.Id,
      Account.Name,
      Account.Description
    };
  }

  /* Custom methods go here */

  /*
   * @description Returns list of records filtered by accountIds, default selector fields are used
   *
   * @param accountIds - Set<Id>
   * @returns List<Account>
   */
  public List<Account> selectByIds(Set<Id> accountIds) {
    return (List<Account>) this.selectSObjectsById(accountIds);
  }

  /*
   * @description Returns list of records filtered by accountIds, uses fflib_QueryFactory
   *
   * @param accountIds - Set<Id>
   * @returns List<Account>
   */
  public List<Account> selectByIdsUsingNewQueryFactory(Set<Id> accountIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, true); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('Id IN :accountIds');

    return (List<Account>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by accountIds and active flag
   *
   * @param accountIds - Set<Id>
   * @returns List<Account>
   */
  public List<Account> selectActiveByIds(Set<Id> accountIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, true); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('Id IN :accountIds');
    query.setCondition('Active__c = \'Yes\'');

    return (List<Account>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by industry
   *
   * @param industry - String
   * @returns List<Account>
   */
  public List<Account> selectByIndustry(String industry) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id', 'Name', 'Description' };

    fflib_QueryFactory query = newQueryFactory(false, false, false); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('Industry = :industry');

    return (List<Account>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by revenue limit
   *
   * @param revenueLimit - Decimal
   * @returns List<Account>
   */
  public List<Account> selectByHighRevenue(Decimal revenueLimit) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id', 'Name', 'Description' };

    fflib_QueryFactory query = newQueryFactory(false, false, true); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('AnnualRevenue > :revenueLimit');

    return (List<Account>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by accountIds, uses fflib_QueryFactory and a subquery (subselectQuery method)
   *
   * @param accountIds - Set<Id>
   * @returns List<Account>
   */
  public List<Account> selectByIdsQueryContactsUsingSubquery(
    Set<Id> accountIds
  ) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, false); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.subselectQuery('Contacts')
      .selectFields(new List<String>{ 'Id', 'Name', 'Email' });
    query.setCondition('Id IN :accountIds');

    return (List<Account>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by accountIds, uses fflib_QueryFactory and a subquery (subselectQuery method)
   *
   * @param revenueLimit - Decimal
   * @returns List<Account>
   */
  public List<Account> selectByIdsQueryBasketsUsingSubquery(
    Set<Id> accountIds
  ) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, false); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.subselectQuery('Baskets__r')
      .selectFields(new List<String>{ 'Id', 'Name' });
    query.setCondition('Id IN :accountIds');

    return (List<Account>) Database.query(query.toSOQL());
  }

  /*
   * @description Returns list of records filtered by accountIds, uses BasketsSelector to provide default basket fields
   *
   * @param accountIds - Set<Id>
   * @returns List<Account>
   */
  public List<Account> selectByIdsAndBasketSelectorFields(Set<Id> accountIds) {
    Set<String> fieldsToQuery = new Set<String>{ 'Id' };

    fflib_QueryFactory query = newQueryFactory(false, false, false); // assertCRUD, enforceFLS, includeSelectorFields
    query.selectFields(fieldsToQuery);
    query.setCondition('Id IN :accountIds');
    new BasketsSelector().addQueryFactorySubselect(query, 'Baskets__r');

    return (List<Account>) Database.query(query.toSOQL());
  }
}
