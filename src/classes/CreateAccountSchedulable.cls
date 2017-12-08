global class CreateAccountSchedulable implements Schedulable {
	global void execute(SchedulableContext sc) {
		//MyBatchClass b = new MyBatchClass();
		//database.executebatch(b);
		
		System.debug('Schedulable job started - creating account');

		Account account = new Account(Name = DateTime.now().format());
		insert account;
		
		System.debug('Created account');
	}
}