package Model;

public class Mountain100_1_DTO {
	private int mountain_seq; //산 고유번호
	private String mountain_name; // 산 이름
	private String mountain_height; // 산 높이
	private String mountain_location;// 산 위치지역
	private String mountain_season; // 추천계절
	private String mountain_time; // 산행시간
	private String difficulty; // 산 난이도
	private String mountain_use; // 사용여부 ( 100대 명산 중 13개만 사용함)
	
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
