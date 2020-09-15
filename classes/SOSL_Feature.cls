public class SOSL_Features {

    /*
     *  ALL FIELDS
        NAME FIELDS
        EMAIL FIELDS
        PHONE FIELDS
        SIDEBAR FIELDS
     * 
     * */
    
    public static List<List<SObject>> findWithSOSL(){
        return [FIND 'SFDC' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName)];
    }
    
}
