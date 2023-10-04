<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ES로 노드번호체쿠</title>
</head>
<body>
<ul id="menu">
<li>메뉴1</li>
<li>메뉴2</li>
<li>메뉴3</li>
<li>메뉴4</li>
<li>메뉴5</li>
</ul>
<ol id="menu2">
<li>menu1</li>
<li>menu2</li>
<li>menu3</li>
<li>menu4</li>
<li>menu5</li>
</ol>
</body>
<script>
var node2 = document.querySelectorAll("#menu2>li");
document.querySelector("#menu2").addEventListener("click",function(z){
	this.index = [].indexOf.call(node2,z.target);
	node2[this.index].innerHTML = "메뉴";
});


var node = document.querySelectorAll("#menu>li");
document.querySelector("#menu").addEventListener("click",function(z){
	var n = [].indexOf.call(node,z.target);
	//indexOf : 배열번호값 지정
	var url = "";
	switch(n){
	case 1:
		url = "http://naver.com";
		break;
	case 2:
		url = "http://google.com";
		break;
	case 3:
		url = "http://nate.com";
		break;
	}
	location.href=url;
});
</script>
</html>