<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
</head>
<style>
.step {
	height: 50px;
	background-color: gray;
	text-align: left;
	font-weight: 900;
}

.tr {
	height: 35px;
	background-color: whitesmoke;
}

.input_name {
	text-align: right;
}

#submit {
	text-align: center;
}

#diary_table {
	width: 400px;
}
</style>


<body>
	<form action="DiaryOneServiceCon.do" method="post">
		<table id="diary_table">
			<!-- Step1 -->
			<tr class="step">
				<th colspan="2">Diary</th>
				<th></th>
			</tr>

			<tr class="tr">
				<td class="input_name">제목</td>
				<td><input type="text" name="diary_subject"></td>
			</tr>



			<!-- Step2 -->
			<tr class="step">
				<td colspan="2">내용</td>
			</tr>

			<tr>
				<td colspan="2"><textarea name="diary_content" cols="60"
						rows="5"></textarea></td>
			</tr>

			<tr class="tr">
				<td class="input_name">파일1</td>
				<td><input id="diary_file1" type="text"></input>
					<button>upload</button></td>
			</tr>

			<tr class="tr">
				<td class="input_name">파일2</td>
				<td><input id="diary_file2" type="text"></input>
					<button>upload</button></td>
			</tr>
			<tr>

				<td id="submit" colspan="2"><input type="submit" value="제출">
					<input type="reset" value="초기화">
					<button>
						<a href="diaryView.jsp">게시판</a>
					</button></td>
			</tr>
		</table>
	</form>
</body>
</html>