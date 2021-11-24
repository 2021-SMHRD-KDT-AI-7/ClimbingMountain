<%@page import="java.io.PrintWriter"%>
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
		String member_id = (String) session.getAttribute("member_id");
		System.out.println("member_id :"+ member_id);
		
		int community_seq = Integer.parseInt(request.getParameter("community_seq"));
		System.out.println("community_seq :"+ community_seq);
		
		if(community_seq == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� �ʴ� ���Դϴ�')");
			script.println("location.href='communityView.jsp'");
			script.println("</script>");
		}
		communityDTO dto = new communityDAO().viewOneBoard(community_seq);

	%>

	<div id="board">
		<table id="list">
			<tr>
				<td>����</td>
				<td><%= dto.getCommunity_subject() %></td>
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td><%= dto.getMember_id()%></td>
			</tr>
			<tr>
				 <td colspan="2"> <a href="file/<%= dto.getCommunity_file1() %>" download> ����1 �ٿ�ε� </a> </td>
				 <td colspan="2"> <a href="file/<%= dto.getCommunity_file2() %>" download> ����2 �ٿ�ε� </a> </td>
				 <td colspan="2"> <a href="file/<%= dto.getCommunity_file3() %>" download> ����3 �ٿ�ε� </a> </td>
			</tr>
			<tr>
				<td colspan="2">����</td>
				<td><%= dto.getCommunity_content() %> <br>
			</tr>
			<tr>
				<td colspan="2"><img src="file/<%= dto.getCommunity_file1() %>">
				<td><img src="file/<%= dto.getCommunity_file2() %>">
				<td><img src="file/<%= dto.getCommunity_file3() %>"></td>
			</tr>
			<tr>
				
			</tr>
		</table>
				<td colspan="2"><a href="communityview.jsp"><button>���</button></a></td>
				<%
					if(member_id != "" && member_id.equals(dto.getMember_id())){
				%>
					<td colspan="2"><a href="CommunityUpdate.jsp?community_seq=<%= community_seq %>"><button>����</button></a></td>
					<td colspan="2"><a href="communityDeleteOne.jsp?community_seq=<%= community_seq %>"><button>����</button></a></td>
				<%
					}
				%>
				
	</div>

</body>
</html>