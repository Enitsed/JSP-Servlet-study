package pictureview;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/previewList")
public class TestListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TestDAO dao = TestDAO.getInstance();
		ArrayList<TestDTO> aList = dao.selectMethod();
		req.setAttribute("aList", aList);
		RequestDispatcher dis = req.getRequestDispatcher("/picturePreview/list.jsp");
		dis.forward(req, resp);

	} // end doGet();

} // end class
