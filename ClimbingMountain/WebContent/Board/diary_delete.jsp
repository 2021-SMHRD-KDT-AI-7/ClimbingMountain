<%@page import="Model.DiaryDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			script.println("alert('로그인해주세요')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}

		DiaryDAO dao = new DiaryDAO();
		int result = dao.deletediary(diary_seq);
		if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글삭제 실패')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제성공')");
			script.println("location.href='diary_list.jsp'");
			script.println("</script>");
		}
	%>



</body>
</html>