<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 ECMA</title>
</head>
<body>
<input type="file" id="img" accept="image/*"><br>
<img src="" id="pdimg" style="display:none">
</body>
<script>
document.querySelector("#img").addEventListener("change",function(data){
	this.f = data.target.files[0];
	this.z = new FileReader();//IO
	this.z.onload = function(k){
		this.view = document.querySelector("#pdimg");
		this.view.style["display"] = "block";
		console.log(k);
		this.view.src = k.target.result; // 파일업로드하는 PC에 있는 절대경로값
	}
	this.z.readAsDataURL(this.f); // 해당 함수를 다시 읽기1
})
</script>
</html>