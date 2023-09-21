<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 수정</title>
</head>
<body>
<form id="f" method="post" action="./dataModify.do">
<input type="hidden" name="ridx" value="${data.getRidx()}">
고객명 : <input type="text" name="rname" readonly value="${data.getRname()}"><br>
비밀번호 : <input type="password" name="rpw" value=""><br>
본문 : <textarea cols="200" rows="4" name="rtext" >${data.getRtext()}</textarea><br>
<input type="submit" value="등록">
</form>
</body>
<script>
const oriPw = "${data.getRpw()}"
console.log(oriPw)
document.querySelector("#f").addEventListener("submit",function(s){
	s.preventDefault();
	if(f.rpw.value==""){
		alert("pw")
	} else{
		if(f.rpw.value!=oriPw){
			alert("wrong pw")
		}else{
			f.submit()
		}
	}
})
</script>
</html>