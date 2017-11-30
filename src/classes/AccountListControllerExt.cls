public with sharing class AccountListControllerExt {

	private final Account account;
    public final List<Product2> products {get; set;}

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public AccountListControllerExt(ApexPages.StandardController stdController) {
        this.account = (Account) stdController.getRecord();
        products = [SELECT Id, Name, ProductCode, Family FROM Product2];
    }




}