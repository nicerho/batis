<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트출력</title>
</head>
<body>
<form id="f">
<input type="text" name="m" id="m"><br>
<input type="button" value="상품추가" onclick="popup()">
</form>
</body>
<script>
function popup(){
	window.open("./load.jsp","","width=500 height=500;");
}
</script>
</html>