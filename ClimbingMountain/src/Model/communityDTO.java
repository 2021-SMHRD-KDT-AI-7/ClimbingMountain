package Model;

public class communityDTO {

	private int comm_num;	// 순번
	private String comm_title;	// 제목
	private String comm_content;	// 내용
	private String comm_date;	// 작성일자
	private int comm_cnt;	// 조회수
	private String member_id;	// 작성자id
	private String comm_file1;	// 업로드파일1
	
	public int getComm_num() {
		return comm_num;
	}
	
	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
	
	public String getComm_title() {
		return comm_title;
	}
	
	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}
	
	public String getComm_content() {
		return comm_content;
	}
	
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	
	public String getComm_date() {
		return comm_date;
	}
	
	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}
	
	public int getComm_cnt() {
		return comm_cnt;
	}
	
	public void setComm_cnt(int member_id) {
		this.comm_cnt = comm_cnt;
	}
	
	public String getmember_id() {
		return member_id;
	}
	
	public void setmember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getComm_file1() {
		return comm_file1;
	}
	
	public void setComm_file1(String comm_file1) {
		this.comm_file1 = comm_file1;
	}
	
	public communityDTO(int comm_num, String comm_title, String comm_content, String comm_date, int comm_cnt,
			String member_id, String comm_file1) {
		this.comm_num = comm_num;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_date = comm_date;
		this.comm_cnt = comm_cnt;
		this.member_id = member_id;
		this.comm_file1 = comm_file1;
	}

	
	public communityDTO(String comm_title, String comm_content, String member_id, String comm_file1) {
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.member_id = member_id;
		this.comm_file1 = comm_file1;
	}

	public communityDTO(int comm_num, String comm_title, String comm_date, int comm_cnt, String member_id) {
		this.comm_num = comm_num;
		this.comm_title = comm_title;
		this.comm_date = comm_date;
		this.comm_cnt = comm_cnt;
		this.member_id = member_id;
	}

	
	
	
	
}
