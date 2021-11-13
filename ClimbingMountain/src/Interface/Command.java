package Interface;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// ��� �޼ҵ帶�� �Ű������� request, response �� �޾ƾ��ϴµ�
	// �� ������ �ݺ��Ǳ� ������ interface�� ����
	// �޼ҵ� ����� ������ �ܼ�ȭ ��Ų��.!
	
	// �߻�޼ҵ� : ���� ���� �޼ҵ��� �⺻���� �������ִ� ����
	
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);
	

}
