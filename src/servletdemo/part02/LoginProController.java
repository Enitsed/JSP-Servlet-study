package servletdemo.part02;

/*
 * String fid
 * String fpass
 * System.out.println(fid+" "+fpass);
 */
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginPro")
public class LoginProController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fid = (String) req.getParameter("fid");
		String fpass = (String) req.getParameter("fpass");
		MemberDTO dto = new MemberDTO();
		dto.setFid(fid);
		dto.setFpass(fpass);
		req.setAttribute("dto", dto);
		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part02/res.jsp");
		dis.forward(req, resp);
	}
} // end class
