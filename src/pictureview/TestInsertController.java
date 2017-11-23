package pictureview;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/insertMain")
public class TestInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher("/picturePreview/insert.jsp");
		dis.forward(req, resp);
	} // end doGet();

	// cos.jar 다운받음
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MultipartRequest multi = null;
		// 테스트 시의 경로 사용
		String saveDirectory = "c:\\temp";

		// 실제로는 이렇게 사용한다.
		// String saveDirectory = req.getRealPath("/");
		// System.out.println(saveDirectory);
		// saveDirectory += "/temp";

		File file = new File(saveDirectory);
		if (!file.isDirectory()) {
			file.mkdir();
		}

		int maxPostSize = 1 * 1000 * 1000 * 1000; // 1GB 크기 지정

		// encoding 방식
		String encoding = "UTF-8";

		// DefaultFileRenamePolicy : 서버에 저장된 첨부파일 중복 제거
		multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

		// input 의 type이 file일때 getFilesystemName() 메서드를 이용한다.
		String filepath = multi.getFilesystemName("filepath");

		TestDAO dao = TestDAO.getInstance();
		dao.insertMethod(filepath);
		resp.sendRedirect("previewList");

	} // end doPost();

} // end class
