<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상리</title>
</head>
<body>
	<iframe frameborder="0"
		src="http://192.168.110.222:8080/batis/popup.jsp"></iframe>
</body>
<script>
	window.addEventListener("message", product_code, false);
	function product_code(a){
		//해당 iframe에서 받은 데이터값을 부모창으로 전달
		window.opener.f.m.value = a.data.msg;
		self.close();
	}
</script>
</html>