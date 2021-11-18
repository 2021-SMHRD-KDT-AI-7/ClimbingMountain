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

import Model.MemberDTO;
import Model.communityDAO;
import Model.communityDTO;

@WebServlet("/communityServiceCon")
public class communityServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[communityServiceCon]");
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("info");
		
		int maxSize = 1024*1024*5;  // 5MB
		String encoding = "EUC-KR";
		String saveDirectory = request.getServletContext().getRealPath("file");
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String comm_title = multi.getParameter("comm_title");
		String comm_content = multi.getParameter("comm_content");
		String member_id = mdto.getMember_id();
		String fileName1 = URLEncoder.encode(multi.getFilesystemName("file1"),"EUC-KR");
		String fileName2 = URLEncoder.encode(multi.getFilesystemName("file2"),"EUC-KR");
		String fileName3 = URLEncoder.encode(multi.getFilesystemName("file3"),"EUC-KR");
		
		System.out.println("title : "+comm_title);
		System.out.println("content : "+comm_content);
		System.out.println("member_id : "+ member_id);
		System.out.println("fileName1 : "+fileName1);
		System.out.println("fileName2 : "+fileName2);
		System.out.println("fileName3 : "+fileName3);
		
		communityDTO dto = new communityDTO(comm_title, comm_content, member_id, fileName1, fileName2, fileName3);
		communityDAO dao = new communityDAO();
		int cnt = dao.upload(dto);
		
																								
		
		if(cnt>0) {
			System.out.println("파일 업로드 성공");
		}else {
			System.out.println("파일 업로드 실패");
		}
		
		response.sendRedirect("main.jsp");
		
		
	}

}
