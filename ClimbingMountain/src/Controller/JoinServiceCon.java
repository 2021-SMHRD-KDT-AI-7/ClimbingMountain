// 정현수 2021-11-15
package Controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.Command;
import Model.MemberDAO;

public class JoinServiceCon implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		System.out.println("[JoinServiceCON]");
		// 1. String to Date, Date to String 형변환
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		// 2. email, pw, tel, address 값 받아오기
		String member_id = request.getParameter("member_id");
		String member_pwd = request.getParameter("member_pwd");
		String member_name = request.getParameter("member_name");
		String member_addr = request.getParameter("member_addr");
		int member_age = Integer.parseInt(request.getParameter("member_age"));
		String member_health = request.getParameter("member_health");
		String member_gender = request.getParameter("member_gender");
		int member_career = Integer.parseInt(request.getParameter("member_career"));
		Date member_joindate = new Date();					// SQL문에 sysdate를 쓰면 되니 필요없다고 생각했는데, MemberDTO를 생각하면 Date타입이어야 한다.
		String admin_yn  = request.getParameter("admin_yn");
		
		System.out.println("member_id : "+member_id);
		System.out.println("member_pwd : "+member_pwd);
		System.out.println("member_name : "+member_name);
		System.out.println("member_addr : "+member_addr);
		System.out.println("member_age : "+member_age);
		System.out.println("member_health : "+member_health);
		System.out.println("member_gender : "+member_gender);
		System.out.println("member_career : "+member_career);
		System.out.println("member_joindate : "+member_joindate);
		System.out.println("admin_yn : "+admin_yn);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member_id, member_pwd, member_name, member_addr, member_age, member_health, member_gender, member_career, member_joindate, admin_yn);
				
		String path = null;
		if(cnt>0) {
			System.out.println("회원가입 성공");
			path = "join_success.jsp?member_id="+member_id;
		}else {
			System.out.println("회원가입 실패");
			path = "main.jsp";
		}
		return path;
	}
}
