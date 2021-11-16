<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

           @import url('https://fonts.googleapis.com/css2?family=Cute+Font&display=swap');
        legend{
       		text-align : center;		 
            color : blueviolet;
           	font-size : 50px;
            /*font-weight: 600;*/
            font-family: 'Cute Font', cursive;   /*구글폰트*/
            font-style : italic;
        }
        ui{
        	text-align : center;
        }
    
</style>
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