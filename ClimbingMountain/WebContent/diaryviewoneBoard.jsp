<%@page import="Model.DiaryDAO"%>
<%@page import="Model.DiaryDTO"%>
<%@page import="java.io.PrintWriter"%>
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
		
		int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
		System.out.println("diary_seq :"+ diary_seq);
		
		if(diary_seq == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� �ʴ� ���Դϴ�')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}
		DiaryDTO dto = new DiaryDAO().viewOneBoard(diary_seq);

	%>

	<div id="board">
		<table id="list">
			<tr>
				<td>����</td>
				<td><%= dto.getDiary_subject() %></td>
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td><%= dto.getMember_id()%></td>
			</tr>
			<tr>
				 <td colspan="2"> <a href="file/<%= dto.getDiary_file1() %>" download> ����1 �ٿ�ε� </a> </td>
				 <td colspan="2"> <a href="file/<%= dto.getDiary_file2() %>" download> ����2 �ٿ�ε� </a> </td>

			</tr>
			<tr>
				<td colspan="2">����</td>
				<td><%= dto.getDiary_content() %> <br>
			</tr>
			<tr>
				<td colspan="2"><img src="file/<%= dto.getDiary_file1() %>">
				<td><img src="file/<%= dto.getDiary_file2() %>">
			</tr>
			<tr>
				
			</tr>
		</table>
				<td colspan="2"><a href="diaryView.jsp"><button>���</button></a></td>
				<td colspan="2"><a href="diaryUpdate.jsp?diary_seq=<%= diary_seq %>"><button>����</button></a></td>
				<td colspan="2"><a href="diaryDeleteOne.jsp?diary_seq=<%= diary_seq %>"><button>����</button></a></td>	
	</div>


</body>
</html>