package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Course_3_img_DAO {
	ArrayList<Course_3_img_DTO> dto_list = new ArrayList<>();
	Course_3_img_DTO dto = null;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;

	// DB연결 메소드
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 키드키
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_c_d_1111";
			String db_pw = "smhrd4";

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

	// 산 번호 받아서 산에 있는 등산로 전체 출력 ( 리스트로 반환)
	// course_2 >> 등산로 이름 , 차 교통정보, 버스 교통정보, 기차 교통정보
	public ArrayList<Course_3_img_DTO> selectCourse(int seq) {
		try {
			getConn();
			String sql = "select * from course_3_img where course_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();

			while (rs.next()) {

				int course_img_seq = rs.getInt("course_img_seq");
				int mountain_seq = rs.getInt("mountain_seq");
				int course_seq = rs.getInt("course_seq");
				String course_name = rs.getString("course_name");
				String course_img = rs.getString("course_img");
				

				dto = new Course_3_img_DTO(course_img_seq, mountain_seq,course_seq, course_name,course_img);

				dto_list.add(dto);
				
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return dto_list;
	}

	
}
