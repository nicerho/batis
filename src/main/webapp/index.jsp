<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<header></header>
<nav><jsp:include page="./top.jsp" flush="true"></jsp:include></nav>
<main>${index}</main>
<footer><%@ include file="./footer.jsp" %></footer>
</body>
</html>