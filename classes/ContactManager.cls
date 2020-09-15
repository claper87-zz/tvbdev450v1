public with sharing class ContactManager {

    public ID addContactMember(String lastNameToInsert, String firstNameToInsert) {
        Contact contactToAdd = new Contact(FirstName=firstNameToInsert,
										   LastName=lastNameToInsert);
        insert contactToAdd;
        System.debug('contactToAdd recordID is: ' + contactToAdd.Id);
        return contactToAdd.Id;
    }
    
    public static ID addContact(String lastNameToInsert, String firstNameToInsert) {
        Contact contactToAdd = new Contact(FirstName=firstNameToInsert,
                                           LastName=lastNameToInsert);
        insert contactToAdd;
        System.debug('contactToAdd recordID is: ' + contactToAdd.Id);
        return contactToAdd.Id;
    }
}
