/*
* Accounts domain class
*/
public with sharing class Accounts extends fflib_SObjects {

    // Constructor
    public Accounts(List<SObject> records) {
        super(records);
    }

    // Optional Constructor
    public Accounts(List<SObject> records, Schema.SObjectType sObjectType) {
        super(records, sObjectType);
    }

    /**
     * Dynamically constructs an instance of the Domain class for the given records
     *   Will return a Mock implementation if one has been provided via setMock
     *
     * @param records A concrete list (e.g. List<Account> vs List<SObject>) of records
     * @exception Throws an exception if the SObjectType cannot be determined from the list
     *              or the constructor for Domain class was not registered for the SObjectType
     **/
    public static Accounts newInstance(List<Account> records) {
        return (Accounts) Application.Domain.newInstance(records);
    }

    /*
    * @return Returns list of sObjects
    */
    public List<Account> getAccounts() {
        return (List<Account>) getRecords();
    }

    /* Custom methods go here */

    /*
    * @description Reset phone and fax fields
    */
    public void cleanUpPhoneFields() {
        for (Account record : getAccounts()) {
            record.Phone = null;
            record.Fax = null;
        }
    }

    /*
     * @description Inner IDomainConstructor class is needed for Application to provide this Accounts as domain instance
     * 
     * @returns Accounts instance
    */
    public class Constructor implements fflib_IDomainConstructor {
        public fflib_SObjects construct(List<Object> objectList) {
            return new Accounts((List<SObject>) objectList);
        }
    }
}