package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
public class MemberDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	MemberDTO dto = null;
	int cnt = 0;
	// String to Date, Date to String ����ȯ
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	// DB���� �޼ҵ�
	public void getConn() {
		try {
			// 1. ojdbc.jar ���� import�ϱ�
			// 2. ���� �ε� ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// ī��Ű
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_d_1111";
			String db_pw = "smhrd4";

			// ����
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DB���� �޼ҵ�
	public void dbClose() {
		try {
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ȸ������ �޼ҵ�
	public int join(String member_id, String member_pwd, String member_name, String member_addr, int member_age, String member_health, String member_gender, int member_career, Date member_joindate, String admin_yn) {
		try {
			getConn();
			// SQL���ۼ�
			String sql = "insert into tbl_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			// DB�� ����
			psmt = conn.prepareStatement(sql);

			// ?�� �� �ֱ�
			psmt.setString(1, member_id);
			psmt.setString(2, member_pwd);
			psmt.setString(3, member_name);
			psmt.setString(4, member_addr);
			psmt.setInt(5, member_age);
			psmt.setString(6, member_health);
			psmt.setString(7, member_gender);
			psmt.setInt(8, member_career);
			psmt.setString(9, transFormat.format(member_joindate)); // Date to Sting ����ȯ
			psmt.setString(10, admin_yn);

			// ����
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	// �α��� �޼ҵ�
	public MemberDTO login(String input_member_id, String input_member_pwd) {
		try {
			getConn();
			String sql = "select * from tbl_member where member_id=? and member_pwd=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, input_member_id);
			psmt.setString(2, input_member_pwd);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String member_id = rs.getString("member_id");
				String member_pwd = rs.getString("member_pwd");
				String member_name = rs.getString("member_name");
				String member_addr = rs.getString("member_addr");
				int member_age = rs.getInt("member_age");
				String member_health = rs.getString("member_health");
				String member_gender = rs.getString("member_gender");
				int member_career = rs.getInt("member_career");
				Date member_joindate = transFormat.parse(rs.getString("member_joindate"));	// Sting to Date ����ȯ
				String admin_yn = rs.getString("admin_yn");
				
				dto = new MemberDTO(member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return dto;
	}

	// ȸ���������� �޼ҵ�
	public int update(MemberDTO info) {
		try {
			getConn();
			
			String sql = "update tbl_member set member_pwd=?, member_name=?, member_addr=?, member_age=?, member_health=?, member_gender=?, member_career=?, member_joindate=?,"
					   + "where member_id=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(10, info.getMember_id());
			psmt.setString(1, info.getMember_pwd());
			psmt.setString(2, info.getMember_name());
			psmt.setString(3, info.getMember_addr());
			psmt.setInt(4, info.getMember_age());
			psmt.setString(5, info.getMember_health());
			psmt.setString(6, info.getMember_gender());
			psmt.setInt(7, info.getMember_career());
			psmt.setString(8, transFormat.format(info.getMember_joindate()));	// Date to Sting ����ȯ
			psmt.setString(9, info.getAdmin_yn());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}

	// ȸ���������� �޼ҵ�
	public ArrayList<MemberDTO> select() {
		// ȸ�������� ����� �� �ִ� ArrayList ����
		// �迭�� ũ�Ⱑ �����Ǿ� �־ ũ�Ⱑ ���������� ���ϴ� ArrayList ���!
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		try {
			getConn();
			
			String sql = "select * from tbl_member";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String member_id = rs.getString("member_id");
				String member_pwd = rs.getString("member_pwd");
				String member_name = rs.getString("member_name");
				String member_addr = rs.getString("member_addr");
				int member_age = rs.getInt("member_age");
				String member_health = rs.getString("member_health");
				String member_gender = rs.getString("member_gender");
				int member_career = rs.getInt("member_career");
				Date member_joindate = transFormat.parse(rs.getString("member_joindate"));	// Sting to Date ����ȯ
				String admin_yn = rs.getString("admin_yn");
				
				// ȸ�������� dto�� �����ֱ�
				dto = new MemberDTO(member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn);
				list.add(dto); // �� ����� ������ list�� �߰��ؼ� ȸ������ ������
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}return list;
	}
}
