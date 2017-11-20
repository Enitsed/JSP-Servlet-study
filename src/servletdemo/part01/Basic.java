package servletdemo.part01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 환경설정 하는 방법
 * 1. xml
 * 2. annotation(@)
 * 3. properties
 */
@WebServlet("/basic")
public class Basic extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답해줄 정보를 저장
		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part01/nameView.jsp");
		// 클라이언트에 응답
		dis.forward(req, resp);

	} // end doGet();

} // end class;
