package Model;

public class Course_1_DTO {
	private int course_seq;    // ���� ��ȣ
	private int mountain_seq;   // �� ��ȣ 
	private String course_name;  // ���� �̸�
	private String course_exp;   // ���� ���� 
	private String course_exp_img;   // ���� ���� �̹���
	// �� ---->  ���� -----> ���� ������ (���� ���� �ڽ� ����)
	
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
