// 정현수 2021-11-15
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Interface.Command;
import Model.MemberDAO;
import Model.MemberDTO;

public class LoginServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
					
		// 1. 값 받아오기(member_id , member_pwd)
		String member_id = request.getParameter("member_id");
		String member_pwd = request.getParameter("member_pwd");
					
		System.out.println("member_id : "+member_id);
		System.out.println("member_pwd : "+member_pwd);
					
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(member_id, member_pwd);
					
		if(info != null) {
			System.out.println("로그인 성공");
			// session으로 로그인 정보
			HttpSession session = request.getSession();
			session.setAttribute("info", info); // object형태라서 MemberDTO 형태도 담을 수 있다.
		}else {
			System.out.println("로그인 실패");
		}	
					
		return "main1.jsp";
	}

}
