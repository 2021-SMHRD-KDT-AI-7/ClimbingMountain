package Model;

public class Course_2_DTO {
	private int course_seq;
	private int mountain_seq;
	private String course_name;
	private String car;
	private String bus;
	private String train;
	
	public Course_2_DTO(int course_seq, int mountain_seq, String course_name, String car, String bus, String train) {
		super();
		this.course_seq = course_seq;
		this.mountain_seq = mountain_seq;
		this.course_name = course_name;
		this.car = car;
		this.bus = bus;
		this.train = train;
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
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getBus() {
		return bus;
	}
	public void setBus(String bus) {
		this.bus = bus;
	}
	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
	}
	
	
}
