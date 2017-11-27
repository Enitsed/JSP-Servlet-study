package cookiedemo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/makeCookie")
public class MakeCookie extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 쿠키 생성(서버에서 생성 -> 클라이언트에 저장)
		Cookie cookie = new Cookie("cookieName", "cookieValue");
		// '/' 아래의 경로 페이지를 호출 할 때 cookie 값이 전달 됨
		cookie.setPath("/");
		// 쿠키 유효시간 -> 1시간
		cookie.setMaxAge(60 * 60);
		// 쿠키를 클라이언트에 응답
		resp.addCookie(cookie);

		RequestDispatcher dis = req.getRequestDispatcher("/cookieview/makecookie.jsp");
		dis.forward(req, resp);

	} // end doGet();

} // end class