public with sharing class NewAccountController {

	public Account account { get; private set; }



	public NewAccountController() {
		String accountId = ApexPages.currentPage().getParameters().get('id');

		account = accountId == null
					? new Account()
					: [SELECT Id, Name, Phone, Industry, Type FROM Account WHERE id = :accountId];
	}

	public PageReference save() {
		try {
			upsert account;
		} catch(Exception ex) {
			ApexPages.addMessages(ex);
		}
		// After save, redirect to record page
		PageReference redirectSuccess = new ApexPages.StandardController(account).view();
		return redirectSuccess;
	}


}