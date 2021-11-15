package Controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.Command;
import Model.DiaryDAO;
import Model.DiaryDTO;


public class DiaryOneServiceCon implements Command {

	DiaryDAO diary_dao = new DiaryDAO();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int diary_seq = 1;   //�����ʿ�
		String diary_subject = request.getParameter("diary_subject");
		String diary_content = request.getParameter("diary_content");
		Date reg_date = new Date();
		String member_id = "test_gso"; //�����ʿ�
		
		String diary_file1 = request.getParameter("diary_file1");
		String diary_file2 = request.getParameter("diary_file2");
		if(diary_file1==null) {
			diary_file1 ="1����������";
		}
		if(diary_file2==null) {
			diary_file2 ="2����������";
		}
		DiaryDTO diary = new DiaryDTO(diary_seq,diary_subject,diary_content,reg_date,member_id,diary_file1,diary_file2);
		int cnt = diary_dao.insert_Diary(diary);
		
		if(cnt>0) {
			System.out.println("���ۼ���");
		}else {
			System.out.println("���۽���");
		}
		
		return "diaryView.jsp";
	}

}
