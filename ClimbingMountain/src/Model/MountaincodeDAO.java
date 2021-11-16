package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MountaincodeDAO {
	ArrayList<MountaincodeDTO> mountain_list = new ArrayList<>();
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


	
	
	
	
	
	
	
	public ArrayList<MountaincodeDTO> selectMountaincode(String mountain_name){
		try {
			getConn();
			String sql = "select * from TBL_MOUNTAINCODE where mountaincode_name LIKE ? ";
			psmt = conn.prepareStatement(sql);
			
			String keyword = "%"+mountain_name+"%";
			psmt.setString(1,keyword);
			
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				String mountaincode_name = rs.getString("mountaincode_name");
				String mountaincode_location = rs.getString("mountaincode_location");
				String mountaincode_code = rs.getString("mountaincode_code");
				
				
				
				MountaincodeDTO mountain = new MountaincodeDTO(mountaincode_name, mountaincode_location,mountaincode_code);
				mountain_list.add(mountain);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}dbClose();
		return mountain_list;
	}

	

}
	

