/*
 * Cases service
 */
public without sharing class CasesService {
  public static CasesService newInstance() {
    return (CasesService) Application.Service.newInstance(CasesService.class);
  }

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

  public void ordinaryMethod(List<Case> casesList) {
  }

  public void unitOfWorkDependency(
    fflib_ISObjectUnitOfWork uow,
    List<Case> casesList
  ) {
    uow.registerDirty(casesList);
  }

  public void unitOfWorkLocal(List<String> contentDocumentIds) {
    fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

    for (String contentDocumentId : contentDocumentIds) {
      ContentDocumentLink contactDocumentLink = new ContentDocumentLink();
      contactDocumentLink.ContentDocumentId = contentDocumentId;
      uow.registerNew(contactDocumentLink);
    }

    uow.commitWork();
  }
}
