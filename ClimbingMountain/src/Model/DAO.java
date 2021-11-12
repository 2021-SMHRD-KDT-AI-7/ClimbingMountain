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
			// Ű��Ű
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// DB���� �޼ҵ�
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

	// ���� ���ε� �޼ҵ�
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

	public ArrayList<DTO> getAlldate() {
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
	
	public ArrayList<DTO> getSelect_test_String(String input) {
		try {
			getConn();
			String sql = "select * from test_table where test_String = ? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);

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
