@IsTest
public with sharing class MetadataSelectorTest {
  @IsTest
  static void selectByDeveloperName() {
    CustomMetadataSelector selector = new CustomMetadataSelector();
    Object obj = selector.selectByDeveloperName(null);
    System.assertEquals(null, obj, 'Expected null');
    Assert.areEqual(0, Limits.getQueries(), 'Zero SOQL query was run');
  }

  @IsTest
  static void selectAll() {
    CustomMetadataSelector selector = new CustomMetadataSelector();
    Map<String, Object> objs = selector.selectAll();
    System.assertEquals(null, objs, 'Expected null');
    Assert.areEqual(0, Limits.getQueries(), 'Zero SOQL query was run');
  }

  @IsTest
  static void selectByQualifiedApiName() {
    CustomMetadataSelector selector = new CustomMetadataSelector();
    Object obj = selector.selectByQualifiedApiName(null);
    System.assertEquals(null, obj, 'Expected null');
    Assert.areEqual(0, Limits.getQueries(), 'Zero SOQL query was run');
  }

  @IsTest
  static void selectById() {
    CustomMetadataSelector selector = new CustomMetadataSelector();
    Object obj = selector.selectById(null);
    System.assertEquals(null, obj, 'Expected null');
    Assert.areEqual(0, Limits.getQueries(), 'Zero SOQL query was run');
  }

  @IsTest
  static void getSObjectFieldListTest() {
    CustomMetadataSelector selector = new CustomMetadataSelector();
    List<Schema.SObjectField> fieldList = selector.getSObjectFieldList();
    System.assertEquals(null, fieldList, 'Expected null');
    Assert.areEqual(0, Limits.getQueries(), 'Zero SOQL query was run');
  }

  @IsTest
  static void getSObjectTypeTest() {
    CustomMetadataSelector selector = new CustomMetadataSelector();
    Schema.SObjectType sObjType = selector.getSObjectType();
    System.assertEquals(null, sObjType, 'Expected null');
    Assert.areEqual(0, Limits.getQueries(), 'Zero SOQL query was run');
  }

  public class CustomMetadataSelector extends MetadataSelector {
    public override Object selectByDeveloperName(String developerName) {
      return null;
    }

    public override Map<String, Object> selectAll() {
      return null;
    }
  }
}
