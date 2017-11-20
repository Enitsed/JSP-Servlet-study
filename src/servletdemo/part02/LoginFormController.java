package servletdemo.part02;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginForm")
public class LoginFormController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답해줄 정보를 저장
		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part02/form.jsp");
		// 클라이언트에 응답
		dis.forward(req, resp);
	}
}
