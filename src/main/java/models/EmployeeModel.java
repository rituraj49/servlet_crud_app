package models;

import java.time.LocalDate;

//public record EmployeeModel(
//		int employeeID,
//	    String employeeName,
//	    String designation,
//	    String department,
//	    LocalDate dateOfBirth,
//	    LocalDate dateOfJoining,
//	    String address,
//	    long contact,
//	    String email
//		) {
//	
//	public EmployeeModel(employeeName, designation, department, dateOfBirth, dateOfJoining, address, contact, email) {
//		
//	}
//}

public class EmployeeModel {
	
		private String employeeID;
		private String employeeName;
		private String designation;
		private String department;
		private LocalDate dateOfBirth;
		private LocalDate dateOfJoining;
		private String address;
		private long contact;
		private String email;
		
		
		public EmployeeModel() {
			super();
		}

		public EmployeeModel(String employeeID, String employeeName, String designation, String department,
				LocalDate dateOfBirth, LocalDate dateOfJoining, String address, long contact, String email) {
			super();
			this.employeeID = employeeID;
			this.employeeName = employeeName;
			this.designation = designation;
			this.department = department;
			this.dateOfBirth = dateOfBirth;
			this.dateOfJoining = dateOfJoining;
			this.address = address;
			this.contact = contact;
			this.email = email;
		}

		public EmployeeModel(String employeeName, String designation, String department, LocalDate dateOfBirth,
				LocalDate dateOfJoining, String address, long contact, String email) {
			super();
			this.employeeName = employeeName;
			this.designation = designation;
			this.department = department;
			this.dateOfBirth = dateOfBirth;
			this.dateOfJoining = dateOfJoining;
			this.address = address;
			this.contact = contact;
			this.email = email;
		}

		public String getEmployeeID() {
			return employeeID;
		}

		public String getEmployeeName() {
			return employeeName;
		}

		public String getDesignation() {
			return designation;
		}

		public String getDepartment() {
			return department;
		}

		public LocalDate getDateOfBirth() {
			return dateOfBirth;
		}

		public LocalDate getDateOfJoining() {
			return dateOfJoining;
		}

		public String getAddress() {
			return address;
		}

		public long getContact() {
			return contact;
		}

		public String getEmail() {
			return email;
		}

		public void setEmployeeID(String employeeID) {
			this.employeeID = employeeID;
		}

		public void setEmployeeName(String employeeName) {
			this.employeeName = employeeName;
		}

		public void setDesignation(String designation) {
			this.designation = designation;
		}

		public void setDepartment(String department) {
			this.department = department;
		}

		public void setDateOfBirth(LocalDate dateOfBirth) {
			this.dateOfBirth = dateOfBirth;
		}

		public void setDateOfJoining(LocalDate dateOfJoining) {
			this.dateOfJoining = dateOfJoining;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public void setContact(long contact) {
			this.contact = contact;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		
			
}
