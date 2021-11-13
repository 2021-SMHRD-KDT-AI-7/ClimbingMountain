package FrontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		if(servlet_Name.equals("LoginServiceCon.do")) {
			sc = new LoginServiceCon();
		}else if(servlet_Name.equals("JoinServiceCon.do")) {
			sc = new JoinServiceCon();
		}else if(servlet_Name.equals("LogoutServiceCon.do")) {
			sc = new LogoutServiceCon();	
		}else if(servlet_Name.equals("UpdateServiceCon.do")) {
			sc = new UpdateServiceCon();	
		}else if(servlet_Name.equals("MessageServiceCon.do")) {
			sc = new MessageServiceCon();			
		}else if(servlet_Name.equals("DeleteServiceCon.do")) {
			sc = new DeleteServiceCon();						
		}else if(servlet_Name.equals("DeleteOneServiceCon.do")) {
			sc = new DeleteOneServiceCon();					
		}else if(servlet_Name.equals("WriteBoardServiceCon.do")) {
			sc = new WriteBoardServiceCon();		
		}
		String path = sc.execute(request, response);
		response.sendRedirect(path);		
	}
}
