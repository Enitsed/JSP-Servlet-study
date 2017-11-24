package pictureview;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testDel")
public class TestDeleteController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TestDAO dao = TestDAO.getInstance();
		String[] chk = req.getParameterValues("chk");
		List<String> filePaths = dao.fileList(chk);

		for (String filedata : filePaths) {
			// 파일 경로
			System.out.println(filedata);

			// 파일삭제
			File file = new File("c:/temp/" + filedata);
			file.delete();
		}

		dao.deleteMethod(chk);

		resp.sendRedirect("previewList");
	} // end doPost();

} // end class