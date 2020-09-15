public class Merge_Feature {
    
    Account master;
    
    public void createAccounts(){
        master = new Account(Name='Account1');
        insert master;
        
        List<Account> duplicates = new List<Account>();
        duplicates.add(new Account(Name='Account1, Inc.'));
        duplicates.add(new Account(Name='Account 1'));
        insert duplicates;
        
        // Create child contact and associate it with first account
        Contact c = new Contact(firstname='Joe',lastname='Smith', accountId=duplicates[0].Id);
        insert c;
    }
    
    public void mergeAccounts(){
        master = [Select Id FROM Account WHERE Name = 'Account1' LIMIT 1];
        List<Account> duplicates = [Select Id FROM Account WHERE Name = 'Account1, Inc.' OR Name = 'Account 1'];
        Database.MergeResult[] results = Database.merge(master, duplicates, false);
        processResults(results);
    }
    
    public void processResults(List<Database.MergeResult> results){
        for(Database.MergeResult res : results) {
            if (res.isSuccess()) {
                // Get the master ID from the result and validate it
                System.debug('Master record ID: ' + res.getId());
                System.assertEquals(master.Id, res.getId());              
                
                // Get the IDs of the merged records and display them
                List<Id> mergedIds = res.getMergedRecordIds();
                System.debug('IDs of merged records: ' + mergedIds);                  
            }
        } 
    }
    
}
