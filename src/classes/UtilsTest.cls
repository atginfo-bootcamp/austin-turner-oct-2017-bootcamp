@isTest
private class UtilsTest {
	
	@TestSetup
	public static void setup() {

	}


	@isTest static void checkForChangedFieldsTest() {
		// Implement test code

		List<Account> accounts = new List<Account>{
			new Account(Id='0011I00000EyXKi', Name='test name'),
			new Account(Id='0011I00000EyXK2', Name='test name')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{
			'0011I00000EyXKi' => new Account(Id='0011I00000EyXKi', Name='test name CHANGED'),
			'0011I00000EyXK2' => new Account(Id='0011I00000EyXK2', Name='test name')
		};

		// Above is a shortcut for the following:
		// 
		// oldAccountMap.put('0011I00000EyXKi', new Account(Id='0011I00000EyXKi', Name='test name CHANGED'));

		String fieldsToCheck = 'Name';

		List<SObject> changedRecords = Utils.checkForChangedFields(accounts, oldAccountMap, fieldsToCheck);

		// assert size
		System.assertEquals(1, changedRecords.size());
		System.assertEquals(accounts[0], changedRecords[0]);
	}
	
	@isTest static void checkForChangedFieldsTestException() {
		// Implement test code
		
		List<Account> accounts = new List<Account>{
			new Account(Id='0011I00000EyXKi', Name='test name'),
			new Account(Id='0011I00000EyXK2', Name='test name', Type='Other')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{
			'0011I00000EyXKi' => new Account(Id='0011I00000EyXKi', Name='test name CHANGED'),
			'0011I00000EyXK2' => new Account(Id='0011I00000EyXK2', Name='test name', Type='Prospect')
		};

		// Above is a shortcut for the following:
		// 
		// oldAccountMap.put('0011I00000EyXKi', new Account(Id='0011I00000EyXKi', Name='test name CHANGED'));

		List<String> fieldsToCheck = new List<String>{'Name', 'i dont exist', 'Type'};

		List<SObject> changedRecords = Utils.checkForChangedFields(accounts, oldAccountMap, fieldsToCheck);

		// assert size
		System.assertEquals(2, changedRecords.size());
		System.assertEquals(accounts[0], changedRecords[0]);
		System.assertEquals(accounts[1], changedRecords[1]);
	}

	@isTest static void checkForChangedFieldsTestExpectedVal() {
		// Implement test code
		
		List<Account> accounts = new List<Account>{
			new Account(Id='0011I00000EyXKi', Name='test name', Type='Other'),
			new Account(Id='0011I00000EyXK2', Name='test name', Type='External')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{
			'0011I00000EyXKi' => new Account(Id='0011I00000EyXKi', Name='test name', Type='Prospect'),
			'0011I00000EyXK2' => new Account(Id='0011I00000EyXK2', Name='test name', Type='Prospect')
		};

		// Above is a shortcut for the following:
		// 
		// oldAccountMap.put('0011I00000EyXKi', new Account(Id='0011I00000EyXKi', Name='test name CHANGED'));

		List<SObject> changedRecords = Utils.checkForChangedFields(accounts, oldAccountMap, 'Type', 'Other');

		// assert size
	// UPDATE THESE!!!!
		System.assertEquals(1, changedRecords.size());
		System.assertEquals(accounts[0], changedRecords[0]);
	}

}