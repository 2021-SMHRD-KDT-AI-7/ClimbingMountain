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
	
	<fieldset>						<!-- 정현수 - 회원가입 -->
		<legend>회원가입</legend>
		<ul>
			<form action="JoinServiceCon.do" method="post">
				<li><input type="text" name="member_id" placeholder="ID를 입력하세요"></li>
				<li><input type="password" name="member_pwd" placeholder="PW를 입력하세요"></li>
				<li><input type="text" name="member_name" placeholder="이름을 입력하세요"></li>
				<li><input type="text" name="member_addr" placeholder="주소를 입력하세요"></li>
				<li><input type="number" name="member_age" placeholder="나이를 입력하세요"></li>
				<li><input type="text" name="member_health" placeholder="건강상태를 입력하세요"></li>
				<li>남<input type="radio" name="member_gender" value="M">여<input type="radio" name="member_gender" value="F"></li>
				<li><input type="number" name="member_career" placeholder="등산경력을 입력하세요"></li>
				<li><input type="text" name="admin_yn" placeholder="관리자 유무(나중에 지우기)"></li>

				<input type="submit" value="회원가입" class="button fit">
			</form>
		</ul>
	</fieldset>
	
	<% if(info != null) {%>			<!-- 정현수 - 로그아웃 -->
			<a href="logoutServiceCon.do"> 로그아웃 </a>
		<%}else{ %>
	<%} %>

</body>
</html>