package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Mountain100_1_DAO {
		ArrayList<Mountain100_1_DTO> dto_list = new ArrayList<>();
		Mountain100_1_DTO dto = null;
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


		
		
		
		
		
		
		
		public ArrayList<Mountain100_1_DTO> selectallMountain100_1(){
			try { 
				getConn();
				String sql = "select * from Mountain100_1";
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
		
				
				while(rs.next()) {
					int mountain_seq = rs.getInt("num"); //산 고유번호
					String mountain_name = rs.getString("name"); // 산 이름
					String mountain_height = rs.getString("height");; // 산 높이
					String mountain_location = rs.getString("location");;// 산 위치지역
					String mountain_season = rs.getString("season");; // 추천계절
					String mountain_time = rs.getString("time");; // 산행시간
					String difficulty = rs.getString("difficulty");; // 산 난이도
					String mountain_use = rs.getNString("use"); // 산 사용여부
					Mountain100_1_DTO dto = new Mountain100_1_DTO(mountain_seq,mountain_name,mountain_height,mountain_location,
							mountain_season,mountain_time,difficulty,mountain_use);
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
		
		public ArrayList<Mountain100_1_DTO> selectuseMountain100_1(){
			try { 
				getConn();
				String sql = "select * from Mountain100_1 where use = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "Y");
				rs = psmt.executeQuery();
				
		
				
				while(rs.next()) {
					int mountain_seq = rs.getInt("num"); //산 고유번호
					String mountain_name = rs.getString("name"); // 산 이름
					String mountain_height = rs.getString("height");; // 산 높이
					String mountain_location = rs.getString("location");;// 산 위치지역
					String mountain_season = rs.getString("season");; // 추천계절
					String mountain_time = rs.getString("time");; // 산행시간
					String difficulty = rs.getString("difficulty");; // 산 난이도
					String mountain_use = rs.getNString("use"); // 산 사용여부
					dto = new Mountain100_1_DTO(mountain_seq,mountain_name,mountain_height,mountain_location,
							mountain_season,mountain_time,difficulty,mountain_use);
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
		
		
		public Mountain100_1_DTO selectOneMountaion100(int seq){
			try { 
				getConn();
				String sql = "select * from Mountain100_1 where num = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1,seq);
				
				rs = psmt.executeQuery();
				
		
				
				if(rs.next()) {
					int mountain_seq = rs.getInt("num"); //산 고유번호
					String mountain_name = rs.getString("name"); // 산 이름
					String mountain_height = rs.getString("height");; // 산 높이
					String mountain_location = rs.getString("location");;// 산 위치지역
					String mountain_season = rs.getString("season");; // 추천계절
					String mountain_time = rs.getString("time");; // 산행시간
					String difficulty = rs.getString("difficulty");; // 산 난이도
					String mountain_use = rs.getNString("use"); // 산 사용여부
					dto = new Mountain100_1_DTO(mountain_seq,mountain_name,mountain_height,mountain_location,
							mountain_season,mountain_time,difficulty,mountain_use);

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




