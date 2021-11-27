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
	DiaryDTO dto = null;

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

	// 다이어리 보기
	public ArrayList<DiaryDTO> viewBoard(String member_id) {
		ArrayList<DiaryDTO> d_list = new ArrayList<DiaryDTO>();
		getConn();
		try {
			String sql = "select * from tbl_diary where member_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);

			rs = psmt.executeQuery();
			while(rs.next()) {
				int diary_seq = rs.getInt("diary_seq");
				String diary_subject = rs.getString("diary_subject");
				Date reg_date = rs.getDate("reg_date");

				dto = new DiaryDTO(diary_seq, diary_subject, reg_date);
				d_list.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return d_list;
	}
	
	// 다이어리 세부내용
	public DiaryDTO viewOneBoard(int diary_seq) {

		getConn();
		try {

			String sql = "select * from tbl_diary where diary_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, diary_seq);
			rs = psmt.executeQuery();

			if (rs.next()) {

				int Diary_seq = rs.getInt("diary_seq");
				String diary_subject = rs.getString("diary_subject");
				String diary_content = rs.getString("diary_content");
				Date reg_date = rs.getDate("reg_date");
				String Member_id = rs.getString("member_id");
				String diary_file1 = rs.getString("diary_file1");
				String diary_file2 = rs.getString("diary_file2");

				dto = new DiaryDTO(Diary_seq, diary_subject, diary_content, reg_date, Member_id, diary_file1,
						diary_file2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return dto;
	}

	// 게시판 업로드
	public int upload(DiaryDTO dto) {
		getConn();
		try {
			String sql = "insert into tbl_diary values(tbl_diary_SEQ.nextval, ?, ?, sysdate, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getDiary_subject());
			psmt.setString(2, dto.getDiary_content());
			psmt.setString(3, dto.getMember_id());
			psmt.setString(4, dto.getDiary_file1());
			psmt.setString(5, dto.getDiary_file2());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// 글 수정하기
	public int updateDiary(int diary_seq, String diary_subject, String diary_content, String diary_file1,
			String diary_file2) {
		getConn();
		try {
			String sql = "update tbl_diary set diary_subject = ?, diary_content = ?, diary_file1 = ?, diary_file2 = ? where diary_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, diary_subject);
			psmt.setString(2, diary_content);
			psmt.setString(3, diary_file1);
			psmt.setString(4, diary_file2);
			psmt.setInt(5, diary_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// 글 삭제
	public int deletediary(int diary_seq) {
		getConn();
		try {
			String sql = "delete from tbl_diary where diary_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, diary_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}
	
	public int getcount() {
		getConn();
		try {
			String sql = "select count(*) from tbl_diary";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbclose();
		}
		return -1;
	}
	
	
}
