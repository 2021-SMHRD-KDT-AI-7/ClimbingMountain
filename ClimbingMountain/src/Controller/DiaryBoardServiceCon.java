package Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Interface.Command;

public class DiaryBoardServiceCon {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
			try {
				System.out.println("[WriteBoardServiceCon]");
				
				
				
				String saveDirectoy = request.getServletContext().getRealPath("file");
				int maxSize = 1024*1024*5;
				String encoding = "euc-kr";
				MultipartRequest multi = new MultipartRequest(request, saveDirectoy, maxSize, encoding, new DefaultFileRenamePolicy());
				
				String title = multi.getParameter("title");
				String writer = multi.getParameter("writer");
				String content = multi.getParameter("content");
				String fileName = multi.getFilesystemName("fileName");
				
				BoardDAO board_dao = new BoardDAO();
				BoardDTO board_dto = new BoardDTO(title,writer,fileName, content);
				
				
				int cnt = board_dao.upload(board_dto);

				if(cnt>0) {
					System.out.println("파일전송성공");
				}else {
					System.out.println("파일전송실패");
				}
				

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "boardMain.jsp";
		}

}


