<%@page import="Model.MemberDAO"%>
<%@page import="Model.DAO"%>
<%@page import="Model.MemberDTO"%>
<%@page import="java.io.PrintWriter"%>
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
	String member_id = null;
	if (session.getAttribute("member_id") != null) {
		member_id = (String) session.getAttribute("member_id");
	}
	MemberDTO mdto = (MemberDTO) session.getAttribute("info");
	MemberDAO dao = new MemberDAO();

	DiaryDAO DiaryDAO = new DiaryDAO();
	ArrayList<DiaryDTO> d_list = new ArrayList<>();
	if (mdto != null) {
		d_list = DiaryDAO.viewBoard(mdto.getMember_id());
	}
%>

<body>

	<table border="1">
		<tr>
			<th><b>��ȣ</b></th>
			<th colspan="1"><b>����</b></th>
			<th><b>�ۼ���</b></th>
		</tr>

		<%
			//��ȣ ���� (���) �ۼ��� �ۼ���(��õ��)
		//        ���� 
		for (int i = 0; i < d_list.size(); i++) {
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><a
				href="diaryviewoneBoard.jsp?diary_seq=<%=d_list.get(i).getDiary_seq()%>"><%=d_list.get(i).getDiary_subject()%></td>
			<td><%=d_list.get(i).getReg_date()%></td>

		</tr>
		<%
			}
		%>
	</table>
	<hr>
	<button>
		<a href="diarywrite.jsp">Ŀ�´�Ƽ ���ۼ�</a>
	</button>

</body>
</html>