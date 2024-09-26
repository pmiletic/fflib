/*
 * MetadataSelector wrapper
 */
public abstract with sharing class MetadataSelector extends fflib_SObjectSelector {
  /*
   * @returns Schema.SObjectType
   */
  public virtual Schema.SObjectType getSObjectType() {
    return null;
  }

  /*
   * @description Default selector fields
   *
   * @returns List<Schema.SObjectField>
   */
  public virtual List<Schema.SObjectField> getSObjectFieldList() {
    return null;
  }

  /*
   * @description Returns a map containing custom metadata
   *              records for the specific custom metadata type. The map keys are the
   *              record DeveloperNames and the map values are the record sObjects
   */
  public abstract Map<String, Object> selectAll();

  /*
   * @description Returns a single custom metadata type record sObject for a specified record ID
   */
  public virtual Object selectById(Id recordId) {
    return null;
  }

  /*
   * @description Returns a single custom metadata type record sObject
   *              for a specified developerName field of the custom metadata type object.
   */
  public abstract Object selectByDeveloperName(String developerName);

  /*
   * @description Returns a single custom metadata type record sObject for a qualified API name
   */
  public virtual Object selectByQualifiedApiName(String qualifiedApiName) {
    return null;
  }
}
