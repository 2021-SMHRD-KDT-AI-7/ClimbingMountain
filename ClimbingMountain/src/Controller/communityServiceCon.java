package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.communityDAO;
import Model.communityDTO;

@WebServlet("/communityServiceCon")
public class communityServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[communityServiceCon]");
		
		request.setCharacterEncoding("EUC-KR");
		
		String saveDirectory = request.getServletContext().getRealPath("file");
		
		int maxSize = 1024*1024*5;  // 5MB
		String encoding = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String comm_title = multi.getParameter("comm_title");
		String comm_content = multi.getParameter("comm_content");
		String member_id = multi.getParameter("member_id");

		String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"),"EUC-KR");
		
		System.out.println("title : "+comm_title);
		System.out.println("writer : "+comm_content);
		System.out.println("content : "+member_id);
		System.out.println("fileName : "+fileName);
		
		communityDTO dto = new communityDTO(comm_title, comm_content, member_id, fileName);
		communityDAO dao = new communityDAO();
		int cnt = dao.upload(dto);
		
		if(cnt>0) {
			System.out.println("파일 업로드 성공");
		}else {
			System.out.println("파일 업로드 실패");
		}
		
		response.sendRedirect("boardMain.jsp");
		
		
	}

}
