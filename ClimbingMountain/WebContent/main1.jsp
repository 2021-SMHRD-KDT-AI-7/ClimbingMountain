<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
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
</body>
</html>