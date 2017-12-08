global class CreateContactForAccountBatch implements Database.Batchable<sObject> {
	
	String query;
	
	global CreateContactForAccountBatch() {
		query = 'SELECT Id, Name, Type FROM Account';
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<Account> accounts) {
		System.debug('Execute method called');
		System.debug('Accounts: ' + accounts);

		List<Contact> contacts = new List<Contact>();

		for(Account account : accounts) {
			System.debug('Creating contact for account: ' + account);
			contacts.add(
				new Contact(FirstName='My Little', LastName='Pony', AccountId=account.Id)
			);
		}

		insert contacts;

		System.debug('finished processing records');
	}
	
	global void finish(Database.BatchableContext BC) {
		System.debug('Finished processing all batches');
	}
	
}