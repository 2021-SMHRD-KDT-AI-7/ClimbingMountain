package Model;

public class communityDTO {

	private int community_seq;	// ����
	private String community_subject;	// ����
	private String community_content;	// ����
	private String reg_date;	// �ۼ�����
	private int community_cnt;	// ��ȸ��
	private String member_id;	// �ۼ���id
	private String community_file1;	// ���ε�����1
	private String community_file2;	// ���ε�����2
	private String community_file3;	// ���ε�����3
	
	public int getCommunity_seq() {
		return community_seq;
	}
	public void setCommunity_seq(int community_seq) {
		this.community_seq = community_seq;
	}
	public String getCommunity_subject() {
		return community_subject;
	}
	public void setCommunity_subject(String community_subject) {
		this.community_subject = community_subject;
	}
	public String getCommunity_content() {
		return community_content;
	}
	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getCommunity_cnt() {
		return community_cnt;
	}
	public void setCommunity_cnt(int community_cnt) {
		this.community_cnt = community_cnt;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCommunity_file1() {
		return community_file1;
	}
	public void setCommunity_file1(String community_file1) {
		this.community_file1 = community_file1;
	}
	public String getCommunity_file2() {
		return community_file2;
	}
	public void setCommunity_file2(String community_file2) {
		this.community_file2 = community_file2;
	}
	public String getCommunity_file3() {
		return community_file3;
	}
	public void setCommunity_file3(String community_file3) {
		this.community_file3 = community_file3;
	}
	
	public communityDTO(int community_seq, String community_subject, String community_content, String reg_date,
			int community_cnt, String member_id, String community_file1) {
		this.community_seq = community_seq;
		this.community_subject = community_subject;
		this.community_content = community_content;
		this.reg_date = reg_date;
		this.community_cnt = community_cnt;
		this.member_id = member_id;
		this.community_file1 = community_file1;
	}
	
	public communityDTO(int community_seq, String community_subject, String reg_date, int community_cnt,
			String member_id) {
		this.community_seq = community_seq;
		this.community_subject = community_subject;
		this.reg_date = reg_date;
		this.community_cnt = community_cnt;
		this.member_id = member_id;
	}
	
	public communityDTO(String community_subject, String community_content, String member_id, String community_file1, String community_file2, String community_file3) {
		this.community_subject = community_subject;
		this.community_content = community_content;
		this.member_id = member_id;
		this.community_file1 = community_file1;
		this.community_file2 = community_file2;
		this.community_file3 = community_file3;
	}
	public communityDTO(int community_seq, String community_subject, String community_content, String reg_date,
			int community_cnt, String member_id, String community_file1, String community_file2,
			String community_file3) {
		super();
		this.community_seq = community_seq;
		this.community_subject = community_subject;
		this.community_content = community_content;
		this.reg_date = reg_date;
		this.community_cnt = community_cnt;
		this.member_id = member_id;
		this.community_file1 = community_file1;
		this.community_file2 = community_file2;
		this.community_file3 = community_file3;
	}
	
	

	
	
	
	
	
}
