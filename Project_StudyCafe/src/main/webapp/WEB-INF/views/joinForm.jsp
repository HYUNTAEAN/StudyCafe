<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ Join ]</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  
<script>

function joinMember(){
	let userid = $("#userid").val();
	let userpwd = $("#userpwd").val();
	let pwdcheck = $("#pwdcheck").val();
	
	if(userpwd != pwdcheck){
		alert("비밀번호 불일치");
		$("#pwdcheck").focus();
		return;
	}
	
	if(userid.trim().length < 10 || userid.trim().length > 11){
		alert("아이디 길이 오류");
		$("#userid").focus();
		return;
	}
	
	let joinData = {"userid" : userid};
	
	$.ajax({
		url : 'joinChk'
		, method : 'POST'
		, data : joinData
		, success : function(resp){
			if(resp == "SUCCESS"){
				if(userpwd.trim().length < 1 || userpwd.trim().length > 10){
					alert("비밀번호 길이 오류");
					$("#userpwd").focus();
					return;
				} 

				$("#myFrm").submit();
			} else {
			alert("아이디 중복");
			$("#userid").focus();
			}
		}
	});
};
</script>

<style>
table{
	margin:auto; 
	display: table;
    table-layout: fixed;
    text-align: center;
    border-color: #1E6EC7;
    border-collapse: collapse;
}
th {
	background-color : #1E6EC7;
	color : white;
}
td {
	background-color: white;
	border: #e3ddd1 solid 1px;
	padding: 5px;
}
a {
	text-decoration : none; 
}
input{
	height: 30px;
}
.context {
	padding: 20px; 
	width: 460px; 
	margin: auto;
	background-color: #e3ddd1;
}
#HomeBtn {
	padding: 15px 100px;
	color: white;
}
.division1 {
	text-align: left;
}
.info {
	text-align: center;
}
.reset {
	text-align: center;
}
#required{
	color: blue;
	font-size : 0.75em;
}
/*
.button {background-color: #1E6EC7;} 
.button1 {background-color: #0386F2; width: 73%;}
.button2 {background-color: #68CC74; width: 73%;}
#userid, #userpwd {
 	padding: 5px;
} */
</style>
</head>
<body>
	<body>
	<div>
		<table width="500">
			<tr>
				<th style="height: 50px;">STUDYCAFE</th>
				<th>SCIT41 Branch</th>
			</tr>
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="javascript:joinMember();" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Join</th>
			</tr>
		</table>
		<div class="context">
		
			<form id="myFrm" action="join" method="POST">
			<table width="460">
				<tr>
					<td class="division1" width="40%">
					<span id="required">*required fields</span><br>Phone Number</td>
					<td class="info" width="45%">
					<input type="text" id="userid" name="userid"></td>
					<td class="reset" width="15%">
					<a href="#" id="reset">reset</a></td>
				</tr>
				<tr>
					<td class="division1">
					<span id="required">*required fields</span><br>Password</td>
					<td class="info"><input type="password" id="userpwd" name="userpwd"></td>
					<td class="reset"><a href="#" id="reset">reset</a></td>
				</tr>
				<tr>
					<td class="division1">
					<span id="required">*required fields</span><br>Re-enter password</td>
					<td class="info"><input type="password" id="pwdcheck"></td>
					<td class="reset"><a href="#" id="reset">reset</a></td>
				</tr>

			</table>
			</form>
		
		</div>
	</div>
</body>
</html> 