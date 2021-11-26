package Model;

public class Mountain100_3_img_DTO {
	private int mountain_seq; // 산번호
	private String mountain_name; // 산이름
	private String mountain_img; // 이미지 파일 경로
	
	
	
	
	
	
	public Mountain100_3_img_DTO(int mountain_seq, String mountain_name, String mountain_img) {
		super();
		this.mountain_seq = mountain_seq;
		this.mountain_name = mountain_name;
		this.mountain_img = mountain_img;
	}
	
	public int getMountain_seq() {
		return mountain_seq;
	}
	public void setMountain_seq(int mountain_seq) {
		this.mountain_seq = mountain_seq;
	}
	public String getMountain_name() {
		return mountain_name;
	}
	public void setMountain_name(String mountain_name) {
		this.mountain_name = mountain_name;
	}
	public String getMountain_img() {
		return mountain_img;
	}
	public void setMountain_img(String mountain_img) {
		this.mountain_img = mountain_img;
	}
	
	
	
}
