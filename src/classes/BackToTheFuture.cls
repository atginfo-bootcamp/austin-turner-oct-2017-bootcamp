public with sharing class BackToTheFuture {


	public static void execute() {

		System.debug('We are going back to the future');

		goDoSomeWorkInTheFuture();

		System.debug('We are back from the future....');

	}

	@Future
	public static void goDoSomeWorkInTheFuture() {
		System.debug('We are in the future!!!!');
		reallyInTheFuture();
	}

	@Future
	public static void reallyInTheFuture() {
		System.debug('We are in the future!!!!');
	}


}