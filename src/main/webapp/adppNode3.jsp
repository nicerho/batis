<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<form method="post" id="f" action="http://localhost:9090/" onsubmit="return abc()">
인증번호 : <input type="text" name="no" id="no">
<input type="submit" value="전송">
</form>
<script>
function abc(){
	f.submit();
}
</script>
</body>
</html>