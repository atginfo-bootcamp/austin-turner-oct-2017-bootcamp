public with sharing class AccountAndOppCreatorController_ANDERS {

	public Account account {get; set;}
	public Contact contact {get; set;}
	public Opportunity opportunity {get; set;}

	public Account savedAccount {get; set;}
	public Contact savedContact {get; set;}
	public Opportunity savedOpportunity {get; set;}

	public Boolean showCreatedDataSection {get; set;}

	public AccountAndOppCreatorController_ANDERS() {
		account = new Account();
		contact = new Contact();
		opportunity = new Opportunity();

		//Initialize the Data Creation Section to being hidden
		showCreatedDataSection = false;

		//Initialize default values
		initDefaults();
	}

	public PageReference saveData(){

		Boolean error = false;
		if(account.name == null){
			createErrorMessage('Account Name');
			error = true;
		}
		if(account.AccountNumber == null){
			createErrorMessage('Account Number');
			error = true;
		}
		if(account.Type == null){
			createErrorMessage('Account Type');
			error = true;
		}
		if(contact.FirstName == null){
			createErrorMessage('Contact First Name');
			error = true;
		}
		if(contact.LastName == null){
			createErrorMessage('Contact Last Name');
			error = true;
		}
		if(opportunity.Type == null){
			createErrorMessage('Opportunity Type');
			error = true;
		}
		if(opportunity.StageName == null){
			createErrorMessage('Opportunity Stage Name');
			error = true;
		}
		if(opportunity.CloseDate == null){
			createErrorMessage('Opportunity Close Date');
			error = true;
		}

		//Populate the opportunity name with the Account name
		opportunity.name = account.name;

		//Only proceed if none of the required fields were left null
		if(!error){
			postSaveWork();
		}


		return null;
	}

	private void initDefaults(){
		opportunity.StageName = 'Needs Analysis';
		opportunity.CloseDate = System.today().addDays(30);
	}

	private void createErrorMessage(String field){
		ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.WARNING, field + ' Must Be Populated'));
	}

	private void postSaveWork(){
		try{
			//Post success message
			ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'Data Saved Succesfully'));

			//Insert the new Account, Contact, and Opportunity
			insert account;

			//Link the contact and oppty to the account by populating the AccountID lookup
			contact.AccountID = account.Id;
			opportunity.AccountId = account.Id;

			insert contact;
			insert opportunity;

			//Populate saved data objects.  These will be used to show the saved info at the bottom of the page
			savedAccount = account;
			savedContact = contact;
			savedOpportunity = opportunity;

			//Display hidden section
			showCreatedDataSection = true;


			//Reinitialize objects and re-set default fields
			account = new Account();
			contact = new Contact();
			opportunity = new Opportunity();
			initDefaults();

		}catch(Exception e){
			ApexPages.addMessages(e);
		}

	}


}