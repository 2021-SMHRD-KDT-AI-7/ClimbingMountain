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
	<%
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	%>
	<fieldset>						<!-- ������ - �α��� -->
		<legend> �α��� </legend>
		<ul>
			<form action="loginServiceCon.do" method="post">
				<li><input type="text" name="member_id" placeholder="ID�� �Է��ϼ���"></li>
				<li><input type="password" name="member_pwd" placeholder="PW�� �Է��ϼ���"></li>
				<input type="submit" value="�α���" class="button fit">
			</form>
		</ul>
	</fieldset>
	<% if(info != null) {%>			<!-- ������ - �α׾ƿ� -->
			<a href="logoutServiceCon.do"> �α׾ƿ� </a>
		<%}else{ %>
	<%} %>
</body>
</html>