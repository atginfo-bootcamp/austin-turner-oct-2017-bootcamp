public with sharing class BulkDeleteAccountsController {

	//public List<Account> accounts;
	public List<AccountWrapper> accountWrappers {get; set;}
	public Boolean selectAll {get; set;}

	public BulkDeleteAccountsController() {
		initializeAccountWrappers();
		this.selectAll = false;
	}

	public void initializeAccountWrappers() {
		List<Account> accounts = [SELECT Id, Name, Type FROM Account];
		accountWrappers = new List<AccountWrapper>();

		for(Account account : accounts) {
			AccountWrapper accountWrapper = new AccountWrapper(account);
			accountWrappers.add(accountWrapper);
		}
	}

	public PageReference toggleSelectAll() {
		for(AccountWrapper accountWrapper : accountWrappers) {
			accountWrapper.isChecked = selectAll;
		}
		return null;
	}


	public PageReference deleteSelectedAccounts() {
		List<Account> accountsToDelete = new List<Account>();
		for(AccountWrapper accountWrapper : accountWrappers) {
			if(accountWrapper.isChecked) {
				accountsToDelete.add(accountWrapper.account);
			}
		}

		try {

			delete accountsToDelete;


		} catch(Exception ex) {
			System.debug(ex);
			ApexPages.addMessages(ex);
		}
		initializeAccountWrappers();
		return null;
	}


	public class AccountWrapper {
		public Boolean isChecked {get; set;}
		public Account account {get; set;}
		
		public AccountWrapper(Account account) {
			this.isChecked = false;
			this.account = account;
		}
	}


}