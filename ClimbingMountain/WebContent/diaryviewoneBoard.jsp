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
			script.println("alert('유효하지 않는 글입니다')");
			script.println("location.href='diaryView.jsp'");
			script.println("</script>");
		}
		DiaryDTO dto = new DiaryDAO().viewOneBoard(diary_seq);

	%>

	<div id="board">
		<table id="list">
			<tr>
				<td>제목</td>
				<td><%= dto.getDiary_subject() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%= dto.getMember_id()%></td>
			</tr>
			<tr>
				 <td colspan="2"> <a href="file/<%= dto.getDiary_file1() %>" download> 파일1 다운로드 </a> </td>
				 <td colspan="2"> <a href="file/<%= dto.getDiary_file2() %>" download> 파일2 다운로드 </a> </td>

			</tr>
			<tr>
				<td colspan="2">내용</td>
				<td><%= dto.getDiary_content() %> <br>
			</tr>
			<tr>
				<td colspan="2"><img src="file/<%= dto.getDiary_file1() %>">
				<td><img src="file/<%= dto.getDiary_file2() %>">
			</tr>
			<tr>
				
			</tr>
		</table>
				<td colspan="2"><a href="diaryView.jsp"><button>목록</button></a></td>
				<td colspan="2"><a href="diaryUpdate.jsp?diary_seq=<%= diary_seq %>"><button>수정</button></a></td>
				<td colspan="2"><a href="diaryDeleteOne.jsp?diary_seq=<%= diary_seq %>"><button>삭제</button></a></td>	
	</div>


</body>
</html>