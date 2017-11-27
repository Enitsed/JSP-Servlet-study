package boarddemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarddemo.dao.BoardDAO;

public class ListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		BoardDAO dao = BoardDAO.getInstance();
		req.setAttribute("aList", dao.listMethod());
	} // end execute();

} // end class
