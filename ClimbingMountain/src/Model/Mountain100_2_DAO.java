package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Mountain100_2_DAO {
	
	Mountain100_2_DTO dto = null;
	
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


	public Mountain100_2_DTO selectOneMountaion100(int seq){
		try { 
			getConn();
			String sql = "select * from Mountain100_2 where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int mountain_seq = rs.getInt("num"); // 시퀀스
				String reason = rs.getString("reason"); // 특징 및 선정이유
				String survey = rs.getString("survey");// 개관
				String information = rs.getString("information"); // 정보
				String use = rs.getString("use"); // 사용여부
				
				dto = new Mountain100_2_DTO(mountain_seq,reason, survey,information,use);
				

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			dbClose();
		}
		return dto;
	}

	

}




