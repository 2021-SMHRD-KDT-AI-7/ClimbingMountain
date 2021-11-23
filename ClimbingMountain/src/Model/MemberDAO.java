// 정현수 2021-11-13
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
	// String to Date, Date to String 형변환
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	// DB연결 메소드
	public void getConn() {
		try {
			// 1. ojdbc.jar 파일 import하기
			// 2. 동적 로딩 방식
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 카드키
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_d_1111";
			String db_pw = "smhrd4";

			// 연결
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DB종료 메소드
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
	
	// 회원가입 메소드
	public int join(String member_id, String member_pwd, String member_name, String member_addr, int member_age, String member_gender) {
		try {
			getConn();
			// SQL문작성
			String sql = "insert into tbl_member values(?, ?, ?, ?, ?, ?)";

			// DB에 전달
			psmt = conn.prepareStatement(sql);

			// ?에 값 넣기
			psmt.setString(1, member_id);
			psmt.setString(2, member_pwd);
			psmt.setString(3, member_name);
			psmt.setString(4, member_addr);
			psmt.setInt(5, member_age);
			psmt.setString(6, member_gender);

			// 실행
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	// 로그인 메소드
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
				String member_gender = rs.getString("member_gender");
				
				dto = new MemberDTO(member_id, member_pwd, member_name, member_addr, member_age, member_gender);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return dto;
	}

	// 회원정보수정 메소드
	public int update(MemberDTO info) {
		try {
			getConn();
			
			String sql = "update tbl_member set member_pwd=?, member_name=?, member_addr=?, member_age=?, member_gender=?"
					   + "where member_id=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, info.getMember_pwd());
			psmt.setString(2, info.getMember_name());
			psmt.setString(3, info.getMember_addr());
			psmt.setInt(4, info.getMember_age());
			psmt.setString(5, info.getMember_gender());
			psmt.setString(6, info.getMember_id());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}

	// 회원정보관리 메소드
	public ArrayList<MemberDTO> select() {
		// 회원정보를 담아줄 수 있는 ArrayList 생성
		// 배열은 크기가 고정되어 있어서 크기가 유동적으로 변하는 ArrayList 사용!
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
				String member_gender = rs.getString("member_gender");
				
				// 회원정보를 dto로 묶어주기
				dto = new MemberDTO(member_id, member_pwd, member_name, member_addr, member_age, member_gender);
				list.add(dto); // 한 사람의 정보를 list에 추가해서 회원정보 모으기
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}return list;
	}
}
