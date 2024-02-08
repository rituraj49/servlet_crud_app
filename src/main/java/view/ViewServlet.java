package view;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ViewDao;
import models.EmployeeModel;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/view")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Logger logger = Logger.getLogger(ViewServlet.class.getName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			ViewDao dao = new ViewDao();
//			List<EmployeeModel> model = new ArrayList<>();
			HttpSession session = request.getSession();
//			List<EmployeeModel> model = dao.getEmployees();
			String identity = request.getParameter("identity");
			EmployeeModel mod = dao.getSingleEmployee(identity);
//			session.setAttribute( "list", model);
			session.setAttribute( "employee", mod);
			
			System.out.println(mod+" inView");
			logger.info(mod+" model");

//			response.sendRedirect("view.jsp");
			response.sendRedirect("register.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
//	============= testing post method ======================

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Logger logger = Logger.getLogger(ViewServlet.class.getName());
			ViewDao dao = new ViewDao();
//			List<EmployeeModel> model = new ArrayList<>();
			HttpSession session = request.getSession();
			String identity = request.getParameter("identity");
			EmployeeModel m = dao.getSingleEmployee(identity);
			System.out.println(m.getDesignation());
			System.out.println(m.getEmployeeName());
			session.setAttribute("employee", m);
//			System.out.println(mod+" inView");
//			logger.info(mod+" model");
			
//			response.sendRedirect("view.jsp");
			response.sendRedirect("register.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
