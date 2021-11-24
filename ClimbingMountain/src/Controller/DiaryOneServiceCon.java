package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.DiaryDAO;
import Model.DiaryDTO;
import Model.MemberDTO;

/**
 * Servlet implementation class DiaryOneServiceCon
 */
@WebServlet("/DiaryOneServiceCon")
public class DiaryOneServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[DiaryOneServiceCon]");
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("info");
		int maxSize = 1024*1024*10;  // 10MB
		String encoding = "EUC-KR";
		String saveDirectory = request.getServletContext().getRealPath("file");
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
				
		String diary_subject = multi.getParameter("diary_subject");
		String diary_content = multi.getParameter("diary_content");
		String member_id = mdto.getMember_id();
		String diary_file1 = URLEncoder.encode(multi.getFilesystemName("diary_file1"),"EUC-KR");
		String diary_file2 = URLEncoder.encode(multi.getFilesystemName("diary_file2"),"EUC-KR");
		
		System.out.println("diary_subject : "+diary_subject);
		System.out.println("diary_content : "+diary_content);
		System.out.println("member_id : "+ member_id);
		System.out.println("diary_file1 : "+diary_file1);
		System.out.println("diary_file2 : "+diary_file2);
		
		DiaryDTO dto = new DiaryDTO(diary_subject, diary_content, member_id, diary_file1, diary_file2);
		DiaryDAO dao = new DiaryDAO();
		int cnt = dao.upload(dto);																			
		
		if(cnt>0) {
			System.out.println("파일 업로드 성공");
		}else {
			System.out.println("파일 업로드 실패");
		}
		
		response.sendRedirect("diaryView.jsp");
		
		
	}



	}


