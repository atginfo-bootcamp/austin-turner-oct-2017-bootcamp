public with sharing class PassByReferenceExample {



	public static void execute() {

		Account myAccount = new Account(Name='My Little Pony', Type='Other');
		System.debug('initial value of my account: ' + myAccount);

		modifyAccount(myAccount);
		System.debug('after calling modifyAccount(): ' + myAccount);

		modifyAccountName(myAccount.Name);
		System.debug('after calling modifyAccountName(): ' + myAccount);

	}


	// This method takes an account By Reference and modified properties on it
	// Original variable will be modified
	public static void modifyAccount(Account account) {

		account.Name = 'THE NAME WAS CHANGED IN modifyAccount()';
		account.Type = 'Prospect';

	}

	// This methods takes the account name as a string (Primitive Data Type) and modifies it
	// This will not modif the original variable
	public static void modifyAccountName(String accountName) {
		accountName = accountName + ' I CHANGEED THE NAME AGAIN';
	}




}