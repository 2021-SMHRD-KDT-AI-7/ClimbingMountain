<%@page import="Model.DiaryDAO"%>
<%@page import="Model.DiaryDTO"%>
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
	System.out.println("����������");
	String member_id = (String) session.getAttribute("member_id");
	System.out.println("member_id :"+ member_id);
	int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
	System.out.println("diary_seq :"+ diary_seq);
	
	if(diary_seq == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� �ʴ� ���Դϴ�')");
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
	}
	
%>
	<form action="DupdateAction.jsp?member_id = <%= member_id %>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="diary_seq" value="<%= diary_seq%>">
	���� : <input type="text" name="diary_subject";> <br>
	���� : <input type="text" name="diary_content";><br>
	����1 : <input type="file" name="diary_file1";><br>
	����2 : <input type="file" name="diary_file2";><br>
	<input type="submit" value="�����ϱ�">
	</form>
</body>
</html>