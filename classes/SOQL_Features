public class SOQL_Features {
    
    
    // get records for you
    // You can specify filters or Order of records
    public static List<Contact> getContactsByLastname(){
        return [Select Id, Firstname, Lastname FROM Contact WHERE LastName = 'morgan' Order By FirstName ASC];
    }
    
    public static List<Contact> getContactsByLastnameWithLimit(String lastname){
        return [Select Id, Firstname, Lastname FROM Contact WHERE LastName = :lastname Limit 2];
    }
    
    public static List<Contact> getAContactByLastname(String lastname){
        return [Select Id, Firstname, Lastname FROM Contact WHERE LastName = :lastname Limit 1];
    }
    
    public static Contact getAnError(String lastname){
        return [Select Id, Firstname, Lastname FROM Contact WHERE LastName = :lastname Limit 1];
    }
    
    //Calculate values for you
    //AVG(), COUNT(), MIN(), MAX(), SUM(), COUNT_DISTINCT()
    
    public static Integer countForMe(String lastname){
        return [Select count() FROM Contact WHERE LastName = 'morgan' Limit 1];
    }
    
    public static Decimal sumForMe(){
        List<AggregateResult> result = [Select SUM(Amount) totalAmount FROM Opportunity WHERE Account.Name = 'Edge Communications'];
        return (Decimal)result[0].get('totalAmount');
    }
    
    /**** RELATIONSHIP QUERY ****/
    
    //(1) Child to Parent
    
    //You can get information from the parent record
    //using dot notation
    public static List<Contact> getContactsAndAccountInfoBy(){
        return [Select Id, Firstname, Lastname, Account.Name, Account.Website, Account.Is_Top_Contributor__c 
                FROM Contact WHERE LastName = 'Kingsley' Order By FirstName ASC];
    }
    
    //use __r to reference custom object relationships
    public static List<Job_Application__c> getJobApplication(){
        return [Select Name, Job__r.Name FROM Job_Application__c limit 1];
    }
    
    //(2) Parent to Child

	//use the Child Relationship Name (in plural) to query the child object.
    public static Account getAccountAndOppty(){
    	return [Select Name, (Select Name, Amount FROM Opportunities) FROM Account WHERE Account.Name = 'Edge Communications'];    
    }
    
	//use the Child Relationship Name (in plural) + __r 
    public static Job__c getJobAndApplications(){
    	return [Select Name, (Select Name, Applicant__r.Name FROM Job_Applications__r) FROM Job__c WHERE Name = 'Platform Developer I'];    
    }
    

}
