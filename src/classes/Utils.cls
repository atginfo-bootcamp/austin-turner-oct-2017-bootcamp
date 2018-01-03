public without sharing class Utils {

	public static List<SObject> checkForChangedFields(List<SObject> newRecords, Map<Id, SObject> oldRecordMap, String field) {
		return checkForChangedFields(newRecords, oldRecordMap, new List<String>{ field });
	}

	public static List<SObject> checkForChangedFields(List<SObject> newRecords, Map<Id, SObject> oldRecordMap, List<String> fields) {
		List<SObject> changedRecords = new List<SObject>();

		for(SObject newRecord : newRecords) {
			Id newRecordId = (Id) newRecord.get('Id');
			SObject oldRecord = oldRecordMap.get(newRecordId);

			for(String field : fields) {
				try {
					if(newRecord.get(field) != oldRecord.get(field)) {
						System.debug('field changed: ' + field);
						System.debug('field changed record: ' + newRecord);
						changedRecords.add(newRecord);
						break;
					}
				} catch (Exception ex) {
					System.debug('Exception thrown while checking field: ' + ex.getMessage());
				}
			}
		}

		return changedRecords;
	}

	public static List<SObject> checkForChangedFields(List<SObject> newRecords, Map<Id, SObject> oldRecordMap, String field, String expectedValue) {
		
		List<SObject> changedRecordsOutput = new List<SObject>();

		List<SObject> changedRecords = checkForChangedFields(newRecords, oldRecordMap, field);

		System.debug('changedRecords: ' + changedRecords);

		for(SObject changedRecord : changedRecords) {
			if(changedRecord.get(field) == expectedValue) {
				System.debug('field matched expected value: ' + changedRecord);
				changedRecordsOutput.add(changedRecord);
			} else {
				System.debug('field NOT matched expected value: ' + changedRecord);
			}
		}

		return changedRecordsOutput;

	}

}









