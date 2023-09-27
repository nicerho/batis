<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
</head>
<style>
.btn {
	width: 100px;
	height: 30px;
	display: inline-block;
	background-color: black;
	color: white;
	line-height: 30px;
	text-align: center;
	vertical-align: -30px;
	cursor: pointer;
}

.input {
	display: inline-block;
}
</style>
<body>
	<form id="f">
		아이디 : <input type="text" name="mid" id="mid" class="input"> <span
			class="btn" onclick="ajaxLoad()">아이디 중복 체크</span>
	</form>
</body>
<script>
	function ajaxLoad() {
		var id = document.getElementById("mid");
		if (id.value == "") {
			alert("ID입력은 필수")
		} else {
			var http = new XMLHttpRequest();
			http.onreadystatechange = function() {
				if (http.readyState == XMLHttpRequest.DONE
						&& http.status == 200) {
					var result = this.response;
					//yes : 중복 no : 가능 error : 오류
					if (result == "no") {
						confirm("use?")
					} else if (result == "yes") {
						alert("현재 사용중인 아이디입니다")
					}
				}
			}
			http.open("post", "http://192.168.110.214:8080/batis/idcheck.do", true);//비동기통신
			http.setRequestHeader("content-type",
					"application/x-www-form-urlencoded");
			http.send("userid=" + id.value);
		}

	}
</script>
</html>