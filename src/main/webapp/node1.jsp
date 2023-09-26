<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS Node</title>
<!-- 
DOM : innerHTML, innerText
NODE : 객체의 node 번호를 확인하여 출력하는 형태
 -->
</head>
<body>
	<ul id="list">
		<li>윤보미</li>
		<li>박초롱</li>
	</ul>
	<input type="button" value="노드 앞에 추가" onclick="a()">
	<br>
	<input type="button" value="노드 뒤에 추가" onclick="b()">
	<br>
	<input type="button" value="노드 중간에 추가" onclick="c()">
	<br>
	<input type="button" value="노드 삭제" onclick="d()"><br>
	<input type="button" value="노드 수 파악" onclick="e()"><br>
	<input type="button" value="노드 강제 생성" onclick="f()">
</body>
<script>
	var code = document.getElementById("list");
	function a() {
		var a = document.createElement("li");//태그생성
		var text = document.createTextNode("정은지");//문자 생성
		a.append(text);//해당 태그 안에 값을 적용할 때 사용
		//code.insertBefore(a,code.firstChild);
		code.insertBefore(a,code.childNodes[0]);
	}
	function b(){
		var a = document.createElement("li");
		var text = document.createTextNode("김남주");
		a.append(text);
		//code.insertBefore(a,code.lastChild);
		code.append(a);
	}
	function c(){
		var a = document.createElement("li");
		var text = document.createTextNode("오하영");
		a.append(text);
		//code.insertBefore(a,code.childNodes[2]);
		// childNodes : 빈 배열도 포함
		// children : 빈 배열 제거 후 실제 태그에 대한 노드값만 가져옴
		code.insertBefore(a,code.children[1]);
	}
	function d(){
		code.removeChild(code.childNodes[0]);
	}
	function e(){
		console.log(code.childNodes);
		var ea = code.children.length;
		console.log(ea);
	}
	function f(){
		var data = ["정은지","오하영","김남주"];
		var x = 0;
		for(x=0;x<data.length;x++){
			var a = document.createElement("li");
			var text = document.createTextNode(data[x]);
			a.append(text);
			code.append(a);
		}
	}
</script>
</html>