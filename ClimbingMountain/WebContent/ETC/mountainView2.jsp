<%@page import="Model.MountainDAO"%>
<%@page import="Model.MountainDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
MountainDAO dao = new MountainDAO();
ArrayList<MountainDTO> list = new ArrayList<>();
%>
<!-- �¿� - 11/18 ���� 12�� 30�� �ۼ� ���� --> 
<body>
	<%
	
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	list = dao.selectMountain(search);
	%>
	
	<h4> �˻��� : <%=search%>   		</h4>
	<h4>����� : <%= list.size()%>	</h4>
	<br>
	<h2>�˻����</h2>
	<table border="1">
		<tr>
			<th>����</th>
			<th>�� �̸�</th>
			<th>���� �̸�</th>
			<th>���� ����</th>
			<th>���� ����</th>
			<th>���� ���̵�</th>
			<th>���� ����ð�</th>
			<th>���� ����ð�</th>
			
		</tr>

		<%
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
		<td> <%= i+1 %> </td>
		<td><%=list.get(i).getMntn_nm()%></td>
		<td><%=list.get(i).getPmntn_nm()%></td>
		<td><%=list.get(i).getPmntn_main()%></td>
		<td><%=list.get(i).getPmntn_lt()%></td>
		<td><%=list.get(i).getPmntn_dffl()%></td>
		<td><%=list.get(i).getPmntn_uppl()%></td>
		<td><%=list.get(i).getPmntn_godn()%></td>
		</tr>	
		
		<%
			}
		%>


	</table>

</body>
</html>
<!-- �¿� - 11/18 ���� 12�� 30�� �ۼ� ��` --> 