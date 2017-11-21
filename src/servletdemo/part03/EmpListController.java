package servletdemo.part03;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/empList")
public class EmpListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeesDAO dao = EmployeesDAO.getInstance();
		ArrayList<EmployeesDTO> aList = dao.search();
		req.setAttribute("aList", aList);
		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part03/empList.jsp");
		dis.forward(req, resp);
	}// end doGet()
}// end class
