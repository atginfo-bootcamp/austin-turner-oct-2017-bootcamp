//
// to invoke from dev console: Day3ListsAndLoops.execute();
// 
public with sharing class Day3ListsAndLoops {

	public static void execute() {

		// Create string variable called myName
		String myName = 'Austin';

		// Create new empty list called names
		// THIS IS THE PREFERRED WAY TO INITIALIZE
		List<String> names = new List<String>();

		// Create new list with default values
		List<String> students = new List<String>{'Student 1', 'Student 2'};

		// Alternate syntax for creating a new array (list) with 20 empty items
		String[] employees = new String[20];

		names.add('Austin1');
		names.add('Austin2');
		names.add('Austin3');
		names.add('Austin4');

		System.debug('names: ' + names);

		names.remove(3); // remove item at index 3, which is Austin4

		System.debug('names after last element removed: ' + names);

		// dynamically remove last element in array
		names.remove(names.size() - 1);

		System.debug('names after removing using names.size(): ' + names);

		Set<String> uniqueNames = new Set<String>();

		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');
		uniqueNames.add('Austin');

		// Store the number of items in our set
		Integer setSize = uniqueNames.size();

		System.debug('uniqueNames: ' + uniqueNames);
		System.debug('setSize: ' + setSize);

	}


	public static void executeLoops() {

		// for loop takes three parameters
		// indexVariable
		// condition
		// counterVariable

		for(Integer i = 0; i < 10; i++) {
			System.debug('i: ' + i);
		}


		List<String> names = new List<String>();

		names.add('austin1');
		names.add('austin2');
		names.add('austin3');
		names.add('austin4');

		for(Integer i = 0; i < names.size(); i++) {
			System.debug(names.get(i));
		}

		for(Integer i = 0; i < names.size(); i++) {
			System.debug(names[i]);
		}

		// Advanced for loop - loop every item in list
		for(String name : names) {
			System.debug(name);
		}

	}

	public static void createNewAccount() {

		Account myAccount = new Account();
		myAccount.Name = 'atg';
		myAccount.Type = 'Prospect';

		System.debug('myAccount before insert: ' + myAccount);

		insert myAccount;

		System.debug('myAccount after insert: ' + myAccount);

	}


	public static void updateExistingAccount() {
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type
			FROM Account
			WHERE Name = 'atg'
			LIMIT 1
		];
		System.debug(queriedAccounts);

		if(queriedAccounts.size() > 0) {

			Account myAccount = queriedAccounts[0];
			myAccount.Name = 'CHANGED ACCOUNT NAME';

			update myAccount;
		}
	}

	public static void updateAccountTypeOnEveryAccount() {
		// Query all accounts
		// Print out all accounts to console
		// Loop through accounts
		// Updated Type to 'Other'
		// Print out the account to the console
		// Update accounts (DML)
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type
			FROM Account
		];

		System.debug(queriedAccounts);

		for(Account currAccount : queriedAccounts) {
			currAccount.Type = 'Other';
		}

		update queriedAccounts;
	}

}


