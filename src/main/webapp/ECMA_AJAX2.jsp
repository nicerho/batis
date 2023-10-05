<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="f">
상품코드 : <input type="text" name="productCode" id="productCode"><br>
<input type="button" value="삭제" id="btn">
</form>
</body>
<script>
document.querySelector("#btn").addEventListener("click",function(){
	this.mid = document.querySelector("#productCode").value;
	fetch("./delete/"+this.mid,{
		method : "DELETE",
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