<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naver Cloud SMS Service</title>
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
	if(f.tel.value==""){
		alert("연락처를 입력하세요");
	}else if(f.context.value==""){
		alert("내용을 입력하세요")
	}
	else{
		//전화번호 확인 정규식 코드
		let check = /[-_*@]/g;
		if(check.test(f.tel.value)==false){
			f.submit();
		}
	}
}
</script>
</html>