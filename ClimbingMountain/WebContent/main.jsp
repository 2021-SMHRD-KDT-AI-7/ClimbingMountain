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
	
	<fieldset>						<!-- ������ - ȸ������ -->
		<legend>ȸ������</legend>
		<ul>
			<form action="JoinServiceCon.do" method="post">
				<li><input type="text" name="member_id" placeholder="ID�� �Է��ϼ���"></li>
				<li><input type="password" name="member_pwd" placeholder="PW�� �Է��ϼ���"></li>
				<li><input type="text" name="member_name" placeholder="�̸��� �Է��ϼ���"></li>
				<li><input type="text" name="member_addr" placeholder="�ּҸ� �Է��ϼ���"></li>
				<li><input type="number" name="member_age" placeholder="���̸� �Է��ϼ���"></li>
				<li><input type="text" name="member_health" placeholder="�ǰ����¸� �Է��ϼ���"></li>
				<li>��<input type="radio" name="member_gender" value="M">��<input type="radio" name="member_gender" value="F"></li>
				<li><input type="number" name="member_career" placeholder="������� �Է��ϼ���"></li>
				<li><input type="text" name="admin_yn" placeholder="������ ����(���߿� �����)"></li>

				<input type="submit" value="ȸ������" class="button fit">
			</form>
		</ul>
	</fieldset>
	
	<% if(info != null) {%>			<!-- ������ - �α׾ƿ� -->
			<a href="logoutServiceCon.do"> �α׾ƿ� </a>
		<%}else{ %>
	<%} %>

</body>
</html>