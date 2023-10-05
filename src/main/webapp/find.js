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
//틀린횟수
let false_count = 3;
//찾은횟수
let success_count = 0;

//정답 틀릴경우
document.querySelector("#mistake").addEventListener("click", function() {
	false_count--;
	if (false_count < 1) {
		document.querySelector("#blackscreen").style["display"] = "block";
		alert("끝~")
	}
	else {
		alert("정답이 아닙니다 남은 기회" + false_count + "회");
	}
});
//정답일 경우
document.querySelector("#img_game").addEventListener("click", function(z) {
	this.node = document.querySelectorAll("#img_game > label");
	this.n = [].indexOf.call(this.node, z.target);
	if (this.n != -1) {
		success_count++;
		document.querySelector("#count").src = "./findimg/no_" + success_count + ".png"
		this.node[this.n].innerHTML = '<img src="./findimg/answer.gif?v=' + success_count + '"class="asw">';
		if (success_count == 5) {
			clearTimeout(timer);
			alert("goood")
			document.querySelector("#game").style["display"] = "block";
		}
	}
});

var time = 10;
var timer;
function game_time() {
	this.clock = document.querySelector("#timer");
	this.clock.innerHTML = time + "초";
	time--;
	if (time >= 0) {
		timer = setTimeout(game_time, 1000);
	} else {
		clearTimeout(timer);
		document.querySelector("#blackscreen").style["display"] = "block";
		alert("끝")
	}
}
game_time();

