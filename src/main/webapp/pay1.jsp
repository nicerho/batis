<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Random rd = new Random();
    int number = 0;
    String pcode = "";
    for(int i=1;i<7;i++){
    	number = rd.nextInt(9);
    	pcode += number;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품선택 및 장바구니 - 1</title>
<!-- 상품상세페이지 > 장바구니 > 사용자 정보 > 결제수단 선택 >PG API > redirect > close.jsp(결제 진행시 취소 버튼 클릭하면 레이어팝업 사라짐) -->
</head>
<body>
<form id="f" method="post" action="./pay2.do">
상품코드 : <input type="text" name="product_code" value="<%=pcode%>" readonly="readonly"><br>
상품명 : <input type="text" name="product_name" value=""><br>
결제금액 : <input type="text" name="product_money" value="" placeholder="3000원 이상"><br><!-- ,등의 특수문자 제외하고 숫자만 -->
상품수량 : <input type="text" name="product_ea" value=""><br>
<input type="button" value="구매" id="btn">
</form>
</body>
<script>
document.querySelector("#btn").addEventListener("click",function(){
	f.submit();
})
</script>
</html>