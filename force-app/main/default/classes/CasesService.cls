/*
 * Cases service
 */
public without sharing class CasesService {
  /**
   * @description Dynamically constructs an instance of the Service class for the given records
   *   Will return a Mock implementation if one has been provided via setMock
   *
   * @returns CasesService
   **/
  public static CasesService newInstance() {
    return (CasesService) Application.Service.newInstance(CasesService.class);
  }

  /*
   * @description Update account status
   *
   * @param casesList - List<Case>
   */
  public void updateAccountStatus(List<Case> casesList) {
    fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

    for (Case obj : casesList) {
      if (obj.AccountId == 'some value') {
        uow.registerDirty(
          new Account(Id = obj.AccountId, Description = 'updated from service')
        );
      }
    }

    uow.commitWork();
  }
}
