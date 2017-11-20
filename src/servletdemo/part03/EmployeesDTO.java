package servletdemo.part03;

public class EmployeesDTO {
	private int employee_id;
	private String first_name;
	private int salary;

	public EmployeesDTO() {

	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getFirst_namel() {
		return first_name;
	}

	public void setFirst_namel(String first_namel) {
		this.first_name = first_namel;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

}
