package boarddemo.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import boarddemo.dao.BoardDAO;
import boarddemo.dto.BoardDTO;

public class WriteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 첨부 파일이 있을경우 MultipartRequest 객체를 통해 파라미터를 받는다.
		MultipartRequest multi = null;
		String saveDirectory = "c:/temp";
		File file = new File(saveDirectory);
		if (!file.exists())
			file.mkdir();
		int maxPostSize = 1000000000; // 1GB
		String encoding = "UTF-8";

		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}

		BoardDTO dto = new BoardDTO();
		dto.setWriter(multi.getParameter("writer"));
		dto.setEmail(multi.getParameter("email"));
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setUpload(multi.getFilesystemName("upload"));

		BoardDAO dao = BoardDAO.getInstance();

		// 답변 글이면
		if (multi.getParameter("re_level") != null) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("ref", Integer.parseInt(multi.getParameter("ref")));
			map.put("re_step", Integer.parseInt(multi.getParameter("re_step")));

			dao.reStepMethod(map);

			dto.setRef(Integer.parseInt(multi.getParameter("ref")));
			dto.setRe_step(Integer.parseInt(multi.getParameter("re_step")) + 1);
			dto.setRe_level(Integer.parseInt(multi.getParameter("re_level")) + 1);

		}

		dao.insertMethod(dto);

	} // end execute();

} // end class
