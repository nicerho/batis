<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="f" method="post" action="./smsok">
		연락처 : <input type="text" name="tel" id="tel" maxlength="11"><br>
		내용 : <input type="text" name="context" id="context"><br>
		<input type="button" value="발송" onclick="a()">
	</form>
</body>
<script>
function a(){
	var tel = document.getElementById("tel").value;
	var context = document.getElementById("context").value;
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState==XMLHttpRequest.DONE && http.status==200){
			console.log(http.response);
		}
	}
	http.open("POST","./smsok",true);
	http.setRequestHeader("content-type","application/x-www-from-urlencoded");
	http.send("tel="+tel+"&context="+context);
}
</script>
</html>