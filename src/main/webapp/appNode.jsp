<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노드서버 통신</title>
</head>
<body>
아이디 : <input type="text" name="mid" id="mid">
<input type="button" value="중복체크" onclick="abc()">
</body>
<script>
function abc(){
	var mid = document.getElementById("mid");
	location.href = "http://localhost:9090/?mid="+mid.value+"&mname=testname";
}
</script>
</html>