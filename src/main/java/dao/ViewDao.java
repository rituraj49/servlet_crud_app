package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mysql.cj.protocol.Resultset;

import models.EmployeeModel;

public class ViewDao {
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String query = "select * from employeeDetails";
	String fetchOne = "select * from employeeDetails where employeeID=?;";
	Properties prop = new Properties();

	public List<EmployeeModel> getEmployees() throws ClassNotFoundException, SQLException {
		List<EmployeeModel> empList = new ArrayList<>();
		try {
			InputStream fis = getClass().getClassLoader().getResourceAsStream("db.properties");
			if (fis == null) {
				System.out.println("config file not found");
//				return ;
			} else {
				prop.load(fis);
				String renderdbUrl = prop.getProperty("db.url");
				String renderdbPass = prop.getProperty("db.password");
				String renderdbUsername = prop.getProperty("db.username");
				Class.forName(prop.getProperty("db.class"));
//		Class.forName("com.mysql.cj.jdbc.Driver");
//				try {

//				con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", pass);
				con = DriverManager.getConnection(renderdbUrl, renderdbUsername, renderdbPass);
				pst = con.prepareStatement(query);
				rs = pst.executeQuery();
				while (rs.next()) {
					String id = rs.getString("employeeID");
					String name = rs.getString("employeeName");
					String designation = rs.getString("designation");
					String department = rs.getString("department");
					LocalDate dob = rs.getDate("dateOfBirth").toLocalDate();
					LocalDate doj = rs.getDate("dateOfJoining").toLocalDate();
					String address = rs.getString("address");
					long contact = rs.getLong("contact");
					String email = rs.getString("email");
					System.out.println("viewdao: " + name);

					EmployeeModel model = new EmployeeModel(id, name, designation, department, dob, doj, address,
							contact, email);
					empList.add(model);
					for (var a : empList) {
//			System.out.println(a.designation());
//			System.out.println(a.department());
						System.out.println(a.getEmployeeID());
						System.out.println(a.getDesignation());
						System.out.println(a.getDepartment());
					}
//						return empList;
				}
//		System.out.println(empList);
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pst.close();
			con.close();
		}
		return empList;
	}

	public EmployeeModel getSingleEmployee(String identity) throws ClassNotFoundException, SQLException {
		EmployeeModel model = new EmployeeModel();
		try {
			// Properties prop = new Properties();
			InputStream fis = getClass().getClassLoader().getResourceAsStream("db.properties");
			if (fis == null) {
				System.out.println("config file not found");
//			return ;
			} else {
				prop.load(fis);
				String renderdbUrl = prop.getProperty("db.url");
				String renderdbPass = prop.getProperty("db.password");
				String renderdbUsername = prop.getProperty("db.username");
				Class.forName(prop.getProperty("db.class"));
//	Class.forName("com.mysql.cj.jdbc.Driver");
//		Class.forName("com.mysql.cj.jdbc.Driver")
//				try (Connection con = DriverManager.getConnection(renderdbUrl, renderdbUsername, renderdbPass)) {

//					 con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb",
//					 "postgres", pass);
				con = DriverManager.getConnection(renderdbUrl, renderdbUsername, renderdbPass);
				pst = con.prepareStatement(fetchOne);
				pst.setString(1, identity);
				rs = pst.executeQuery();
				while (rs.next()) {
					String id = rs.getString("employeeID");
					String name = rs.getString("employeeName");
					String designation = rs.getString("designation");
					String department = rs.getString("department");
					LocalDate dob = rs.getDate("dateOfBirth").toLocalDate();
					LocalDate doj = rs.getDate("dateOfJoining").toLocalDate();
					String address = rs.getString("address");
					long contact = rs.getLong("contact");
					String email = rs.getString("email");

					model = new EmployeeModel(id, name, designation, department, dob, doj, address, contact, email);
					// System.out.println(model.getEmployeeID());
					// System.out.println(model.getEmployeeName());
					// System.out.println(model.getDesignation());
					return model;
				}

//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//		System.out.println(model.getDesignation());
//				return model;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pst.close();
			con.close();
		}
		return model;
	}
}
