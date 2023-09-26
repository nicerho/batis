<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파법창</title>
</head>
<body>
데이터 출력 리스트<br>
<span onclick="datacall()">ㅋㅋㅋ</span>
</body>
<script>
function datacall(){
	//window.opener.f.m.value = "ㅋㅋㅋㅋ";
	parent.window.postMessage({msg:"ㅋㅋㅋ"},"*");
	self.close();
}
</script>
</html>