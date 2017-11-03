trigger LeadTrigger on Lead (before insert,
							after insert,
							before update,
							after update,
							before delete,
							after delete,
							after undelete
) {


	System.debug('Trigger.isInsert: ' + Trigger.isInsert);
	System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
	System.debug('Trigger.isDelete: ' + Trigger.isDelete);
	System.debug('Trigger.isUndelete: ' + Trigger.isUndelete);

	System.debug('Trigger.isBefore: ' + Trigger.isBefore);
	System.debug('Trigger.isAfter: ' + Trigger.isAfter);





	// Records in new state being inserted to the DB
	List<Lead> leads = Trigger.new;
	Map<Id, Lead> leadMap = Trigger.newMap;

	// Records are populated with old values before update
	List<Lead> oldLeads = Trigger.old;
	Map<Id, Lead> oldLeadMap = Trigger.oldMap;


	System.debug('Trigger.new: ' + Trigger.new);
	System.debug('Trigger.newMap: ' + Trigger.newMap);
	System.debug('Trigger.old: ' + Trigger.old);
	System.debug('Trigger.oldMap: ' + Trigger.oldMap);



	// Comman way to choose what code to call and when
	if(Trigger.isBefore && trigger.isInsert) {
		// call your code to do stuff
		// Call helper methods
		
		// Change first lead title to King - NO DML NEEDED IN "BEFORE" CONTEXT
		leads[0].Title = 'King';

	} else if(Trigger.isAfter && trigger.isUpdate) {
		// do stuff after update!
		// call helper methods
		
		leads[0].Title = leads[0].Id;
		/// AS practice, show editing a lead in the "after" context
		/// update the record, and avoid recursion
	}




}