package multicheckdemo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private MemberDAO() {

	}

	private static MemberDAO dao = new MemberDAO();

	public static MemberDAO getInstance() {
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
	} // end exit();

	public ArrayList<MemberDTO> search() {
		ArrayList<MemberDTO> aList = new ArrayList<MemberDTO>();

		try {
			conn = init();
			stmt = conn.createStatement();
			String sql = "select * from mem order by num";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setLoc(rs.getString("loc"));
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

	} // end search();

	public void deleteMethod(String[] chk) {

		try {
			conn = init();
			String sql = "delete from mem where num=?";
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < chk.length; i++) {
				pstmt.setInt(1, Integer.parseInt(chk[i])); // 30
				rs = pstmt.executeQuery();
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

	} // end delete()
} // end class
