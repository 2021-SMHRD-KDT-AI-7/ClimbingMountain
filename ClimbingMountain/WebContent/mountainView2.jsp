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


<body>
	<%
	MountainDAO dao = new MountainDAO();
	ArrayList<MountainDTO> list = new ArrayList<>();
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	list = dao.selectMountain(search);
	%>
	
	<h4> 검색어 : <%=search%>   		</h4>
	<h4>결과수 : <%= list.size()%>	</h4>
	<br>
	<h2>검색결과</h2>
	<table border="1">
		<tr>
			<th>순번</th>
			<th>산 이름</th>
			<th>등산로 이름</th>
			<th>등산로 설명</th>
			<th>등산로 길이</th>
			<th>등산로 난이도</th>
			<th>등산로 상행시간</th>
			<th>등산로 하행시간</th>
			
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
