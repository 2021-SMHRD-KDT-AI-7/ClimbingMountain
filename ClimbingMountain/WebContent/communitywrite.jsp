<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="communityServiceCon" method="post" enctype="multipart/form-data">
	���� : <input type="text" name="community_subject";> <br>
	���� : <input type="text" name="community_content";><br>
	����1 : <input type="file" name="community_file1";><br>
	����2 : <input type="file" name="community_file2";><br>
	����3 : <input type="file" name="community_file3";><br>
	<input type="submit" value="����">

</body>
</html>