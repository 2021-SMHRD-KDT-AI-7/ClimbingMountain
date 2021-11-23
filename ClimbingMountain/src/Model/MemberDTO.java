// ������ 2021-11-13
package Model;

import java.util.Date;

public class MemberDTO {

	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_addr;
	private int member_age;
	private String member_gender;

	
	public MemberDTO(String member_id, String member_pwd, String member_name, String member_addr, int member_age,
			String member_gender) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_addr = member_addr;
		this.member_age = member_age;
		this.member_gender = member_gender;
	}

	
	public String getMember_id() {
		return member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public int getMember_age() {
		return member_age;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}


	@Override
	public String toString() {
		return 	"ȸ�����̵�=" + member_id + 
				"\tȸ�� ��й�ȣ=" + member_pwd + 
				"\tȸ�� �̸�" + member_name + 
				"\tȸ�� �ּ�=" + member_addr + 
				"\tȸ�� ����=" + member_age + 
				"\tȸ�� ����=" + member_gender;
	}
}
