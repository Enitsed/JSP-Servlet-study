package boarddemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarddemo.dao.BoardDAO;

public class ViewAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int num = Integer.parseInt(req.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();
		req.setAttribute("dto", dao.viewMethod(num));
	} // end execute();

} // end class
