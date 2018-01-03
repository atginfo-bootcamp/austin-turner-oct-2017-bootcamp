trigger ProductTrigger on Product2 (after update) {

	if(Trigger.isAfter && Trigger.isUpdate) {
		ProductTriggerHelper.handleAfterUpdate(Trigger.new, Trigger.oldMap);
	}

}