public abstract with sharing class MetadataSelector extends fflib_SObjectSelector {
    // getAll()
    public abstract Map<String, Object> selectAll();

    // getInstance(recordId)
    public virtual Object selectById(Id recordId) {
        return null;
    }

    // getInstance(developerName)
    public abstract Object selectByDeveloperName(String developerName);

    // getInstance(qualifiedApiName)
    public virtual Object selectByQualifiedApiName(String qualifiedApiName) {
        return null;
    }

    public virtual List<Schema.SObjectField> getSObjectFieldList() {
        return null;
    }

    public virtual Schema.SObjectType getSObjectType() {
        return null;
    }
}
