<%@page import="Model.DiaryDAO"%>
<%@page import="Model.DiaryDTO"%>
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
	DiaryDAO diary_dao = new DiaryDAO();
	ArrayList<DiaryDTO> DiaryBoard_list = new ArrayList<>(); 
	DiaryBoard_list = diary_dao.getAllDiary();
%>

<body>

	<table border="1">
	<tr>
		<th><b>��ȣ</b></th>
		<th colspan = "3"><b>����</b></th>
		<th><b>�ۼ���</b></th>
		<th><b>�ۼ���</b></th>
		<th><b>�ۼ���</b></th>
	</tr>
	
	<% //��ȣ ���� (���) �ۼ��� �ۼ��� (��ȸ��)(��õ��)
	//        ���� 
	for(int i=0;i<DiaryBoard_list.size();i++){   %>
	<tr>
		<td><%= DiaryBoard_list.get(i).getDiary_seq() %></td>
		<td><%= DiaryBoard_list.get(i).getDiary_subject() %></td>
		<td><%= DiaryBoard_list.get(i).getDiary_content() %></td>
		<td><%= DiaryBoard_list.get(i).getReg_date() %></td>
		<td><%= DiaryBoard_list.get(i).getMember_id()%></td>
		<td><%= DiaryBoard_list.get(i).getDiary_file1()%></td>
		<td><%= DiaryBoard_list.get(i).getDiary_file2()%></td>
	</tr>
	
	<% } %>
	</table>
	<hr>
	<button><a href = "diaryInput.jsp">���ۼ�</a></button>
</body>
</html>