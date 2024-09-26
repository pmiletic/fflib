/*
 * Example of a test class that does not use mocking
 */
@IsTest(IsParallel=true)
public with sharing class BasketEditorControllerNoMockTest {
  @TestSetup
  static void makeData() {
    Account acc = new Account();
    acc.Name = 'Test';
    insert acc;

    Opportunity opp = new Opportunity();
    opp.Name = 'Test Opp';
    opp.StageName = 'Prospecting';
    opp.CloseDate = Date.today().addDays(30);
    opp.AccountId = acc.Id;
    insert opp;

    Basket__c basket = new Basket__c();
    basket.Account__c = acc.Id;
    basket.Opportunity__c = opp.Id;
    insert basket;
  }

  @IsTest
  private static void getBasketRecord() {
    Basket__c basket = [SELECT Id, Name FROM Basket__c LIMIT 1];

    Test.startTest();

    Test.setCurrentPageReference(Page.BasketEditor);
    ApexPages.currentPage().getParameters().put('Id', basket.Id);
    BasketEditorController controller = new BasketEditorController();
    Test.stopTest();

    Assert.areEqual(basket.Id, controller.basket.Id, 'Invalid data');
  }
}
