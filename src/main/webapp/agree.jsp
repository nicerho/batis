<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.agree{
width: 600px;
height:150px;
border:1px solid black;
overflow-y:auto;
overflow-x:none;
}
</style>
<body>
<p>이용약관</p>
<div class="agree" id="agree1">
</div>
<p>개인정보 약관</p>
<div class="agree" id="agree2">
</div>
</body>

<script>
var agree = function(f){
	var http = new XMLHttpRequest();
	http.open("GET",f,false);
	http.send;
	return http.response;
}
document.getElementById("agree1").innerHTML = agree("./agree1.txt");
document.getElementById("agree2").innerHTML = agree("./agree2.txt");
</script>


</html>