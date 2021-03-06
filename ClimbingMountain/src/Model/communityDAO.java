package Model;

import java.sql.Connection;
import java.sql.Date;
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
	ArrayList<communityDTO> c_list = new ArrayList<communityDTO>();

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

	/*
	 * // 게시판 보기 public ArrayList<communityDTO> viewBoard() {
	 * 
	 * getConn(); try {
	 * 
	 * String sql = "select * from tbl_community order by reg_date desc";
	 * 
	 * psmt = conn.prepareStatement(sql);
	 * 
	 * rs = psmt.executeQuery();
	 * 
	 * while (rs.next()) { int community_seq = rs.getInt("community_seq"); String
	 * community_subject = rs.getString("community_subject"); Date reg_date =
	 * rs.getDate("reg_date"); int community_cnt = rs.getInt("community_cnt");
	 * String member_id = rs.getString("member_id");
	 * 
	 * dto = new communityDTO(community_seq, community_subject, reg_date,
	 * community_cnt, member_id); c_list.add(dto); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { dbclose(); } return
	 * c_list;
	 * 
	 * }
	 */

	// 게시글 세부내용
	public communityDTO viewOneBoard(int community_seq) {

		getConn();
		try {

			String sql = "select * from tbl_community where community_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, community_seq);
			rs = psmt.executeQuery();

			if (rs.next()) {

				int Community_seq = rs.getInt("community_seq");
				String community_subject = rs.getString("community_subject");
				String community_content = rs.getString("community_content");
				Date reg_date = rs.getDate("reg_date");
				int community_cnt = rs.getInt("community_cnt");
				String Member_id = rs.getString("member_id");
				String community_file1 = rs.getString("community_file1");
				String community_file2 = rs.getString("community_file2");
				String community_file3 = rs.getString("community_file3");

				dto = new communityDTO(community_seq, community_subject, community_content, reg_date, community_cnt,
						Member_id, community_file1, community_file2, community_file3);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return dto;
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

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// 조회수 증가
	public int updatehit(int community_seq, int community_cnt) {
		getConn();
		try {
			String sql = "update tbl_community set community_cnt=? where community_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, community_cnt + 1);
			psmt.setInt(2, community_seq);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// 글 수정하기
	public int updateCommunity(int community_seq, String community_subject, String community_content,
			String community_file1, String community_file2, String community_file3) {
		getConn();
		try {
			String sql = "update tbl_community set community_subject = ?, community_content = ?, community_file1 = ?, community_file2 = ?, community_file3 = ? where community_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, community_subject);
			psmt.setString(2, community_content);
			psmt.setString(3, community_file1);
			psmt.setString(4, community_file2);
			psmt.setString(5, community_file3);
			psmt.setInt(6, community_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return cnt;
	}

	// 글 삭제
	public int deleteCommunity(int community_seq) {
		getConn();
		try {
			String sql = "delete from tbl_community where community_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, community_seq);

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
			String sql = "select count(*) from tbl_community";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getInt(1));
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return -1;
	}

	public ArrayList<communityDTO> getList(int startRow, int endRow) { //

		getConn();
		try {

			String sql = "select rn, community_seq, community_subject, reg_date, community_cnt, member_id from("
					+ "select  rownum as rn, community_seq, community_subject, reg_date, community_cnt, member_id "
					+ "from tbl_community  order by community_seq desc)" + " where rn between ? and ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int rownum = rs.getInt("rn");
				int community_seq = rs.getInt("community_seq");
				String community_subject = rs.getString("community_subject");
				Date reg_date = rs.getDate("reg_date");
				int community_cnt = rs.getInt("community_cnt");
				String Member_id = rs.getString("member_id");

				dto = new communityDTO(rownum,community_seq, community_subject, reg_date, community_cnt, Member_id);
				c_list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}

		return c_list;
	}
}
