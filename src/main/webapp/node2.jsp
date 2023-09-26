<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS Node2 각종 입력 사항</title>
</head>
<body>
	<div id="filediv">
		파일첨부 : <input type="file" name="mfile">
	</div>
	<input type="button" value="파일첨부 추가" onclick="plus()">
</body>
<script>
	var code = document.getElementById("filediv");
	function plus() {
		var ea = code.children.length;
		if (ea < 4) {
			var html = document.createElement("input");
			html.type="file";
			html.name="mfile";
			html.className="test";
			code.append(html);
		}
	}
</script>
</html>