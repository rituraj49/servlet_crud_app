package auth;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDao;
import dao.ViewDao;
import models.EmployeeModel;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class EmployeeRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeRegister() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			EmployeeDao dao = new EmployeeDao();
			ViewDao vdao = new ViewDao();
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
			EmployeeModel emd = vdao.getSingleEmployee(id);
			if (emd != null) {
				session.setAttribute("exists", "user with id: " + id + " already exists");
				response.sendRedirect("register.jsp");
			}
			EmployeeModel model = new EmployeeModel(id, name, designation, department, dob, doj, address, contact,
					email);
			dao.registerEmp(model);
//			System.out.println(model.employeeName());
			session.setAttribute("name", model.getEmployeeName());

//			ViewDao vdao = new ViewDao();
//			List<EmployeeModel> model = new ArrayList<>();
//			HttpSession session = request.getSession();
			List<EmployeeModel> models = vdao.getEmployees();
//			String identity = request.getParameter("identity");
			session.setAttribute("list", models);
//			System.out.println(models+" inReg");

			response.sendRedirect("view.jsp");
//			response.sendRedirect("register.jsp");

//			response.sendRedirect("view");

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();

//			System.out.println(model.employeeName());

			ViewDao vdao = new ViewDao();
			List<EmployeeModel> models = vdao.getEmployees();
//			String identity = request.getParameter("identity");
			System.out.println(models + " inReg");
			session.setAttribute("list", models);
			for (EmployeeModel mod : models) {
				System.out.println(mod.getEmployeeName() + " single model");
			}
			response.sendRedirect("view.jsp");
//			response.sendRedirect("register.jsp");

//			response.sendRedirect("view");

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
