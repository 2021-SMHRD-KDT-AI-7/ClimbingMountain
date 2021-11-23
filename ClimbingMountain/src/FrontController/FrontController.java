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

//10월 29일 오전 9시 40분
// .do 실행과정    ( 선생님이 시연 중)

@WebServlet("*.do") // * 전체 의미    ,   *.do 라는 확장자를 가지고 있으면 모두 FrontController로 오게 만드는 것
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[FrontController]");
		
		String req_URI = request.getRequestURI();
		System.out.println("어디서 요청이 들어왔는지 = " + req_URI);
		
		// 프로젝트 이름 가지고 오기
		String project_Name = request.getContextPath();
		System.out.println("프로젝트 이름 : " +  project_Name);
		
		// servlet 이름만 출력하기
		// 문자열 자르는 함수 : substring 사용하기!
		// substring(start, end) :ㅇ start부터 end전 까지 문자열 자르기
		// substring(start) : start부터 끝까지 문자열 자르기
		String servlet_Name = req_URI.substring(project_Name.length()+1);
		System.out.println("서블릿 이름은 : " + servlet_Name);
		
		// Command 패턴 
		// 클라이언트로부터 받은 요청들에 대해서 서블릿이 직접 처리하지 않고, 해당 클래스가 처리하도록 한다.
		
		// 업캐스팅 : 부모클래스의 타입으로 자식클래스를 형변환 하는 것
		Command sc = null;
		
		request.setCharacterEncoding("UTF-8");

		if(servlet_Name.equals("DiaryOneServiceCon.do")) {
			sc = new DiaryOneServiceCon();
		}else if(servlet_Name.equals("Login/LoginServiceCon.do")){
			sc = new LoginServiceCon();
		}else if(servlet_Name.equals("Join/JoinServiceCon.do")){
			sc = new JoinServiceCon();
		}else if(servlet_Name.equals("Main/LogoutServiceCon.do")) {
			sc = new LogoutServiceCon();
		}
		
		String path = sc.execute(request, response);
		response.sendRedirect(path);	
	}
}
