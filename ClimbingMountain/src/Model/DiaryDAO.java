package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DiaryDAO {
	
	ArrayList<DiaryDTO> DiaryBoard_list = new ArrayList<>();
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


	
	
	public int insert_Diary(DiaryDTO diary) {
		try {
			getConn();
			

			String sql = "insert into tbl_diary(diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2) values (?,?,SYSDATE,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, diary.getDiary_subject());
			psmt.setString(2, diary.getDiary_content());
			
			psmt.setString(3, diary.getMember_id());
			psmt.setString(4, diary.getDiary_file1());
			psmt.setString(5, diary.getDiary_file2());
			

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		dbClose();
		return cnt;
	}
	
	
	
	
	public ArrayList<DiaryDTO> getAllDiary(){
		try {
			getConn();
			String sql = "select * from tbl_diary";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				int diary_seq = rs.getInt("diary_seq");
				String diary_subject = rs.getString("diary_subject");
				String diary_content = rs.getString("diary_content");
				Date reg_date = rs.getDate("reg_date");
				String member_id = rs.getString("member_id");
				String diary_file1 = rs.getString("diary_file1");
				String diary_file2 = rs.getString("diary_file2");
				
				
				
				DiaryDTO diary = new DiaryDTO(diary_seq, diary_subject, diary_content, reg_date, member_id, diary_file1, diary_file2);
				DiaryBoard_list.add(diary);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}dbClose();
		return DiaryBoard_list;
	}

	
}

