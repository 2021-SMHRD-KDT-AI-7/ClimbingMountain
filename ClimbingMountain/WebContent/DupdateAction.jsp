<%@page import="Model.DiaryDAO"%>
<%@page import="Model.DiaryDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		System.out.println("�����Ϸ�������");
		String member_id = null;
		if(session.getAttribute("member_id") != null){
			 member_id = (String) session.getAttribute("member_id");
		}
		if(member_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int maxSize = 1024*1024*10;  // 10MB
		String encoding = "EUC-KR";
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
			script.println("alert('��ȿ���� ���� ���Դϴ�')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}
			DiaryDTO dto = new DiaryDAO().viewOneBoard(diary_seq);
			if(!member_id.equals(dto.getMember_id())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ �����ϴ�')");
				script.println("location.href='diaryView.jsp'");
				script.println("</script>");
			}else{
				if(multi.getParameter("diary_subject") == null || multi.getParameter("diary_content") == null
						|| multi.getFilesystemName("diary_file1") == null || multi.getFilesystemName("diary_file2") == null 
						|| multi.getParameter("diary_subject").equals("") || multi.getParameter("diary_content").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�Էµ������� ������ �ֽ��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					DiaryDAO dao = new DiaryDAO();
					int result = dao.updateDiary(diary_seq, multi.getParameter("diary_subject"),multi.getParameter("diary_content"),
							multi.getFilesystemName("diary_file1"),multi.getFilesystemName("diary_file2"));
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('�ۼ��� ����')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='diaryView.jsp'");
						script.println("</script>");
					}
					
				}
			}
	
	%>

</body>
</html>