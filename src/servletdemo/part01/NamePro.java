package servletdemo.part01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/namePro")
public class NamePro extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fname = req.getParameter("fname");
		// result.jsp에서 사용할 수 있도록 request 영역에 저장
		req.setAttribute("fname", fname);
		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part01/result.jsp");
		// 클라이언트에 응답해줄 페이지로 이동
		dis.forward(req, resp);

	}// end doGet()
}// end class
