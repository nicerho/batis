<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 기능 적용</title>
</head>
<body>
	<form id="f" method="post" action="./fileUpload" enctype="multipart/form-data">
		File : <input type="file" name="mfile" multiple="multiple"><br> <input
			type="button" value="전송" onclick="abc()">
	</form>
</body>
<script>
function abc(){
	f.submit();
}
</script>
</html>