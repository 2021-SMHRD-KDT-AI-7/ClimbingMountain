package Model;

public class MountaincodeDTO {
	private int mountaincode_seq;
	private String mountaincode_name;
	private String mountaincode_location;
	private String mountaincode_code;
	
	public MountaincodeDTO(int mountaincode_seq, String mountaincode_name, String mountaincode_location,
			String mountaincode_code) {
		
		this.mountaincode_seq = mountaincode_seq;
		this.mountaincode_name = mountaincode_name;
		this.mountaincode_location = mountaincode_location;
		this.mountaincode_code = mountaincode_code;
	}
	
	



	public MountaincodeDTO(String mountaincode_name, String mountaincode_location, String mountaincode_code) {
		this.mountaincode_name = mountaincode_name;
		this.mountaincode_location = mountaincode_location;
		this.mountaincode_code = mountaincode_code;
	}





	public int getMountaincode_seq() {
		return mountaincode_seq;
	}

	public void setMountaincode_seq(int mountaincode_seq) {
		this.mountaincode_seq = mountaincode_seq;
	}

	public String getMountaincode_name() {
		return mountaincode_name;
	}

	public void setMountaincode_name(String mountaincode_name) {
		this.mountaincode_name = mountaincode_name;
	}

	public String getMountaincode_location() {
		return mountaincode_location;
	}

	public void setMountaincode_location(String mountaincode_location) {
		this.mountaincode_location = mountaincode_location;
	}

	public String getMountaincode_code() {
		return mountaincode_code;
	}

	public void setMountaincode_code(String mountaincode_code) {
		this.mountaincode_code = mountaincode_code;
	}
	
	
	
	
	
	
}
