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

}