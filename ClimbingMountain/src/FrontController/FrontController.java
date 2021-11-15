package FrontController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DiaryOneServiceCon;
import Controller.JoinServiceCon;
import Controller.LoginServiceCon;
import Controller.LogoutServiceCon;
import Interface.Command;

//10�� 29�� ���� 9�� 40��
// .do �������    ( �������� �ÿ� ��)

@WebServlet("*.do") // * ��ü �ǹ�    ,   *.do ��� Ȯ���ڸ� ������ ������ ��� FrontController�� ���� ����� ��
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[FrontController]");
		
		String req_URI = request.getRequestURI();
		System.out.println("��� ��û�� ���Դ��� = " + req_URI);
		
		// ������Ʈ �̸� ������ ����
		String project_Name = request.getContextPath();
		System.out.println("������Ʈ �̸� : " +  project_Name);
		
		// servlet �̸��� ����ϱ�
		// ���ڿ� �ڸ��� �Լ� : substring ����ϱ�!
		// substring(start, end) :�� start���� end�� ���� ���ڿ� �ڸ���
		// substring(start) : start���� ������ ���ڿ� �ڸ���
		String servlet_Name = req_URI.substring(project_Name.length()+1);
		System.out.println("���� �̸��� : " + servlet_Name);
		
		// Command ���� 
		// Ŭ���̾�Ʈ�κ��� ���� ��û�鿡 ���ؼ� ������ ���� ó������ �ʰ�, �ش� Ŭ������ ó���ϵ��� �Ѵ�.
		
		// ��ĳ���� : �θ�Ŭ������ Ÿ������ �ڽ�Ŭ������ ����ȯ �ϴ� ��
		Command sc = null;
		
		request.setCharacterEncoding("euc-kr");

		if(servlet_Name.equals("DiaryOneServiceCon.do")) {
			sc = new DiaryOneServiceCon();
		}else if(servlet_Name.equals("loginServiceCon.do")){
			sc = new LoginServiceCon();
		}else if(servlet_Name.equals("JoinServiceCon.do")){
			sc = new JoinServiceCon();
		}else if(servlet_Name.equals("logoutServiceCon.do")) {
			sc = new LogoutServiceCon();
		}
		String path = sc.execute(request, response);
		response.sendRedirect(path);	
	}
}
