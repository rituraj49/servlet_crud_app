package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Properties;

import models.EmployeeModel;

public class EmployeeDao {
	Connection con = null;
	PreparedStatement pst = null;
	PreparedStatement cst = null;
	String createQuery = "CREATE TABLE IF NOT EXISTS employeeDetails ( employeeID VARCHAR(255) NOT NULL, employeeName VARCHAR(255) NOT NULL, designation VARCHAR(255) NOT NULL, department VARCHAR(255) NOT NULL, dateOfBirth DATE, dateOfJoining DATE, address TEXT, contact BIGINT, email VARCHAR(255), PRIMARY KEY (employeeID))";
	String query = "INSERT INTO employeeDetails "
			+ "(employeeID, employeeName, designation, department, dateOfBirth, dateOfJoining, address, contact, email)"
			+ "VALUES(?,?,?,?,?,?,?,?,?)";

	String updateQuery = "UPDATE employeeDetails SET employeeName=?, designation=?, department=?, dateOfBirth=?, dateOfJoining=?,"
			+ "address=?, contact=?, email=? WHERE employeeID=?";

	String deleteQuery = "DELETE FROM employeeDetails WHERE employeeID=?;";
	Properties props = new Properties();

	public void registerEmp(EmployeeModel model) throws ClassNotFoundException, SQLException {
		try {
			InputStream fis = getClass().getClassLoader().getResourceAsStream("db.properties");
			if (fis == null) {
				System.out.println("no file found");
				return;
			} else {
				props.load(fis);
				String renderdbUrl = props.getProperty("db.url");
				String renderdbPass = props.getProperty("db.password");
				String renderdbUsername = props.getProperty("db.username");
				System.out.println(renderdbUsername);
//				try {
				// Class.forName("com.mysql.cj.jdbc.Driver");
				// con = DriverManager.getConnection(url, uname, password);
				Class.forName(props.getProperty("db.class"));

				con = DriverManager.getConnection(renderdbUrl, renderdbUsername, renderdbPass);
				cst = con.prepareStatement(createQuery);
				pst = con.prepareStatement(query);
				cst.execute();

				pst.setString(1, model.getEmployeeID());
				pst.setString(2, model.getEmployeeName());
				pst.setString(3, model.getDesignation());
				pst.setString(4, model.getDepartment());
				pst.setDate(5, Date.valueOf(model.getDateOfBirth()));
				pst.setDate(6, Date.valueOf(model.getDateOfJoining()));
				pst.setString(7, model.getAddress());
				pst.setLong(8, model.getContact());
				pst.setString(9, model.getEmail());
				int rows = pst.executeUpdate();
				if (rows > 0) {
					System.out.println(rows + " data inserted");
				} else {
					System.out.println("data not uploaded");
				}

//				} catch (Exception e) {
//					e.printStackTrace();
//				}

			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pst.close();
			con.close();
		}
	}

	public void updateEmployee(EmployeeModel model) throws ClassNotFoundException, SQLException {
		try {
			// Properties props = new Properties();
			InputStream fis = getClass().getClassLoader().getResourceAsStream("db.properties");
			if (fis == null) {
				System.out.println("no file found");
				return;
			} else {
				props.load(fis);
				String renderdbUrl = props.getProperty("db.url");
				String renderdbPass = props.getProperty("db.password");
				String renderdbUsername = props.getProperty("db.username");
				Class.forName(props.getProperty("db.class"));
				try {

					// Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection(renderdbUrl, renderdbUsername, renderdbPass);

					pst = con.prepareStatement(updateQuery);
					pst.setString(1, model.getEmployeeName());
					pst.setString(2, model.getDesignation());
					pst.setString(3, model.getDepartment());
					pst.setDate(4, Date.valueOf(model.getDateOfBirth()));
					pst.setDate(5, Date.valueOf(model.getDateOfJoining()));
					pst.setString(6, model.getAddress());
					pst.setLong(7, model.getContact());
					pst.setString(8, model.getEmail());
					pst.setString(9, model.getEmployeeID());
					// System.out.println("update: "+model.getEmployeeID()+" id in updateEmployee");
					int row = pst.executeUpdate();

					System.out.println(row + " rows affected");
					if (row > 0) {
						System.out.println(row + " data updated");
					} else {
						System.out.println("not updated");
						// throw new SQLException();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					System.err.println(e.getMessage());
				} finally {

					con.close();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pst.close();
			con.close();
		}

	}

	public void deleteEmployee(String id) throws ClassNotFoundException, SQLException {
		try {
			// Properties props = new Properties();
			InputStream fis = getClass().getClassLoader().getResourceAsStream("db.properties");
			if (fis == null) {
				System.out.println("no file found");
				return;
			} else {
				props.load(fis);
				String renderdbUrl = props.getProperty("db.url");
				String renderdbPass = props.getProperty("db.password");
				String renderdbUsername = props.getProperty("db.username");
				Class.forName(props.getProperty("db.class"));

				con = DriverManager.getConnection(renderdbUrl, renderdbUsername, renderdbPass);
				pst = con.prepareStatement(deleteQuery);
				pst.setString(1, id);
				int row = pst.executeUpdate();
				String result = row > 1 ? row + "s affected." : "affected";
				System.out.println(result);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pst.close();
			con.close();
		}
	}
}
