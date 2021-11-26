<%@page import="java.io.PrintWriter"%>
<%@page import="Model.communityDAO"%>
<%@page import="Model.communityDTO"%>
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
	System.out.println("수정페이지");
	String member_id = (String) session.getAttribute("member_id");
	System.out.println("member_id :"+ member_id);
	int community_seq = Integer.parseInt(request.getParameter("community_seq"));
	System.out.println("community_seq :"+ community_seq);
	
	if(community_seq == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다')");
		script.println("location.href='./list.jsp'");
		script.println("</script>");
	}
	communityDTO dto = new communityDAO().viewOneBoard(community_seq);
	if(!member_id.equals(dto.getMember_id())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다2')");
		script.println("location.href='./list.jsp'");
		script.println("</script>");
	}
	
%>
	<form action="CupdateAction.jsp?member_id = <%= member_id %>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="community_seq" value="<%= community_seq%>">
	제목 : <input type="text" name="community_subject" value="<%= dto.getCommunity_subject() %>"> <br>
	내용 : <input type="text" name="community_content" value="<%= dto.getCommunity_content() %>"><br>
	파일1 : <input type="file" name="community_file1" value="<%= dto.getCommunity_file1() %>"><br>
	파일2 : <input type="file" name="community_file2" value="<%= dto.getCommunity_file2()  %>"><br>
	파일3 : <input type="file" name="community_file3" value="<%= dto.getCommunity_file3()  %>"><br>
	<input type="submit" value="수정하기">

</body>
</html>