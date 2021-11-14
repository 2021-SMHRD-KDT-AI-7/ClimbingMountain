package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class communityDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	communityDTO dto = null;
	
		// DB연결 메소드
		public void getConn() {

			try {

				Class.forName("oracle.jdbc.driver.OracleDriver");

				String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
				String db_id = "hr";
				String db_pw = "hr";

				conn = DriverManager.getConnection(db_url, db_id, db_pw);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// DB종료 메소드
		public void dbclose() {
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

		// 게시판 보기
		public ArrayList<communityDTO> viewBoard() {
			ArrayList<communityDTO> c_list = new ArrayList<communityDTO>();
			getConn();
			try {
				
				String sql = "select * from tbl_community order by reg_date desc";
				
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int comm_num = rs.getInt("comm_num");
					String comm_title = rs.getString("comm_title");
					String comm_date = rs.getString("comm_date");
					int comm_cnt = rs.getInt("comm_cnt");
					String member_id = rs.getString("member_id");
					
					dto = new communityDTO(comm_num, comm_title, comm_date, comm_cnt, member_id);
					c_list.add(dto);
				}
		
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbclose();
			}return c_list;		
			
		}
		
		// 게시글 세부내용
		public communityDTO viewOneBoard(String num) {

			getConn();
			try {
				
				String sql = "select * from tbl_community where community_seq=?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, num);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					int comm_num = rs.getInt("comm_num");
					String comm_title = rs.getString("comm_title");
					String comm_content = rs.getString("comm_content");
					String comm_date = rs.getString("comm_date");
					int comm_cnt = rs.getInt("comm_cnt");
					String member_id = rs.getString("member_id");
					String comm_file1 = rs.getString("comm_file1");
					
					dto = new communityDTO(comm_num, comm_title, comm_content, comm_date, comm_cnt, member_id, comm_file1);
				}

			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbclose();
			}return dto;
		}

		// 파일 업로드
		public int upload(communityDTO dto) {
			getConn();
			try {
				String sql = "insert into tbl_community values(community_seq.nextval, ?, ?, ?, ?, reg_date)";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getComm_title());
				psmt.setString(2, dto.getComm_content());
				psmt.setString(3, dto.getmember_id());
				psmt.setString(4, dto.getComm_file1());
				
				cnt = psmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbclose();
			}return cnt;
		}

}
