<%@page import="Model.Mountain100_2_DTO"%>
<%@page import="Model.Mountain100_2_DAO"%>
<%@page import="Model.Mountain100_1_DTO"%>
<%@page import="Model.Mountain100_1_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%	Mountain100_1_DAO one_dao = new Mountain100_1_DAO(); 
	Mountain100_2_DAO two_dao = new Mountain100_2_DAO(); 	
	
	
	
	int mountain_seq = Integer.parseInt(request.getParameter("mountain_seq"));
	System.out.print(mountain_seq);
	Mountain100_1_DTO one_dto = one_dao.selectOneMountaion100(mountain_seq);
	
	System.out.print(one_dto);
	
	Mountain100_2_DTO two_dto = two_dao.selectOneMountaion100(mountain_seq);
	System.out.print(two_dto);
	
%>
<body>
	<h2> �� �̸� :<%= one_dto.getMountain_name() %> </h2>
	<h4> ������� : <%= one_dto.getMountain_seq() %></h4>
	<h4> ��ġ : <%= one_dto.getMountain_location() %></h4>
	<h4> �� ���� : <%= one_dto.getMountain_height() %></h4>
	<h4> ���ð� :  <%= one_dto.getMountain_time() %></h4>
	<h4> ��õ ���� : <%= one_dto.getMountain_season() %></h4>
	<h4> ���̵� : <%= one_dto.getDifficulty()%></h4>
	
	<h4> Ư¡ �� �������� </h4>
	<%= two_dto.getReason() %>
	
	<h4> ����  </h4>
	<%= two_dto.getServey() %>
	
	<h4> ����  </h4>
	<%= two_dto.getInformation() %>
	<hr>
	
	<a href = "CourseView.jsp?mountain_seq=<%=one_dto.getMountain_seq()%>"><button>���� ���� Ȯ���ϱ�</button></a>
	
	
	
	
	<div></div>

</body>
</html>