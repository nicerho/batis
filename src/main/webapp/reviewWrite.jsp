<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 등록</title>
</head>
<body>
<form id="f" method="post" action="./dataInsert.do">
고객명 : <input type="text" name="rname"><br>
비밀번호 : <input type="password" name="rpw"><br>
본문 : <textarea cols="200" rows="4" name="rtext"></textarea><br>
<input type="submit" value="등록">
</form>
</body>
<script>
document.querySelector("#f").addEventListener("submit",function(s){
	s.preventDefault();
	f.submit();
})
</script>
</html>