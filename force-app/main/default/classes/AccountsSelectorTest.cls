@IsTest(IsParallel=true)
public with sharing class AccountsSelectorTest {
  @IsTest
  static void testSelectByIds() {
    AccountsSelector.newInstance()
      .selectByIds(
        new Set<Id>{ fflib_IDGenerator.generate(Account.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsUsingNewQueryFactory() {
    AccountsSelector.newInstance()
      .selectByIdsUsingNewQueryFactory(
        new Set<Id>{ fflib_IDGenerator.generate(Account.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectActiveByIds() {
    AccountsSelector.newInstance()
      .selectActiveByIds(
        new Set<Id>{ fflib_IDGenerator.generate(Account.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIndustry() {
    AccountsSelector.newInstance().selectByIndustry('Information Technology');
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByHighRevenue() {
    AccountsSelector.newInstance().selectByHighRevenue(1000000);
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsQueryContactsUsingSubquery() {
    AccountsSelector.newInstance()
      .selectByIdsQueryContactsUsingSubquery(
        new Set<Id>{ fflib_IDGenerator.generate(Account.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsQueryBasketsUsingSubquery() {
    AccountsSelector.newInstance()
      .selectByIdsQueryBasketsUsingSubquery(
        new Set<Id>{ fflib_IDGenerator.generate(Account.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }

  @IsTest
  static void testSelectByIdsAndBasketSelectorFields() {
    AccountsSelector.newInstance()
      .selectByIdsAndBasketSelectorFields(
        new Set<Id>{ fflib_IDGenerator.generate(Account.SObjectType) }
      );
    Assert.areEqual(1, Limits.getQueries(), 'One query should have run');
  }
}
