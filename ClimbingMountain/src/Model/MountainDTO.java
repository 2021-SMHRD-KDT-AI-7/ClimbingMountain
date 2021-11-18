package Model;

import java.util.Date;

public class MountainDTO {
	//승옥 - 11월18일 오후 12시 작성시작
	private int mountain_seq;  // 시퀀스 ( 고유번호) 로 검색할거임
	private int pmntn_sn;		// 등산로 좌표   ㅇ
	private int mntn_code; 		// 산 코드___    
	private String mntn_nm;		// 산 이름    ㅇ
	private String pmntn_nm;	// 등산로 이름  ㅇ
	private String pmntn_main;	//등산로 설명 ㅇ
	private int pmntn_lt; 		// 등산로 길이 ㅇ
	private String pmntn_dffl;  // 등산로 난이도 ㅇ
	private int pmntn_uppl;		//상행시간 ㅇ
	private int pmntn_godn;		//하행시간 ㅇ
	private String pmntn_mtrq; //등산로 지반재질
	private String pmntn_cnrl;  //등산로 통제여부 
	private String pmntn_cls;  //등산로 폐쇄여부
	private String pmntn_risk; //등산로 위험구간 내용 
	private String pmntn_reco; //등산로 추천여부 
	private String mountain_pic1; //산 사진 1 
	private String mountain_pic2; //산 사진 1 
	private String mountain_pic3; //산 사진 1 
	private Date data_stdr;   // 데이터 입력 날짜
	private String mntn_id;  // 관리자 아이디
	
	

	public MountainDTO(int mountain_seq, int pmntn_sn, int mntn_code, String mntn_nm, String pmntn_nm,
			String pmntn_main, int pmntn_lt, String pmntn_dffl, int pmntn_uppl, int pmntn_godn, String pmntn_mtrq,
			String pmntn_cnrl, String pmntn_cls, String pmntn_risk, String pmntn_reco, String mountain_pic1,
			String mountain_pic2, String mountain_pic3, Date data_stdr, String mntn_id) {
		this.mountain_seq = mountain_seq;
		this.pmntn_sn = pmntn_sn;
		this.mntn_code = mntn_code;
		this.mntn_nm = mntn_nm;
		this.pmntn_nm = pmntn_nm;
		this.pmntn_main = pmntn_main;
		this.pmntn_lt = pmntn_lt;
		this.pmntn_dffl = pmntn_dffl;
		this.pmntn_uppl = pmntn_uppl;
		this.pmntn_godn = pmntn_godn;
		this.pmntn_mtrq = pmntn_mtrq;
		this.pmntn_cnrl = pmntn_cnrl;
		this.pmntn_cls = pmntn_cls;
		this.pmntn_risk = pmntn_risk;
		this.pmntn_reco = pmntn_reco;
		this.mountain_pic1 = mountain_pic1;
		this.mountain_pic2 = mountain_pic2;
		this.mountain_pic3 = mountain_pic3;
		this.data_stdr = data_stdr;
		this.mntn_id = mntn_id;
	}



	public MountainDTO(String mntn_nm, String pmntn_nm, String pmntn_main, int pmntn_lt, String pmntn_dffl,
			int pmntn_uppl, int pmntn_godn) {
		this.mntn_nm = mntn_nm;
		this.pmntn_nm = pmntn_nm;
		this.pmntn_main = pmntn_main;
		this.pmntn_lt = pmntn_lt;
		this.pmntn_dffl = pmntn_dffl;
		this.pmntn_uppl = pmntn_uppl;
		this.pmntn_godn = pmntn_godn;
	}
	
	public int getMountain_seq() {
		return mountain_seq;
	}



	public void setMountain_seq(int mountain_seq) {
		this.mountain_seq = mountain_seq;
	}



	public int getPmntn_sn() {
		return pmntn_sn;
	}



	public void setPmntn_sn(int pmntn_sn) {
		this.pmntn_sn = pmntn_sn;
	}



	public int getMntn_code() {
		return mntn_code;
	}



	public void setMntn_code(int mntn_code) {
		this.mntn_code = mntn_code;
	}



	public String getMntn_nm() {
		return mntn_nm;
	}



	public void setMntn_nm(String mntn_nm) {
		this.mntn_nm = mntn_nm;
	}



	public String getPmntn_nm() {
		return pmntn_nm;
	}



	public void setPmntn_nm(String pmntn_nm) {
		this.pmntn_nm = pmntn_nm;
	}



	public String getPmntn_main() {
		return pmntn_main;
	}



	public void setPmntn_main(String pmntn_main) {
		this.pmntn_main = pmntn_main;
	}



	public int getPmntn_lt() {
		return pmntn_lt;
	}



	public void setPmntn_lt(int pmntn_lt) {
		this.pmntn_lt = pmntn_lt;
	}



	public String getPmntn_dffl() {
		return pmntn_dffl;
	}



	public void setPmntn_dffl(String pmntn_dffl) {
		this.pmntn_dffl = pmntn_dffl;
	}



	public int getPmntn_uppl() {
		return pmntn_uppl;
	}



	public void setPmntn_uppl(int pmntn_uppl) {
		this.pmntn_uppl = pmntn_uppl;
	}



	public int getPmntn_godn() {
		return pmntn_godn;
	}



	public void setPmntn_godn(int pmntn_godn) {
		this.pmntn_godn = pmntn_godn;
	}



	public String getPmntn_mtrq() {
		return pmntn_mtrq;
	}



	public void setPmntn_mtrq(String pmntn_mtrq) {
		this.pmntn_mtrq = pmntn_mtrq;
	}



	public String getPmntn_cnrl() {
		return pmntn_cnrl;
	}



	public void setPmntn_cnrl(String pmntn_cnrl) {
		this.pmntn_cnrl = pmntn_cnrl;
	}



	public String getPmntn_cls() {
		return pmntn_cls;
	}



	public void setPmntn_cls(String pmntn_cls) {
		this.pmntn_cls = pmntn_cls;
	}



	public String getPmntn_risk() {
		return pmntn_risk;
	}



	public void setPmntn_risk(String pmntn_risk) {
		this.pmntn_risk = pmntn_risk;
	}



	public String getPmntn_reco() {
		return pmntn_reco;
	}



	public void setPmntn_reco(String pmntn_reco) {
		this.pmntn_reco = pmntn_reco;
	}



	public String getMountain_pic1() {
		return mountain_pic1;
	}



	public void setMountain_pic1(String mountain_pic1) {
		this.mountain_pic1 = mountain_pic1;
	}



	public String getMountain_pic2() {
		return mountain_pic2;
	}



	public void setMountain_pic2(String mountain_pic2) {
		this.mountain_pic2 = mountain_pic2;
	}



	public String getMountain_pic3() {
		return mountain_pic3;
	}



	public void setMountain_pic3(String mountain_pic3) {
		this.mountain_pic3 = mountain_pic3;
	}



	public Date getData_stdr() {
		return data_stdr;
	}



	public void setData_stdr(Date data_stdr) {
		this.data_stdr = data_stdr;
	}



	public String getMntn_id() {
		return mntn_id;
	}



	public void setMntn_id(String mntn_id) {
		this.mntn_id = mntn_id;
	}
	
	
	

}
//승옥 - 11월18일 오후 12시 작성끝