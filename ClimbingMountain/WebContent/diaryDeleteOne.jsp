<%@page import="Model.DiaryDAO"%>
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
		System.out.println("[diaryDeleteOne.jsp]");

		String member_id = (String) session.getAttribute("member_id");
		System.out.println("member_id :" + member_id);

		int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
		System.out.println("diary_seq :" + diary_seq);

		if (member_id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α������ּ���')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}

		DiaryDAO dao = new DiaryDAO();
		int result = dao.deletediary(diary_seq);
		if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�ۻ��� ����')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��������')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}
	%>


</body>
</html>