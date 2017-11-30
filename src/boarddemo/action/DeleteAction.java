package boarddemo.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarddemo.dao.BoardDAO;

public class DeleteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// String saveDirectory = req.getRealPath("/");
		// saveDirectory +="/temp/";
		int num = Integer.parseInt(req.getParameter("num"));
		String saveDirectory = "c:/temp";
		BoardDAO dao = BoardDAO.getInstance();
		String filepath = dao.fileMethod(num);

		if (filepath != null) {
			File file = new File(saveDirectory, filepath);
			file.delete();
		}

		dao.deleteMethod(num);

	} // end execute()
} // end class
