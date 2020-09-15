({
	init: function (cmp, event, helper) {
        cmp.set('v.mycolumns', [
            {label: 'FirstName', fieldName: 'FirstName', type: 'text'},
            {label: 'LastName', fieldName: 'LastName', type: 'text'}
        ]);

    },
    
    performSearch: function (cmp, event, helper){
    	helper.fetchData(cmp);
	},
    
    handleComponentEvent: function (cmp, event, helper){
        var contact = event.getParam("selectedContact");
        // set the handler attributes based on event data
        
        var selectcontacts = cmp.get("v.selectedContacts");
        selectcontacts.push(contact);
        cmp.set("v.selectedContacts", selectcontacts);

    }

})
