<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ES로 AJAX</title>
</head>
<body>
<input type="button" value="click" id="btn"><br>
ID : <input type="text" name="mid" id="mid"><br>
전화번호: <input type="text" name="mtel" id="mtel"><br>
<input type="button" value="click2" id="btn2">
<input type="button" value="click3" id="btn3">
<input type="button" value="put메서드" id="btn4">


</body>
<script>
document.querySelector("#btn").addEventListener("click",function(){
	fetch("./news.json") //fetch : ajax 통신 함수 api로 보내고 싶으면 ("./test.do?parameter")
 	.then(function(aa){ //해당 파일을 통신을 통하여 배열로 변환
		return aa.json();
	}).then(function(bb){ //try데이터 출력
		console.log(bb);
	}).catch(function(error){ //예외처리로 데이터 에러발생
		console.log("Data Error")
	});
});

//배열값이 아닌 name 형태로 넘기는 방식
document.querySelector("#btn2").addEventListener("click", function(){
	this.mid = document.querySelector("#mid").value;
	this.mtel = document.querySelector("#mtel").value;
	
	fetch("./ajax.do", {
		method: "POST",
		cache: "no-cache",
		headers: {
			"Content-Type":"application/x-www-form-urlencoded"
		},
		body: "userid="+this.mid + "&usertel="+this.mtel
	}).then(function(aa){
		return aa.text();
	}).then(function(bb){
		console.log(bb);
	}).catch(function(error){
		console.log("Data Error!!");
	});
});
//JSON 배열로 넘기는 방식
document.querySelector("#btn3").addEventListener("click", function(){
	this.mid = document.querySelector("#mid").value;
	this.mtel = document.querySelector("#mtel").value;
	fetch("./ajax2", {
		method: "POST",
		cache: "no-cache",
		headers:{
			"Content-Type":"application/json;char-set=utf-8"
		},
		body: JSON.stringify({
			"userid":this.mid,
			"usertel":this.mtel
		})
	}).then(function(aa){
		return aa.text();
	}).then(function(bb){
		console.log(bb);
	}).catch(function(error){
		console.log("Data Error!!");
	});
});
document.querySelector("#btn4").addEventListener("click",function(){
	this.mid = document.querySelector("#mid").value;
	fetch("./put/"+this.mid,{
		method : "PUT",
		/*headers : {
			"Content-Type":"application/x-www-form-urlencoded"
		},
		body : "userid="+this.mid*/
	}).then(function(aa){
		console.log(aa);
		//return aa.text();
	}).then(function(bb){
		//console.log(bb);
	}).catch(function(error){
		console.log("Data Error!!");
	});
})
</script>
</html>