package Model;

public class Mountain100_1_DTO {
	private int mountain_seq; //�� ������ȣ
	private String mountain_name; // �� �̸�
	private String mountain_height; // �� ����
	private String mountain_location;// �� ��ġ����
	private String mountain_season; // ��õ����
	private String mountain_time; // ����ð�
	private String difficulty; // �� ���̵�
	private String mountain_use; // ��뿩�� ( 100�� ��� �� 13���� �����)
	
	public Mountain100_1_DTO(int mountain_seq, String mountain_name, String mountain_height, String mountain_location,
			String mountain_season, String mountain_time, String difficulty, String mountain_use) {
		super();
		this.mountain_seq = mountain_seq;
		this.mountain_name = mountain_name;
		this.mountain_height = mountain_height;
		this.mountain_location = mountain_location;
		this.mountain_season = mountain_season;
		this.mountain_time = mountain_time;
		this.difficulty = difficulty;
		this.mountain_use = mountain_use;
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
	public String getMountain_height() {
		return mountain_height;
	}
	public void setMountain_height(String mountain_height) {
		this.mountain_height = mountain_height;
	}
	public String getMountain_location() {
		return mountain_location;
	}
	public void setMountain_location(String mountain_location) {
		this.mountain_location = mountain_location;
	}
	public String getMountain_season() {
		return mountain_season;
	}
	public void setMountain_season(String mountain_season) {
		this.mountain_season = mountain_season;
	}
	public String getMountain_time() {
		return mountain_time;
	}
	public void setMountain_time(String mountain_time) {
		this.mountain_time = mountain_time;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	
	public String getMountain_use() {
		return mountain_use;
	}
	public void setmountain_use(String mountain_use) {
		this.mountain_use = mountain_use;
	}
	
	
	
}
