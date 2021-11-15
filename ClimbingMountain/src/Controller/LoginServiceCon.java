// ������ 2021-11-15
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
					
		// 1. �� �޾ƿ���(member_id , member_pwd)
		String member_id = request.getParameter("member_id");
		String member_pwd = request.getParameter("member_pwd");
					
		System.out.println("member_id : "+member_id);
		System.out.println("member_pwd : "+member_pwd);
					
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(member_id, member_pwd);
					
		if(info != null) {
			System.out.println("�α��� ����");
			// session���� �α��� ����
			HttpSession session = request.getSession();
			session.setAttribute("info", info); // object���¶� MemberDTO ���µ� ���� �� �ִ�.
		}else {
			System.out.println("�α��� ����");
		}	
					
		return "main.jsp";
	}

}
