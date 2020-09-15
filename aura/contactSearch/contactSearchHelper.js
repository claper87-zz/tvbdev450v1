({
	fetchData: function (cmp) {
        //Step 0 
        let searchText = cmp.get("v.searchString");
        
        //Step 1
        let apexMethod = cmp.get("c.searchContact");
        apexMethod.setParams({ name : searchText });
        
        //Step 2
        apexMethod.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.contactList",response.getReturnValue());
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        //Step 3
        $A.enqueueAction(apexMethod);
        
    }
})
