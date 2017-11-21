package servletdemo.part05;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/game")
public class GameController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part05/input.jsp");
		dis.forward(req, resp);
	} // end doGet()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String person = req.getParameter("gg");

		Random ran = new Random();
		int computer = ran.nextInt(3) + 1;
		String type = "";

		// computer 1 가위 2 바위 3 보
		if (computer == 1) {
			if (person.equals("가위"))
				type = "컴: 가위, 유저: 가위 무승부";
			else if (person.equals("바위"))
				type = "컴: 가위, 유저: 바위 유저 승";
			else if (person.equals("보"))
				type = "컴: 가위, 유저: 보 컴 승";
		} else if (computer == 2) {
			if (person.equals("가위"))
				type = "컴: 바위, 유저: 가위 컴 승";
			else if (person.equals("바위"))
				type = "컴: 바위, 유저: 바위 무승부";
			else if (person.equals("보"))
				type = "컴: 바위, 유저: 보 유저 승";
		} else if (computer == 3) {
			if (person.equals("가위"))
				type = "컴: 보, 유저: 가위 유저 승";
			else if (person.equals("바위"))
				type = "컴: 보, 유저: 바위 컴 승";
			else if (person.equals("보"))
				type = "컴: 보, 유저: 보 무승부";
		}

		// RequestDispatcher dis =
		// req.getRequestDispatcher("/servletview/part05/gameResult.jsp");
		// req.setAttribute("res", type);

		RequestDispatcher dis = req.getRequestDispatcher("/servletview/part05/gameResult.jsp?res=" + type);
		dis.forward(req, resp);
	}

}// end class
