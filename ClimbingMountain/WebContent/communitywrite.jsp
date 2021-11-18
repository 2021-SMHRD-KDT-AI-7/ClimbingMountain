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
	제목 : <input type="text" name="comm_title";> <br>
	내용 : <input type="text" name="comm_content";><br>
	파일1 : <input type="file" name="file1";><br>
	파일2 : <input type="file" name="file2";><br>
	파일3 : <input type="file" name="file3";><br>
	<input type="submit" value="전송">

</body>
</html>