package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Mountain100_3_img_DAO {

	Mountain100_3_img_DTO dto = null;
	
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


	public Mountain100_3_img_DTO selectMountain_img(int seq){
		try { 
			getConn();
			String sql = "select * from Mountain100_3_img where mountain_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int mountain_seq = rs.getInt("mountain_seq"); //  산 시퀀스
				String mountain_name = rs.getString("mountain_name"); // 산 이름
				String mountain_img = rs.getString("mountain_img");// 산 이미지 파일 경로
				
				
				dto = new Mountain100_3_img_DTO(mountain_seq,mountain_name,mountain_img);
				

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




