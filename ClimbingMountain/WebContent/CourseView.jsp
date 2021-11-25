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
	�� ������ : <%= seq %>
	���μ� : <%= one_list.size()%>
	</div>

	<table border="1">
		<tr>
			<td>���� �̸�</td>
			<td>���� ����</td>
			<td>���� ���� �̹���</td>
			<td>�� �������</td>
			<td>���� �������</td>
			<td>���� �������</td>
		<tr>
		<%
		for (int i = 0; i < one_list.size(); i++) {%>
		<tr>
			<td><a href='CourseDetailView.jsp?course_seq=<%=one_list.get(i).getCourse_seq()%>'> <%= one_list.get(i).getCourse_name()%></a></td>
			<td><%= one_list.get(i).getCourse_exp()%></td>
			<td><img src='<%= one_list.get(i).getCourse_exp_img()%>'></td>

			<td><%= two_list.get(i).getCar()%></td>
			<td><%= two_list.get(i).getBus()%></td>
			<td><%= two_list.get(i).getTrain()%></td>

		</tr>
		<%
			}
		%>
	</table>
</body>
</html>