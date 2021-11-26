<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.DiaryDAO"%>
<%@page import="Model.DiaryDTO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		System.out.println("수정완료페이지");
		String member_id = null;
		if(session.getAttribute("member_id") != null){
			 member_id = (String) session.getAttribute("member_id");
		}
		if(member_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int maxSize = 1024*1024*10;  // 10MB
		String encoding = "UTF-8";
		String saveDirectory = request.getServletContext().getRealPath("file");
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
		String diary_seq1 = multi.getParameter("diary_seq");
		System.out.println(diary_seq1);
		
		int diary_seq = 0;
		if(multi.getParameter("diary_seq") != null){
			diary_seq = Integer.parseInt(multi.getParameter("diary_seq"));
		}
		System.out.println("diary_seq :"+ diary_seq);
		if(diary_seq == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니당')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}
			DiaryDTO dto = new DiaryDAO().viewOneBoard(diary_seq);
			if(!member_id.equals(dto.getMember_id())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다')");
				script.println("location.href='diaryView.jsp'");
				script.println("</script>");
			}else{
				if(multi.getParameter("diary_subject") == null || multi.getParameter("diary_content") == null
						|| multi.getFilesystemName("diary_file1") == null || multi.getFilesystemName("diary_file2") == null 
						|| multi.getParameter("diary_subject").equals("") || multi.getParameter("diary_content").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력되지않은 사항이 있습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					DiaryDAO dao = new DiaryDAO();
					int result = dao.updateDiary(diary_seq, multi.getParameter("diary_subject"),multi.getParameter("diary_content"),
							multi.getFilesystemName("diary_file1"),multi.getFilesystemName("diary_file2"));
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글수정 실패')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='diary_view.jsp?diary_seq="+diary_seq+"'");
						script.println("</script>");
					}
					
				}
			}
	
	%>

</body>
</html>