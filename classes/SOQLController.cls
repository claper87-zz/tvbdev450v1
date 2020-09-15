public with sharing class SOQLController {
    public String name {
        get { return name;}
        set { name = value;}
    } 
    
    public List<Contact> queryResult {get; set;}
    
    public PageReference dynamicQuery() {
        String qryString = 'SELECT Id, FirstName, LastName FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%' + name + '%\')';
        queryResult = Database.query(qryString);
        return null;
    }
    
    public PageReference staticQuerySafe() { 
        String queryName = '%' + name + '%';
        queryResult = [SELECT Id, FirstName, LastName FROM Contact WHERE 
           (IsDeleted = false and Name like :queryName)];
        return null; 
    } 
    
    public PageReference dynamicQuerySafe() {
        String qryString = 'SELECT Id, FirstName, LastName FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%' + String.escapeSingleQuotes(name) + '%\')';
        queryResult = Database.query(qryString);
        return null;
    }
}
