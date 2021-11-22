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
	
	 String strPg = request.getParameter("pg");
	 int rowSize = 10;	//1�������� ������ �Խñ۰���
	 int pg = 1;	//�Խñ�1������
	 
	 if(strPg != null){
		 pg = Integer.parseInt(strPg);
	 }
	 
	 int to =(pg * rowSize);
	 int from = to - (rowSize - 1);
	 
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
		<td><%= communityBoard_list.get(i).getCommunity_seq() %></td>
		<td><a href="communityViewOneBoard.jsp?community_seq=<%= communityBoard_list.get(i).getCommunity_seq() %>"><%= communityBoard_list.get(i).getCommunity_subject() %></td>
		<td><%= communityBoard_list.get(i).getReg_date() %></td>
		<td><%= communityBoard_list.get(i).getCommunity_cnt() %></td>
		<td><%= communityBoard_list.get(i).getMember_id() %></td>

	</tr>
	
	<% } %>
	</table>
	<hr>
	<button><a href = "communitywrite.jsp">Ŀ�´�Ƽ ���ۼ�</a></button>

</body>
</html>