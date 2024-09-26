@IsTest(IsParallel=true)
public with sharing class BasketsSelectorTest {
  @IsTest
  static void testSelectByIds() {
    BasketsSelector.newInstance()
      .selectByIds(
        new Set<Id>{ fflib_IDGenerator.generate(Basket__c.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsUsingNewQueryFactory() {
    BasketsSelector.newInstance()
      .selectByIdsUsingNewQueryFactory(
        new Set<Id>{ fflib_IDGenerator.generate(Basket__c.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectDefaultFieldsWithParentAccount() {
    BasketsSelector.newInstance().selectDefaultFieldsWithParentAccount();
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectFieldsAndAccount() {
    BasketsSelector.newInstance().selectFieldsAndAccount();
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectBasketsAndAccounts() {
    BasketsSelector.newInstance().selectBasketsAndAccounts();
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsAndAccountsDirect() {
    BasketsSelector.newInstance()
      .selectByIdsAndAccountsDirect(
        new Set<Id>{ fflib_IDGenerator.generate(Basket__c.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsAndAccountsUsingSelector() {
    BasketsSelector.newInstance()
      .selectByIdsAndAccountsUsingSelector(
        new Set<Id>{ fflib_IDGenerator.generate(Basket__c.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsUsingFieldSet() {
    BasketsSelector.newInstance()
      .selectByIdsUsingFieldSet(
        new Set<Id>{ fflib_IDGenerator.generate(Basket__c.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsWithOrdering() {
    BasketsSelector.newInstance()
      .selectByIdsWithOrdering(
        new Set<Id>{ fflib_IDGenerator.generate(Basket__c.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testGetOrderBy() {
    string value = BasketsSelector.newInstance().GetOrderBy();
    Assert.areEqual('Name DESC', value, 'Name DESC is expected');
  }
}
