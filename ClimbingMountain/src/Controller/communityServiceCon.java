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
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("info");
		int maxSize = 1024*1024*10;  // 10MB
		String encoding = "UTF-8";
		String saveDirectory = "C:\\Users\\smhrd\\git\\ClimbingMountain\\ClimbingMountain\\WebContent\\file";
		System.out.println(saveDirectory);
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
		
				
		String community_subject = multi.getParameter("community_subject");
		String community_content = multi.getParameter("community_content");
		String member_id = mdto.getMember_id();
		
		
		
		String community_file1 ="";
		String community_file2 ="";
		String community_file3 ="";
		if(multi.getFilesystemName("community_file1")!=null) {
			community_file1 = URLEncoder.encode(multi.getFilesystemName("community_file1"),"UTF-8");	
		}
		if(multi.getFilesystemName("community_file2")!=null) {
			community_file2 = URLEncoder.encode(multi.getFilesystemName("community_file2"),"UTF-8");
		}
		if(multi.getFilesystemName("community_file3")!=null) {
			community_file3 = URLEncoder.encode(multi.getFilesystemName("community_file3"),"UTF-8");
		}
		
		
		
		
		System.out.println("community_subject : "+community_subject);
		System.out.println("community_content : "+community_content);
		System.out.println("member_id : "+ member_id);
		System.out.println("community_file1 : "+community_file1);
		System.out.println("community_file2 : "+community_file2);
		System.out.println("community_file3 : "+community_file3);
		
		communityDTO dto = new communityDTO(community_subject, community_content, member_id, community_file1, community_file2, community_file3);
		communityDAO dao = new communityDAO();
		int cnt = dao.upload(dto);																			
		
		if(cnt>0) {
			System.out.println("파일 업로드 성공");
		}else {
			System.out.println("파일 업로드 실패");
		}
		
		response.sendRedirect("./Board/list.jsp");
		
		
	}

}
