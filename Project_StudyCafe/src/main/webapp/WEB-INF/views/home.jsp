<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<title>[ Main ]</title>
<style type="text/css">
html { font-size: 10px; }
body {
	font-family: 'Noto Sans KR', sans-serif;
	color: #f0f3f3; 
	display: flex;
  	justify-content: center;
  	align-items: center;
  	margin: 0;
}
#container {
	width: 60%;
	background-color: #264f8d;
}
#header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 3rem;
}
#cafeNameEN {
	font-size: 4rem;
	margin-right: auto;
}
#cafeNameKo {
	font-size: 3rem;
}
#seatInfo {
	display: flex;
  	justify-content: flex-start;
  	align-items: center;
  	font-size: 1.5rem;
}
#subject {
	width: 20%;
	padding: 1.5rem;
	background-color: #164f94;
	text-align: center;
}
#currentSeat {
	width: 80%;
	padding: 1.5rem;
	background-color: #20457C;
}
#body {
	background-color: #1b2944;
	padding: 2rem;
	padding-bottom: 0;
}
#message {
	color: #5a9fd8;
	font-size: 1.5rem;
	padding-left: 2rem;
}
#loginContainer {
	padding: 2rem;
	padding-bottom: 1rem;
	background-color: #205b9f;
	margin-top: 2rem;
	border: 0.1rem solid #5a9fd8;
	border-bottom: none;
	display: flex;
  	justify-content: center;
  	align-items: center;
}
#loginBox {
	cursor: pointer;
	border: 0.1rem solid #5a9fd8;
	padding: 2rem;
	
}
.textBox {
	font-size: 3.1rem;
	padding: 1.7rem;
	margin-right: 1rem;
}
#joinContainer {
	display: flex;
  	justify-content: center;
  	align-items: center;
  	padding: 2rem;
  	padding-top: 0;
	background-color: #205b9f;
	border: 0.1rem solid #5a9fd8;
	border-bottom: none;
	border-top: none;
}
#joinBox {
	cursor: pointer;
	padding: 2rem;
	background-color: #0887f2;
	margin-right: 1rem;
}
#changePwdBox {
	cursor: pointer;
	padding: 2rem;
	background-color: #4fcf52;
}
#caution {
	padding: 2rem;
	background-color: #113a71;
	border: 0.1rem solid #5a9fd8;
	border-bottom: none;
	border-top: none;
}
.cautionNum {
	color: #5a9fd8; 
	font-size: 1.5rem;
	padding: 2rem;
	padding-left: 0;
}
.cautionText {
	font-size: 1.5rem;
	padding: 2rem;
}
#footer {
	cursor: pointer;
	padding: 2rem 4rem;
	background-color: #4fcf52;
	display: flex;
  	align-items: center;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<img alt="books" src="/resources/images/hexagon.png" width="10%">
			<span id="cafeNameEN">STUDYCAFE</span>
			<span id="cafeNameKo">스터디카페</span>
		</div>
		<div id="mainImages">
			<img alt="studyCafe1" src="/resources/images/studyCafe1.png" width="100%">
		</div>
		<div id="seatInfo">
			<div id="subject"><span>이용가능 좌석 :</span></div>
			<div id="currentSeat"><span>자유석</span></div>
		</div>
		<div id="body">
			<span id="message">Login 로그인 후 이용해주세요</span>
			<div id="loginContainer">
				<div>
					<input type="text" id="userid" class="textBox" style="margin-bottom: 1rem">
					<br>
					<input type="password" id="userpwd" class="textBox">
				</div>
				<div id="loginBox">
					<img alt="login" src="/resources/images/login.png" width="17%">
					<br>
					<span style="font-size: 3.5rem; float: right;" >ID/PW 로그인</span>
				</div>
			</div>
			<div id="joinContainer">
				<div id="joinBox">
					<img alt="join" src="/resources/images/join.png" width="15%">
					<br>
					<span style="font-size: 3.5rem; float: right;">회원가입</span>
				</div>
				<div id="changePwdBox">
					<img alt="changePwd" src="/resources/images/resetpwd.png" width="15%">
					<br>
					<span style="font-size: 3.5rem; float: right;">비밀번호 재설정</span>
				</div>
			</div>
			<div id="caution">
				<span style="color: #5a9fd8; font-size: 1.5rem;">유의사항</span>
				<table>
					<tr>
						<td class="cautionNum">01</td>
						<td class="cautionText">회원가입시 휴대전화번호로 가입해주시기 바랍니다</td>
					</tr>
					<tr>
						<td class="cautionNum">02</td>
						<td class="cautionText">로그인후 좌석지정을 완료해야 입실이 가능합니다</td>
					</tr>
					<tr>
						<td class="cautionNum">03</td>
						<td class="cautionText">키오스크 이용완료 후에는 반드시 로그아웃 처리 바랍니다.</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<span style="font-size: 3.5rem;">퇴실</span>
			<img alt="logout" src="/resources/images/logout.png" width="8%" style="margin-left: auto;">
		</div>
	</div>
</body>
</html>