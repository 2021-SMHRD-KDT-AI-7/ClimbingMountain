// 정현수 2021-11-13
package Model;

import java.util.Date;

public class MemberDTO {

	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_addr;
	private int member_age;
	private String member_health;
	private String member_gender;
	private int member_career;
	private Date member_joindate;
	private String admin_yn;		// boolean 타입으로 바꿔야 할까 고민.
	
	public MemberDTO(String member_id, String member_pwd, String member_name, String member_addr, int member_age,
			String member_health, String member_gender, int member_career, Date member_joindate, String admin_yn) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_addr = member_addr;
		this.member_age = member_age;
		this.member_health = member_health;
		this.member_gender = member_gender;
		this.member_career = member_career;
		this.member_joindate = member_joindate;
		this.admin_yn = admin_yn;
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
	public String getMember_health() {
		return member_health;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public int getMember_career() {
		return member_career;
	}
	public Date getMember_joindate() {
		return member_joindate;
	}
	public String getAdmin_yn() {
		return admin_yn;
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
	public void setMember_health(String member_health) {
		this.member_health = member_health;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public void setMember_career(int member_career) {
		this.member_career = member_career;
	}
	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}
	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}

	@Override
	public String toString() {
		return 	"회원아이디=" + member_id + 
				"\t회원 비밀번호=" + member_pwd + 
				"\t회원 이름" + member_name + 
				"\t회원 주소=" + member_addr + 
				"\t회원 나이=" + member_age + 
				"\t회원 건강상태=" + member_health + 
				"\t회원 성별=" + member_gender + 
				"\t등산 경력=" + member_career + 
				"\t가입 일자=" + member_joindate + 
				"\t관리자 여부=" + admin_yn;
	}
}
