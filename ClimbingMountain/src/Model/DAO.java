package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	ArrayList<DTO> test_board = new ArrayList<>();

	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 키드키
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// DB종료 메소드
	public void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 파일 업로드 메소드
	public int upload(DTO tt) {
		try {
			getConn();
			String sql = "insert into test_table(test_String,test2_num) values (?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tt.getTest_String());
			psmt.setInt(2, tt.getTest2_num());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<DTO> getDate() {
		try {
			getConn();
			String sql = "select * from test_table";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			while (rs.next()) {
				test_board.add(  new DTO(rs.getString("test_String"), rs.getInt("test2_num"))    );
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		dbClose();
		return test_board;
	}

}
