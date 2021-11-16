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
	<fieldset>						<!-- 정현수 - 로그인 -->
		<legend> 로그인 </legend>
		<ul>
			<form action="loginServiceCon.do" method="post">
				<li><input type="text" name="member_id" placeholder="ID를 입력하세요"></li>
				<li><input type="password" name="member_pwd" placeholder="PW를 입력하세요"></li>
				<input type="submit" value="로그인" class="button fit">
			</form>
		</ul>
	</fieldset>
	<% if(info != null) {%>			<!-- 정현수 - 로그아웃 -->
			<a href="logoutServiceCon.do"> 로그아웃 </a>
		<%}else{ %>
	<%} %>
</body>
</html>