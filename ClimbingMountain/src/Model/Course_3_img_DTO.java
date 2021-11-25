package Model;

public class Course_3_img_DTO {
	private int course_img_seq;  //등산로 코스 사진
	private int mountain_seq; // 산 번호
	private int course_seq ;   // 등산로 번호
	private String course_name; // 등산로 이름
	private String course_img;  // 등산로 이미지 링크
	
	
	
	
	
	public Course_3_img_DTO(int course_img_seq, int mountain_seq, int course_seq, String course_name,
			String course_img) {
		super();
		this.course_img_seq = course_img_seq;
		this.mountain_seq = mountain_seq;
		this.course_seq = course_seq;
		this.course_name = course_name;
		this.course_img = course_img;
	}
	
	
	public int getCourse_img_seq() {
		return course_img_seq;
	}
	public void setCourse_img_seq(int course_img_seq) {
		this.course_img_seq = course_img_seq;
	}
	public int getMountain_seq() {
		return mountain_seq;
	}
	public void setMountain_seq(int mountain_seq) {
		this.mountain_seq = mountain_seq;
	}
	public int getCourse_seq() {
		return course_seq;
	}
	public void setCourse_seq(int course_seq) {
		this.course_seq = course_seq;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_img() {
		return course_img;
	}
	public void setCourse_img(String course_img) {
		this.course_img = course_img;
	}
	
	
	
	
}
