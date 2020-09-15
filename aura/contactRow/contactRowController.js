({
	onCheck : function(component, event, helper) {
        var cmpEvent = component.getEvent("selectContact");
        cmpEvent.setParams({
            "selectedContact" : component.get("v.thisContact")
         });
        cmpEvent.fire();
		
	}
})
