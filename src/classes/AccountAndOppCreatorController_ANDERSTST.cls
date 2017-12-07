@isTest
private class AccountAndOppCreatorController_ANDERSTST {
	

	private static AccountAndOppCreatorController_ANDERS initData() {
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();
		controller.account.Name = 'Test Name';
		controller.account.AccountNumber = 'Test AccountNumber';
		controller.account.Description = 'Test Description';
		controller.account.Type = 'Other';
		// account type set automatically

		controller.contact.FirstName = 'My Little';
		controller.contact.LastName = 'Pony';
		controller.contact.Salutation = 'Mr.';

		controller.opportunity.Name = 'Opp Name';
		controller.opportunity.Type = 'New Customer';
		// stageName and closedate are set automatically
		
		return controller;
	}


	@isTest static void testControllerInit() {
		// Implement test code
		AccountAndOppCreatorController_ANDERS controller = new AccountAndOppCreatorController_ANDERS();
		
		System.assertNotEquals(null, controller.account);
		System.assertNotEquals(null, controller.contact);
		System.assertNotEquals(null, controller.opportunity);
		System.assertEquals(false, controller.showCreatedDataSection);

		System.assertEquals('Needs Analysis', controller.opportunity.StageName);
		System.assertEquals(Date.today().addDays(30), controller.opportunity.CloseDate);
	}
	
	@isTest static void testAccountNameRequired() {
		AccountAndOppCreatorController_ANDERS controller = initData();
		
		controller.account.Name = null;

		controller.saveData();

		System.assertEquals(1, ApexPages.getMessages().size());
		// query accounts, contacts, opps - make sure size = 0
		List<Account> accounts = [SELECT Id FROM Account];
		List<Contact> contact = [SELECT Id FROM Contact];
		List<Opportunity> opportunity = [SELECT Id FROM Opportunity];

		System.assertEquals(0, accounts.size());
		System.assertEquals(0, contact.size());
		System.assertEquals(0, opportunity.size());
	}
	

	@isTest static void testAccountNumberRequired() {
		// Implement test code
	}
	/// CONTINUE THIS WITH ALL REQUIRED FIELDS
	
	@isTest static void testOppNameDafultsToAccountName() {
		// If opp name is null, should be set to account name
	}

	@isTest static void testOppNameRetainsValue() {
		// ensure that specified opp name is not overwritten
	}

	@isTest static void testSuccessPath() {
		// Test that everything was created
		// test that all values were re-initialized
		// test that bottom section of UI is shown
		// test that bottom section of ui shows correct data
		// test that init values were set
	}
}