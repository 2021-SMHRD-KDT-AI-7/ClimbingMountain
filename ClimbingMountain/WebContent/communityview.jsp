<%@page import="java.util.ArrayList"%>
<%@page import="Model.communityDTO"%>
<%@page import="Model.communityDAO"%>
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
	communityDAO community_dao = new communityDAO();
	ArrayList<communityDTO> communityBoard_list = new ArrayList<>(); 
	communityBoard_list = community_dao.viewBoard();
	
	

%>

	<table border="1">
	<tr>
		<th><b>��ȣ</b></th>
		<th colspan = "1"><b>����</b></th>
		<th><b>�ۼ���</b></th>
		<th><b>��ȸ��</b></th>
		<th><b>�ۼ���</b></th>
	</tr>
	
	<% //��ȣ ���� (���) �ۼ��� �ۼ��� (��ȸ��)(��õ��)
	//        ���� 
	for(int i=0;i<communityBoard_list.size();i++){   %>
	<tr>
		<td><%= i+1 %></td>
		<td><a href="communityViewOneBoard.jsp?community_seq=<%= communityBoard_list.get(i).getCommunity_seq() %>"><%= communityBoard_list.get(i).getCommunity_subject() %></td>
		<td><%= communityBoard_list.get(i).getReg_date() %></td>
		<td><%= communityBoard_list.get(i).getCommunity_cnt()%></td>
		<td><%= communityBoard_list.get(i).getMember_id() %></td>

	</tr>
	
	<% } %>
	</table>

	<div>
	
	</div>
	<hr>
	<button><a href = "communitywrite.jsp">Ŀ�´�Ƽ ���ۼ�</a></button>

</body>
</html>