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
		<th><b>번호</b></th>
		<th colspan = "1"><b>제목</b></th>
		<th><b>작성일</b></th>
		<th><b>조회수</b></th>
		<th><b>작성자</b></th>
	</tr>
	
	<% //번호 내용 (댓글) 작성자 작성일 (조회수)(추천수)
	//        제목 
	for(int i=0;i<communityBoard_list.size();i++){   %>
	<tr>
		<td><%= i+1 %></td>
		<td><a href="communityViewOneBoard.jsp?community_seq=<%= communityBoard_list.get(i).getCommunity_seq() %>"><%= communityBoard_list.get(i).getCommunity_subject() %></td>
		<td><%= communityBoard_list.get(i).getReg_date() %></td>
		<td><%= communityBoard_list.get(i).getCommunity_cnt() %></td>
		<td><%= communityBoard_list.get(i).getMember_id() %></td>

	</tr>
	
	<% } %>
	</table>
	<div>
	<%
		for(int i=1;i<=2;i++){
			out.print(i+" ");
		}
	%>
	</div>
	<hr>
	<button><a href = "communitywrite.jsp">커뮤니티 글작성</a></button>

</body>
</html>