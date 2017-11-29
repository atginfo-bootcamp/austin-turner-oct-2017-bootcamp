public with sharing class Business {
	
	private static String businessName = 'atg';
	private String locationName;
	private String address;
	private String phoneNumber;
	private List<Employee> employees;


	public Business() {
		// require all fields are passed in
		// set all field values - except employees

		this.employees = new List<Employee>();

	}

	public void addEmployee(Employee employee) {
		// Call other addemployee() method to keep business logic centralize
		addEmployee(new List<Employee>{employee});

		// These are 100% identical
		//List<Employee> employees = new List<Employee>();
		//employees.add(employee);
		//addEmployee(employees);

		//List<Employee> employees = new List<Employee>{employee};
		//addEmployee(employees);
	}

	public void addEmployee(List<Employee> employees) {
		// pretend we have a lot of other business logic here!
		this.employees.addAll(employees);
	}

	public void removeEmployee(Integer employeeId) {
		// work on this last
	}

	public List<Employee> getEmployees() {
		return null;
	}

	public Employee getEmployeeById(Integer employeeId) {
		return null;
	}

	public void printLocationInfo() {
		// print out all the location information
	}

	/// WORK ON VERY LAST IF FINISHED WITH ALL OTHER WORK
	/// return TRUE if success, false if employee not found
	public static Boolean transferEmployee(Business fromLocation, Business toLocation, Integer employeeId) {
		// HINT: use the getEmployeeById() to find employee on fromLocation
		// remove employee from fromLocation
		// add emplyoee totoLocation
		return false;
	}

}