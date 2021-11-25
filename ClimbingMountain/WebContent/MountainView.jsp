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
	<h2> 산 이름 :<%= one_dto.getMountain_name() %> </h2>
	<h4> 산시퀀스 : <%= one_dto.getMountain_seq() %></h4>
	<h4> 위치 : <%= one_dto.getMountain_location() %></h4>
	<h4> 산 높이 : <%= one_dto.getMountain_height() %></h4>
	<h4> 등산시간 :  <%= one_dto.getMountain_time() %></h4>
	<h4> 추천 계절 : <%= one_dto.getMountain_season() %></h4>
	<h4> 난이도 : <%= one_dto.getDifficulty()%></h4>
	
	<h4> 특징 및 선정이유 </h4>
	<%= two_dto.getReason() %>
	
	<h4> 개관  </h4>
	<%= two_dto.getServey() %>
	
	<h4> 정보  </h4>
	<%= two_dto.getInformation() %>
	<hr>
	
	<a href = "CourseView.jsp?mountain_seq=<%=one_dto.getMountain_seq()%>"><button>등산로 정보 확인하기</button></a>
	
	
	
	
	<div></div>

</body>
</html>