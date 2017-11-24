package sessiondemo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher("/sessionview/login.jsp");
		dis.forward(req, resp);

	} // end doGet()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fid = req.getParameter("fid");
		String fpass = req.getParameter("fpass");
		MemDTO dto = new MemDTO();
		dto.setFid(fid);
		dto.setFpass(fpass);

		MemDAO dao = MemDAO.getInstance();
		int cnt = dao.memCheck(dto);

		// client와 server의 연결을 지속시킬 목적으로...
		// request 객체를 통해 session 값을 받아 올 수 있다.
		HttpSession session = req.getSession();
		// 세션에 클라이언트 정보를 저장한다.

		if (cnt == 1) { // 회원이면
			session.setAttribute("logOk", fid);
			session.setMaxInactiveInterval(30 * 60); // 30분
			session.setAttribute("chk", 1);
			resp.sendRedirect("login");
		} else { // 회원이 아니면
			session.setAttribute("chk", 2);
			resp.sendRedirect("login");
		}

	} // end doPost()

} // end class