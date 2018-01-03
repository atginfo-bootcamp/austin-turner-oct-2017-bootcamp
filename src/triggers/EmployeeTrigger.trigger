trigger EmployeeTrigger on Employee__c (before update) {

	if(Trigger.isUpdate && Trigger.isBefore) {
		LocationManagement.updateStatusDateOnStatusChange(Trigger.new, Trigger.oldMap);
	}

}