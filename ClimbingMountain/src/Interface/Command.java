package Interface;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// 모든 메소드마다 매개변수로 request, response 를 받아야하는데
	// 이 과정이 반복되기 때문에 interface를 만들어서
	// 메소드 만드는 과정을 단순화 시킨다.!
	
	// 추상메소드 : 값은 없고 메소드의 기본값을 설정해주는 역할
	
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);
	

}
