document.querySelector("#btn").addEventListener("click", function() {
	if (game.user.value == "") {
		alert("고객명을 입력하세요");
	} else if (game.usertel.value == "") {
		alert("연락처를 입력하세요");
	} else if (game.useremail.value == "") {
		alert("이메일을 입력하세요");
	} else {
		//정규식 코드로 검토
		this.reg = /[a-zA-Zㄱ-ㅎㅏ-ㅣ]/g;
		if (this.reg.test(game.usertel.value) == true) {
			alert("올바른 전화번호를 입력하세요.");
			game.usertel.value = "";
		} else {
			game.method = "post";
			game.action = "./gameok.do";
			game.enctype = "application/x-www-form-urlencoded";
			game.submit();
		}
	}
})