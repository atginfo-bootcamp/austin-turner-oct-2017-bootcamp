// Employee david = new Employee(...);
public with sharing class Employee {

	private static Integer nextEmployeeIdNumber = 1;

	private final Integer EMPLOYEE_ID;
	// set these in construstor
	private String title;
	private String firstName;
	private String lastName;

	private Date hireDate;
	private String status; // Active, Terminated, Suspended
	private Datetime statusDate;


	public Employee(String title, String firstName, String lastName) {
		// IMPLEMENT THIS!
		this.hireDate = Date.today();
		this.status = 'Active';
		this.statusDate = Datetime.now();

		this.EMPLOYEE_ID = nextEmployeeIdNumber;
		nextEmployeeIdNumber ++;

		this.title = title;
		this.firstName = firstName;
		this.lastName = lastName;

	}

	public Integer getEmployeeId() {
		return EMPLOYEE_ID;
	}

	public void setStatus(String status) {
		this.status = status;
		statusDate = Datetime.now();
	}

	public String getStatus() {
		return status;
	}

	public void printEmployeeInfo() {
		System.debug('EMPLOYEE_ID ' + EMPLOYEE_ID);
		System.debug('Title ' + title);
		System.debug('FirstName ' + firstName);
		System.debug('LastName ' + lastName);
		System.debug('HireDate ' + hireDate);
		System.debug('Status ' + status);
		System.debug('StatusDate ' + statusDate);
	}

	// COME BACK TO ALL OTHER REQUIREMENTS
}