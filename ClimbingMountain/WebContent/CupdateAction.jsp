<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="Model.communityDAO"%>
<%@page import="Model.communityDTO"%>
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
		System.out.println("�����Ϸ�������");
		String member_id = null;
		if(session.getAttribute("member_id") != null){
			 member_id = (String) session.getAttribute("member_id");
		}
		if(member_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int maxSize = 1024*1024*10;  // 10MB
		String encoding = "EUC-KR";
		String saveDirectory = request.getServletContext().getRealPath("file");
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
		String community_seq1 = multi.getParameter("community_seq");
		System.out.println(community_seq1);
		
		int community_seq = 0;
		if(multi.getParameter("community_seq") != null){
			community_seq = Integer.parseInt(multi.getParameter("community_seq"));
		}
		System.out.println("community_seq :"+ community_seq);
		if(community_seq == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� ���Դϴ�')");
			script.println("location.href='communityView.jsp'");
			script.println("</script>");
		}
			communityDTO dto = new communityDAO().viewOneBoard(community_seq);
			if(!member_id.equals(dto.getMember_id())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ �����ϴ�')");
				script.println("location.href='communityView.jsp'");
				script.println("</script>");
			}else{
				if(multi.getParameter("community_subject") == null || multi.getParameter("community_content") == null
						|| multi.getFilesystemName("community_file1") == null || multi.getFilesystemName("community_file2") == null 
						|| multi.getFilesystemName("community_file3") == null || multi.getParameter("community_subject").equals("") 
						|| multi.getParameter("community_content").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�Էµ������� ������ �ֽ��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					communityDAO dao = new communityDAO();
					int result = dao.updateCommunity(community_seq, multi.getParameter("community_subject"),multi.getParameter("community_content"),
							multi.getFilesystemName("community_file1"),multi.getFilesystemName("community_file2"),multi.getFilesystemName("community_file3"));
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('�ۼ��� ����')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='communityview.jsp'");
						script.println("</script>");
					}
					
				}
			}
			
		
				
				


		
	%>

</body>
</html>