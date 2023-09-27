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
<span onclick="datacall('ㅋㅋㅋ')">ㅋㅋㅋ</span>
<span onclick="datacall('ㅎㅎㅎ')">ggg</span>
<span onclick="datacall('ㅂㅂㅂ')">qqq</span>
</body>
<script>
function datacall(a){
	//postMessage() : 서로 다른 도메인에 한하여 배열 형태로 데이터를 보내는 함수
	/*
	postMessage(배열값,"상대 ip주소 또는 도메인" * 는 모든곳에서의 접속 혀용)
	*/
	parent.window.postMessage({msg:a},"*");
}
</script>
</html>