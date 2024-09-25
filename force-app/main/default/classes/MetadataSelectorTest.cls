@IsTest
public with sharing class MetadataSelectorTest {

    @IsTest
    static void selectByDeveloperName() {
        CustomMetadataSelector selector = new CustomMetadataSelector();
        Object obj = selector.selectByDeveloperName(null);
        System.assertEquals(null, obj, 'Should return null');
        Assert.areEqual(0, Limits.getQueries(), 'SOQL query was executed');
    }

    @IsTest
    static void selectAll() {
        CustomMetadataSelector selector = new CustomMetadataSelector();
        Map<String, Object> objs = selector.selectAll();
        System.assertEquals(null, objs, 'Should return null');
        Assert.areEqual(0, Limits.getQueries(), 'SOQL query was executed');
    }

    @IsTest
    static void selectByQualifiedApiName() {
        CustomMetadataSelector selector = new CustomMetadataSelector();
        Object obj = selector.selectByQualifiedApiName(null);
        System.assertEquals(null, obj, 'Should return null');
        Assert.areEqual(0, Limits.getQueries(), 'SOQL query was executed');
    }

    @IsTest
    static void selectById() {
        CustomMetadataSelector selector = new CustomMetadataSelector();
        Object obj = selector.selectById(null);
        System.assertEquals(null, obj, 'Should return null');
        Assert.areEqual(0, Limits.getQueries(), 'SOQL query was executed');
    }
    
    @IsTest
    static void getSObjectFieldListTest() {
        CustomMetadataSelector selector = new CustomMetadataSelector();
        List<Schema.SObjectField> fieldList = selector.getSObjectFieldList();
        System.assertEquals(null, fieldList, 'Should return null');
        Assert.areEqual(0, Limits.getQueries(), 'SOQL query was executed');
    }

    @IsTest
    static void getSObjectTypeTest() {
        CustomMetadataSelector selector = new CustomMetadataSelector();
        Schema.SObjectType sObjType = selector.getSObjectType();
        System.assertEquals(null, sObjType, 'Should return null');
        Assert.areEqual(0, Limits.getQueries(), 'SOQL query was executed');
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