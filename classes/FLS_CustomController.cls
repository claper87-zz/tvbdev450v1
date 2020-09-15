public class FLS_customController {

    public Account accountInContext {get; set;}
    
    public FLS_customController(){
        accountInContext = [Select Id, Industry, Name, Is_Top_Contributor__c from Account where Name = 'Edge Communications' limit 1]; 
    }
}
