<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="DiaryOneServiceCon" method="post" enctype="multipart/form-data">
	���� : <input type="text" name="diary_subject";> <br>
	���� : <input type="text" name="diary_content";><br>
	����1 : <input type="file" name="diary_file1";><br>
	����2 : <input type="file" name="diary_file2";><br>
	<input type="submit" value="����">

</body>
</html>