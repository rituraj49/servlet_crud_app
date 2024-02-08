package auth;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDao;
import models.EmployeeModel;
import view.ViewServlet;

/**
 * Servlet implementation class EmployeeUpdate
 */
@WebServlet("/update")
public class EmployeeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployeeUpdate() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Logger logger = ViewServlet.logger;
		EmployeeDao dao = new EmployeeDao();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("identity");
		String name = request.getParameter("employeeName");
		String designation = request.getParameter("designation");
		String department = request.getParameter("department");
		LocalDate dob = LocalDate.parse(request.getParameter("dob"));
		LocalDate doj = LocalDate.parse(request.getParameter("doj"));
		String address = request.getParameter("address");
		long contact = Long.parseLong(request.getParameter("contact"));
		String email = request.getParameter("email");
		System.out.println(id);
		logger.info("id {}"+id);
		EmployeeModel model = new EmployeeModel(id, name, designation, department, dob, doj, address, contact, email);
		dao.updateEmployee(model);
//		System.out.println(model.employeeName());
		session.setAttribute("name", model.getEmployeeName());
		response.sendRedirect("register");

	} catch (SQLException | ClassNotFoundException e) {
		e.printStackTrace();
	}

	}

}
