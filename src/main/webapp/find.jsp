<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    LocalDate now = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    String time = now.format(formatter);
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>틀린그림찾기 게임</title>
    <link rel="stylesheet" type="text/css" href="./find.css?v=<%=time%>"></style>
</head>
<body>
	<p style="text-align:center">남은 시간 : <span id="timer"></span></p>
    <section class="game">
        <div class="blackscreen" id="blackscreen"></div>
        <p>틀린그림 찾기 EVENT!!</p>
        <div class="count">
        <img src="./findimg/no_0.png" id="count">
        </div>
        <span class="img_ori"></span>
        <span class="img_game" id="img_game">
            <div class="mistake" id="mistake"></div>
            <label class="btn1"></label>
            <label class="btn2"></label>
            <label class="btn3"></label>
            <label class="btn4"></label>
            <label class="btn5"></label>
        </span>
    </section>
    <section>
    <form id="game" style="display:none;">
    <input type="hidden" name="userid" value="testuser">
    고객명 : <input type="text" name="user"><br>
   	고객연락처 : <input type="text" name="usertel"><br>
   	이메일 : <input type="text" name="useremail"><br>
   	<button type="button" id="btn">이벤트 참여</button>
   	</form>
    </section>
</body>
<script src="./find.js?v=<%=time%>"></script>
</html>