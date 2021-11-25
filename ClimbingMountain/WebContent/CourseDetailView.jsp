<%@page import="Model.Course_3_img_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Course_3_img_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	
	int seq = Integer.parseInt(request.getParameter("course_seq"));
	Course_3_img_DAO three_dao = new Course_3_img_DAO();
	ArrayList<Course_3_img_DTO> three_list = three_dao.selectCourse(seq);
	%>

<body>
	<% for(int i=0;i<three_list.size();i++){ %>
	<img src='<%= three_list.get(i).getCourse_img()%>'>
	<p><%= three_list.get(i).getCourse_name()%></p>
	<% } %>

</body>
</html>