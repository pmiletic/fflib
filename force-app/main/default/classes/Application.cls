/*
 * Application class - entry point for fflib implementation
*/
public with sharing class Application {
    public static final fflib_Application.UnitOfWorkFactory unitOfWork = new fflib_Application.UnitOfWorkFactory(
        new List<SObjectType>{}
    );

    public static final fflib_Application.ServiceFactory service = new fflib_Application.ServiceFactory(
        new Map<Type, Type>{
            CasesService.class => CasesService.class,
            OpportunitiesService.class => OpportunitiesService.class
        }
    );

    public static final fflib_Application.SelectorFactory selector = new fflib_Application.SelectorFactory(
        new Map<SObjectType, Type>{
            Account.sObjectType => AccountsSelector.class,
            Basket__c.sObjectType => BasketsSelector.class
        }
    );

    public static final fflib_Application.DomainFactory domain = new fflib_Application.DomainFactory(
        Application.Selector,
        new Map<SObjectType, Type>{
            Account.sObjectType => Accounts.Constructor.class,
            Case.sObjectType => Cases.Constructor.class,
            Opportunity.sObjectType => Opportunities.Constructor.class,
            Lead.sObjectType => Lead.Constructor.class
        }
    );
}
