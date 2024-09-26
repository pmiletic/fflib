/*
 * APEX Controller for a BasketEditor visual force page
 */
public with sharing class BasketEditorController {
  private Id basketId { get; private set; }

  /*
   * @description basket getter
   */
  public Basket__c basket {
    get {
      return this.basket == null ? getBasketRecord(this.basketId) : basket;
    }
    set {
      this.basket = value;
    }
  }

  /*
   * Constructor
   */
  public BasketEditorController() {
    this.basketId = ApexPages.CurrentPage().getParameters().get('Id');
  }

  /*
   * @description Returns basket object using recordId
   * @param recordId - basket id
   * @returns Basket__c
   */
  private Basket__c getBasketRecord(Id recordId) {
    List<Basket__c> objs = BasketsSelector.newInstance()
      .selectByIds(new Set<Id>{ recordId });
    return objs.isEmpty() ? null : objs[0];
  }
}
