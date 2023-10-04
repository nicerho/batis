<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 입력파트 - 2</title>
</head>
<body>
<form id="f" method="post" action="./pay3.do">
<input type="hidden" name="goodcode" value="${stringList.get(0)}">
<input type="hidden" name="goodea" value="${stringList.get(3)}">
<input type="hidden" name="goodname" value="${stringList.get(1)} ">
<input type="hidden" name="price" value="${stringList.get(2)}">
<!-- stringList(키 이름) -->
상품코드 : ${stringList.get(0)}<br>
상품명 : ${stringList.get(1)}<br>
상품가격 : <span id="total"></span>원<br>
상품수량 : ${stringList.get(3)}개
<p>사용자 정보</p>
고객명 : <input type="text" name="buyername"><br>
연락처 : <input type="text" name="buyertel"><br>
이메일 : <input type="text" name="buyeremail"><br>
주소 : <input type="text" name="rec_post" value="07285"><br>
도로명주소 : <input type="text" name="rec_addr" value="서울특별시 영등포구 선유로9나길 5 (문래동5가)"><br>
상세주소 : <input type="text" name="rec_addr_dtc" value="203동 401호"><br>
적립금 : <input type="text" name="point" value="0"><br>
<p>결재방식</p>
<input type="radio" name="gopaymethod" value="Card" checked> 신용카드
<input type="radio" name="gopaymethod" value="DirectBank"> 계좌이체
<input type="radio" name="gopaymethod" value="VBank"> 가상계좌
<br>
<input type="button" value="선택완료" id="btn">
</form>
</body>
<script>
var money = Number("${stringList.get(2)}"); //toLocaleString 슬시 안될수도잇으니가 Number로 변환후 하자
document.getElementById("total").append(money.toLocaleString());
document.querySelector("#btn").addEventListener("click",function(){
	f.submit();
})
</script>
</html>