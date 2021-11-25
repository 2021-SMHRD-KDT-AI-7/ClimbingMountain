package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Course_1_DAO {
	ArrayList<Course_1_DTO> dto_list = new ArrayList<>();
	Course_1_DTO dto = null;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	
	// DB���� �޼ҵ�
		public void getConn() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// Ű��Ű
				String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
				String db_id = "campus_c_d_1111";
				String db_pw = "smhrd4";

				conn = DriverManager.getConnection(db_url, db_id, db_pw);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// DB���� �޼ҵ�
		public void dbClose() {
				try {
					if(rs!= null)
						rs.close();
					if (psmt != null)
						psmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		
		
		// �� ��ȣ �޾Ƽ�  �꿡 �ִ� ���� ��ü ��� ( ����Ʈ�� ��ȯ)   
		// course_1  >> ���� �̸� , ���� , ���� �̹���
  		public ArrayList<Course_1_DTO> selectCourse(int seq){
			try { 
				getConn();
				String sql = "select * from course_1 where mountain_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				rs = psmt.executeQuery();
				
		
				
				while(rs.next()) {
					
					int course_seq = rs.getInt("course_seq");
					int mountain_seq = rs.getInt("mountain_seq");
					String course_name = rs.getString("course_name");
					String course_exp = rs.getString("course_exp");
					String course_exp_img = rs.getString("course_exp_img");
					
					dto = new Course_1_DTO(course_seq,mountain_seq,course_name,course_exp,course_exp_img);
					dto_list.add(dto);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally{
				dbClose();
			}
			return dto_list;
		}
		
	
	

}
