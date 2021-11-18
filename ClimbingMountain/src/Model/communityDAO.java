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

				String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
				String db_id = "campus_c_d_1111";
				String db_pw = "smhrd4";

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
					int community_seq = rs.getInt("community_seq");
					String community_subject = rs.getString("community_subject");
					String reg_date = rs.getString("reg_date");
					int community_cnt = rs.getInt("community_cnt");
					String member_id = rs.getString("member_id");
					
					dto = new communityDTO(community_seq, community_subject, reg_date, community_cnt, member_id);
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
					int community_seq = rs.getInt("community_seq");
					String community_subject = rs.getString("community_subject");
					String community_content = rs.getString("community_content");
					String reg_date = rs.getString("reg_date");
					int community_cnt = rs.getInt("community_cnt");
					String member_id = rs.getString("member_id");
					String community_file1 = rs.getString("community_file1");
					
					dto = new communityDTO(community_seq, community_subject, community_content, reg_date, community_cnt, member_id, community_file1);
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
				String sql = "insert into tbl_community values(tbl_community_SEQ.nextval, ?, ?, sysdate, 0, ?, ?, ?, ?)";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getCommunity_subject());
				psmt.setString(2, dto.getCommunity_content());
				psmt.setString(3, dto.getMember_id());
				psmt.setString(4, dto.getCommunity_file1());
				psmt.setString(5, dto.getCommunity_file2());
				psmt.setString(6, dto.getCommunity_file3());
				
				cnt = psmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbclose();
			}return cnt;
		}


}
