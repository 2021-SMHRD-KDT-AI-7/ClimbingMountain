<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>