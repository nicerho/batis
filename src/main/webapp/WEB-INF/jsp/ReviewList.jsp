<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰목록리스트</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>고객명</th>
				<th>내용</th>
				<th>등록일</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${data}">
				<tr>
					<td>${item.getRname()}</td>
					<td>${item.getRtext()}</td>
					<td>${item.getRdate().substring(0,10)}</td>
					<td><input type="button" value="delete"
						onclick="deleteReview(${item.getRidx()})"></td>
					<td><input type="button" value="modify"
						onclick="modifyReview(${item.getRidx()})"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table border="1">
		<tr>
		<c:forEach  var="i" begin="1" end="${cnt%2==0? cnt/2:(cnt/2)+1}">
			<td><a href="./reviewList.do?ridx=${i}">${i}</a></td>
		</c:forEach>
		</tr>
	</table>
	<form id="f" method="get" action="./reviewList.do" >
	검색 : <input type="text" name="search" value="${search}"><input type="submit" value="검색" >
	</form>
</body>
<script>
function deleteReview(no){
	if(confirm("해당 글을 삭제하시겠습니까")){
		location.href='./reviewDelete.do?ridx='+no;	
	}
}
function modifyReview(no){
	location.href='./reviewModify.do?ridx='+no;
}
document.querySelector('#f').addEventListener('submit',function(a){
	a.preventDefault();
	alert("test")
	if(f.search.value==""){
		location.href='./reviewList.do'
	}else{
		f.submit();
	}
})
</script>
</html>