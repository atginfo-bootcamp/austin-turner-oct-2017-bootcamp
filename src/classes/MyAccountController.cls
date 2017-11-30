public with sharing class MyAccountController {
	
	private final Account account;

	public MyAccountController() {
		System.debug('MyAccountController()');
		String accountId = ApexPages.currentPage().getParameters().get('id');
		account = [
			SELECT Id, Name, Type FROM Account WHERE id = :accountId
		];
	}

	public Account getAccount() {
		return account;
	}

	public PageReference save() {
		update account;
		return null;
	}


}