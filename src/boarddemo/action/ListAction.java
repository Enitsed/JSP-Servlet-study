package boarddemo.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarddemo.dao.BoardDAO;
import boarddemo.dto.PageDTO;

public class ListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String searchKey = req.getParameter("searchKey");
		String searchWord = req.getParameter("searchWord");
		String pageNum = req.getParameter("pageNum");

		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchKey", searchKey);
		map.put("searchWord", searchWord);

		int currentPage = Integer.parseInt(pageNum);
		BoardDAO dao = BoardDAO.getInstance();
		int cnt = dao.rowTotalCount(map);
		if (cnt > 0) {
			if (searchKey != null && searchWord != null) {
				PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord);
				req.setAttribute("pdto", pdto);
				System.out.println(pdto.getSearchKey() + pdto.getSearchWord());
				req.setAttribute("aList", dao.listMethod(pdto));
			} else {
				PageDTO pdto = new PageDTO(currentPage, cnt);
				req.setAttribute("pdto", pdto);
				req.setAttribute("aList", dao.listMethod(pdto));
			}
		}

	} // end execute();

} // end class
