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
		<a href="diaryView.jsp">���̾ �Խ���</a>
	</button>
	<button>
		<a href="communityview.jsp">Ŀ�´�Ƽ �Խ���</a>
	</button>
	<hr>
	<form action ="mountainView1.jsp" method = "post">
	<div>�˻� : 
	<input name = "search" type ="text" >
	<input type ="submit" value = "�Է�">
	</div>
	
	</form>
</body>
</html>