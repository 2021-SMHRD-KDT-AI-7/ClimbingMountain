<%@page import="Model.Course_2_DTO"%>
<%@page import="Model.Course_1_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Course_2_DAO"%>
<%@page import="Model.Course_1_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	int seq = Integer.parseInt(request.getParameter("mountain_seq"));
	Course_1_DAO one_dao = new Course_1_DAO();
	Course_2_DAO two_dao = new Course_2_DAO();
	
	ArrayList<Course_1_DTO> one_list = one_dao.selectCourse(seq);
	ArrayList<Course_2_DTO> two_list = two_dao.selectCourse(seq);
%>
<body>
	<div>
	산 시퀀스 : <%= seq %>
	등산로수 : <%= one_list.size()%>
	</div>

	<table border="1">
		<tr>
			<td>등산로 이름</td>
			<td>등산로 설명</td>
			<td>등산로 설명 이미지</td>
			<td>차 교통수단</td>
			<td>버스 교통수단</td>
			<td>기차 교통수단</td>
		<tr>
		<%
		for (int i = 0; i < one_list.size(); i++) {%>
		<tr>
			<td><a href='CourseDetailView.jsp?course_seq=<%=one_list.get(i).getCourse_seq()%>'> <%= one_list.get(i).getCourse_name()%></a></td>
			<td><%= one_list.get(i).getCourse_exp()%></td>
			<td><img src='<%= one_list.get(i).getCourse_exp_img()%>'></td>




			<% String[] car = two_list.get(i).getCar().split("◈"); %>
			<td>
			<% for(int c = 0; c<car.length;c++){ 	%>
				<p><%= car[c]  %></p>
			<%} %>
			
			</td>
			
			
			<% String[] bus = two_list.get(i).getBus().split("◈"); %>
			<td>
			<% for(int b = 0; b<car.length;b++){ 	%>
				<p><%= car[b]  %></p>
			<%} %>
			
			</td>
			
			
			<% String[] train = two_list.get(i).getTrain().split("◈"); %>
			<td>
			<% for(int t = 0; t<car.length;t++){ 	%>
				<p><%= car[t]  %></p>
			<%} %>
			
			</td>
			
			

		</tr>
		<%
			}
		%>
	</table>
</body>
</html>