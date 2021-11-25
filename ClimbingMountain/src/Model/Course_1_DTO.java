package Model;

public class Course_1_DTO {
	private int course_seq;    // 등산로 번호
	private int mountain_seq;   // 산 번호 
	private String course_name;  // 등산로 이름
	private String course_exp;   // 등산로 설명 
	private String course_exp_img;   // 등산로 설명 이미지
	// 산 ---->  등산로 -----> 등산로 사진들 (설명 말고 코스 사진)
	
	public Course_1_DTO(int course_seq, int mountain_seq, String course_name, String course_exp,
			String course_exp_img) {
		super();
		this.course_seq = course_seq;
		this.mountain_seq = mountain_seq;
		this.course_name = course_name;
		this.course_exp = course_exp;
		this.course_exp_img = course_exp_img;
	}
	public int getCourse_seq() {
		return course_seq;
	}
	public void setCourse_seq(int course_seq) {
		this.course_seq = course_seq;
	}
	public int getMountain_seq() {
		return mountain_seq;
	}
	public void setMountain_seq(int mountain_seq) {
		this.mountain_seq = mountain_seq;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_exp() {
		return course_exp;
	}
	public void setCourse_exp(String course_exp) {
		this.course_exp = course_exp;
	}
	
	public String getCourse_exp_img() {
		return course_exp_img;
	}
	public void setCourse_exp_img(String course_exp_img) {
		this.course_exp_img = course_exp_img;
	}
	
	
}
