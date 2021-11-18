package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MountainDAO {
	// 승옥 - 11월18일 오후 12시 작성시작
	ArrayList<MountainDTO> mountain_list = new ArrayList<>();
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


	
	
	
	
	
	
	
	public ArrayList<MountainDTO> selectMountain(String search){
		try {
			getConn();
			String sql = "select * from TBL_MOUNTAIN where mntn_nm LIKE ? ";
			psmt = conn.prepareStatement(sql);
			
			String keyword = "%"+search+"%";
			psmt.setString(1,keyword);
			
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				String mntn_nm = rs.getString("mntn_nm");	// 산 이름
				String pmntn_nm = rs.getString("pmntn_nm");// 등산로 이름
				String pmntn_main = rs.getString("pmntn_main");	//등산로 설명
				int pmntn_lt = rs.getInt("pmntn_lt");// 등산로 길이
				String pmntn_dffl = rs.getString("pmntn_dffl");// 등산로 난이도
				int pmntn_uppl = rs.getInt("pmntn_uppl");//상행시간
				int pmntn_godn = rs.getInt("pmntn_godn");//하행시간
				
				
				
				MountainDTO mountain = new MountainDTO(mntn_nm, pmntn_nm, pmntn_main, pmntn_lt,pmntn_dffl,pmntn_uppl,pmntn_godn);
				mountain_list.add(mountain);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}dbClose();
		return mountain_list;
	}

	

}
// 승옥 - 11월18일 오후 12시 작성끝

