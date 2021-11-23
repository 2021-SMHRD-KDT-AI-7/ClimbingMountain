<%@page import="Model.Mountain100_1_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Mountain100_1_DAO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<% 	Mountain100_1_DAO dao = new Mountain100_1_DAO(); 
	ArrayList<Mountain100_1_DTO> m_list = new ArrayList<>();   %>
<body>

	<button>
		<a href="diaryView.jsp">다이어리 게시판</a>
	</button>
	<button>
		<a href="communityview.jsp">커뮤니티 게시판</a>
	</button>
	<hr>
	<form action ="mountainView1.jsp" method = "post">
	<div>검색 : 
	<input name = "search" type ="text" >
	<input type ="submit" value = "입력">
	</div>
	</form>
	<hr>
	<h2>산 정보</h2>
	
	<%  m_list = dao.selectuseMountain100_1();
		for(int i =0;i<m_list.size();i++){%>
	<div><a href="MountainView.jsp?mountain_seq=<%= m_list.get(i).getMountain_seq()%>" ><%= m_list.get(i).getMountain_name()  %>  </a></div>
	<% } %>
	
</body>
</html>