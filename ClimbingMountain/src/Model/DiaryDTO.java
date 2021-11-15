package Model;

import java.util.Date;

public class DiaryDTO {
	private int diary_seq;
	private String diary_subject;
	private String diary_content;
	private Date reg_date;
	private String member_id;
	private String diary_file1;
	private String diary_file2;
	
	
	public DiaryDTO(int diary_seq, String diary_subject, String diary_content, Date reg_date, String member_id,
			String diary_file1, String diary_file2) {
		this.diary_seq = diary_seq;
		this.diary_subject = diary_subject;
		this.diary_content = diary_content;
		this.reg_date = reg_date;
		this.member_id = member_id;
		this.diary_file1 = diary_file1;
		this.diary_file2 = diary_file2;
	}

	public DiaryDTO(String diary_subject, String diary_content, String member_id) {
		this.diary_subject = diary_subject;
		this.diary_content = diary_content;
		this.member_id = member_id;
	}

	public int getDiary_seq() {
		return diary_seq;
	}
	public void setDiary_seq(int diary_seq) {
		this.diary_seq = diary_seq;
	}
	public String getDiary_subject() {
		return diary_subject;
	}
	public void setDiary_subject(String diary_subject) {
		this.diary_subject = diary_subject;
	}
	public String getDiary_content() {
		return diary_content;
	}
	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDiary_file1() {
		return diary_file1;
	}
	public void setDiary_file1(String diary_file1) {
		this.diary_file1 = diary_file1;
	}
	public String getDiary_file2() {
		return diary_file2;
	}
	public void setDiary_file2(String diary_file2) {
		this.diary_file2 = diary_file2;
	}
	
	
	
}
