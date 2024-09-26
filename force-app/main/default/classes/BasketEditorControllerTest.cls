/*
 * Test class for BasketEditorController which uses mocking
 */
@IsTest(IsParallel=true)
private class BasketEditorControllerTest {
  static Basket__c setupTest() {
    return new Basket__c(
      Id = fflib_IDGenerator.generate(Schema.Basket__c.SObjectType),
      Account__c = fflib_IDGenerator.generate(Schema.Account.SObjectType),
      Opportunity__c = fflib_IDGenerator.generate(
        Schema.Opportunity.SObjectType
      )
    );
  }

  static void setupMock(Basket__c basket) {
    fflib_ApexMocks mocks = new fflib_ApexMocks();

    BasketsSelector selectorMock = (BasketsSelector) mocks.mock(
      BasketsSelector.class
    );

    mocks.startStubbing();
    mocks.when(selectorMock.SObjectType())
      .thenReturn(Schema.Basket__c.SObjectType);
    mocks.when(
        selectorMock.selectByIds(new Set<Id>{ basket.Id })
        // (Set<Id>) fflib_Match.anyObject()
      )
      .thenReturn(new List<Basket__c>{ basket });
    mocks.stopStubbing();

    Application.selector.setMock(selectorMock);
  }

  @IsTest
  static void testGetBasket() {
    Basket__c basket = setupTest();
    setupMock(basket);

    Test.startTest();

    Test.setCurrentPageReference(Page.BasketEditor);
    ApexPages.currentPage().getParameters().put('Id', basket.Id);
    BasketEditorController controller = new BasketEditorController();
    Test.stopTest();

    Assert.areEqual(basket.Id, controller.basket.Id, 'Invalid data');
  }
}
