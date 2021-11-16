<%@page import="Model.MountaincodeDTO"%>
<%@page import="Model.MountaincodeDAO"%>
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
	MountaincodeDAO moutaincode_dao = new MountaincodeDAO();
	ArrayList<MountaincodeDTO> mountain_list = new ArrayList<>();
%>
<body>
	<%
	request.setCharacterEncoding("EUC-KR");
	String mountain_name = request.getParameter("mountain_name");

	mountain_list = moutaincode_dao.selectMountaincode(mountain_name);
	%>
	
	<h4> 검색어 : <%=mountain_name%>   		</h4>
	<h4>결과수 : <%= mountain_list.size()%>	</h4>
	<br>
	<h2>검색결과</h2>
	<table border="1">
		<tr>
			<th>순번</th>
			<th>이름</th>
			<th>위치</th>
			<th>코드</th>
		</tr>

		<%
			for (int i = 0; i < mountain_list.size(); i++) {
		%>
		<tr>
		<td> <%= i+1 %> </td>
		<td><%=mountain_list.get(i).getMountaincode_name()%></td>
		<td><%=mountain_list.get(i).getMountaincode_location()%></td>
		<td><%=mountain_list.get(i).getMountaincode_code()%></td>
		</tr>	
		<%
			}
		%>


	</table>

</body>
</html>