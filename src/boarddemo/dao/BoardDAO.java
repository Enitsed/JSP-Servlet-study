package boarddemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import boarddemo.dto.BoardDTO;
import boarddemo.dto.PageDTO;

public class BoardDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private BoardDAO() {

	}

	private static BoardDAO dao = new BoardDAO();

	public static BoardDAO getInstance() {
		return dao;
	}

	private Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String user = "hr";
		String password = "a1234";
		return DriverManager.getConnection(url, user, password);
	} // end init();

	private void exit() throws SQLException {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (pstmt != null)
			pstmt.close();
		if (rs != null)
			rs.close();
		if (conn != null)
			conn.close();
	} // end exit();

	public int rowTotalCount(HashMap<String, String> map) {
		int cnt = 0;
		try {
			conn = init();
			String sql = "select count(*) from board";
			// where subject like '%ca%';
			if (map.get("searchKey") != null && !(map.get("searchKey").equals("all"))) {
				if (map.get("searchKey").equals("subject") || map.get("searchKey").equals("writer")
						|| map.get("searchKey").equals("content")) {
					sql += " where lower(" + map.get("searchKey") + ") like ?";

				}
			}
			pstmt = conn.prepareStatement(sql);

			if (map.get("searchKey") != null && !(map.get("searchKey").equals("all"))) {
				if (map.get("searchKey").equals("subject") || map.get("searchKey").equals("writer")
						|| map.get("searchKey").equals("content")) {
					pstmt.setString(1, "%" + map.get("searchWord").toLowerCase() + "%");
				}
			}
			rs = pstmt.executeQuery();
			if (rs.next())
				cnt = rs.getInt(1);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cnt;
	} // end rowTotalCount()

	public List<BoardDTO> listMethod(PageDTO pdto) {
		List<BoardDTO> aList = new ArrayList<BoardDTO>();
		try {
			conn = init();
			String sql = "select b.* from (select rownum as rm, a.* from (select * from board ";
			if (pdto.getSearchKey() != null && !(pdto.getSearchKey().equals("all"))) {
				if (pdto.getSearchKey().equals("subject") || pdto.getSearchKey().equals("writer")
						|| pdto.getSearchKey().equals("content")) {
					sql += "where lower(" + pdto.getSearchKey() + ") like lower('%" + pdto.getSearchWord() + "%') ";
				}
			}
			sql += "order by ref desc,re_step asc)a)b where b.rm>=? and b.rm<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow());
			pstmt.setInt(2, pdto.getEndRow());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcount(rs.getShort("readcount"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setUpload(rs.getString("upload"));

				aList.add(dto);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return aList;
	} // end listMethod()

	public void readCountMethod(int num) {
		try {
			conn = init();
			String sql = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // end readCountMethod();

	public BoardDTO viewMethod(int num) {
		BoardDTO dto = null;
		try {
			conn = init();
			String sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));
				dto.setEmail(rs.getString("email"));
				dto.setContent(rs.getString("content"));
				dto.setUpload(rs.getString("upload"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	} // viewMethod()

	public void insertMethod(BoardDTO dto) {
		try {
			conn = init();
			if (dto.getRe_level() == 0) {
				// 제목 글이면..
				String sql = "insert into board(num,reg_date,writer,email,subject,content,upload,ref,re_step,re_level)"
						+ " values(board_seq.nextval,sysdate,?,?,?,?,?,board_seq.nextval,0,0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getUpload());
			} else {
				// 답변 글이면
				String sql = "insert into board(num,reg_date,writer,email,subject,content,upload,ref,re_step,re_level)"
						+ " values(board_seq.nextval,sysdate,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getUpload());
				pstmt.setInt(6, dto.getRef());
				pstmt.setInt(7, dto.getRe_step());
				pstmt.setInt(8, dto.getRe_level());
			}

			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // end insertMethod()

	public void updateMethod(BoardDTO dto) {
		try {
			conn = init();
			String sql = "update board set email=?,subject=?,content=?,upload=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getUpload());
			pstmt.setInt(5, dto.getNum());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // end updateMethod()

	public void deleteMethod(int num) {
		try {
			conn = init();
			String sql = "delete from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // deleteMethod()

	public void reStepMethod(HashMap<String, Integer> map) {
		try {
			conn = init();
			String sql = "update board set re_step = re_step+1 where ref=? and re_step>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, map.get("ref"));
			pstmt.setInt(2, map.get("re_step"));

			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	} // end reStepMethod()

	public String fileMethod(int num) {
		String filename = null;
		try {
			conn = init();
			String sql = "select upload from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next())
				filename = rs.getString("upload");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return filename;
	} // end fileMethod()

} // end class
