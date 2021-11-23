// ������ 2021-11-15
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Interface.Command;

public class LogoutServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[LogoutServiceCon]");
		
		// �α��� -> session
		// �α���x -> session X
		
		HttpSession session = request.getSession();
		session.removeAttribute("info");
		
		System.out.println("�α׾ƿ� ����");
		return "../Main/D_Home.jsp";
	}

}
