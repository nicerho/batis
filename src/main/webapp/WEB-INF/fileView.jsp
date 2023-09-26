<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일리스트</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>파일 리스트</th>
			</tr>
		</thead>
		<tbody id="dl">

		</tbody>
	</table>
</body>
<script>
	var code = document.getElementById("dl");
	var data = Number("${list.size()}");
	var ea0 = "${list.get(0).getFname()}";
	var ea1 = "${list.get(1).getFname()}";
	for (x = 0; x < data; x++) {
		var name = eval("ea" + x);
		var spnm = name.split(",")
		console.log(spnm)
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		for(var y=0;y<spnm.length;y++){
		td.innerHTML += "<a href='"+spnm[y]+"'>"+spnm[y]+"</a>\n";
		}
		tr.append(td)
		code.append(tr)
	}
</script>
</html>