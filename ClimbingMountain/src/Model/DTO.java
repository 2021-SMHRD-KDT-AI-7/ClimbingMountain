package Model;

public class DTO {
	private String test_String;
	private int test2_num;
	
	public DTO(String test_String, int test2_num) {
		this.test_String = test_String;
		this.test2_num = test2_num;
	}

	public String getTest_String() {
		return test_String;
	}

	public void setTest_String(String test_String) {
		this.test_String = test_String;
	}

	public int getTest2_num() {
		return test2_num;
	}

	public void setTest2_num(int test2_num) {
		this.test2_num = test2_num;
	}
	

	
	
}
