package Model;

public class Mountain100_2_DTO {
	private int mountain_seq; // ������
	private String reason; // Ư¡ �� ��������
	private String servey; // ����
	private String information; // ����
	private String use;
	
	
	public Mountain100_2_DTO(int mountain_seq, String reason, String servey, String information,String use) {
		this.mountain_seq = mountain_seq;
		this.reason = reason;
		this.servey = servey;
		this.information = information;
		this.use = use;
	}
	


	public int getMountain_seq() {
		return mountain_seq;
	}
	public void setMountain_seq(int mountain_seq) {
		this.mountain_seq = mountain_seq;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getServey() {
		return servey;
	}
	public void setServey(String servey) {
		this.servey = servey;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	

}
