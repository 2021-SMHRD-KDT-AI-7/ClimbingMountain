
<%@page import="Model.communityDAO"%>
<%@page import="Model.communityDTO"%>
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
		System.out.println("[communityDeleteOne.jsp]");

		String member_id = (String) session.getAttribute("member_id");
		System.out.println("member_id :"+ member_id);
		
		int community_seq = Integer.parseInt(request.getParameter("community_seq"));
		System.out.println("community_seq :"+ community_seq);

	if (member_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α������ּ���')");
		script.println("location.href='communityView.jsp'");
		script.println("</script>");
	}

		communityDAO dao = new communityDAO();
		int result = dao.deleteCommunity(community_seq);
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
			script.println("location.href='communityview.jsp'");
			script.println("</script>");
		}

	
	%>


</body>

</html>