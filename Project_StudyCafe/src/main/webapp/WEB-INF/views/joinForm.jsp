<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
function resetMember(){
	let userid = $("#userid").val();
	let userpwd = $("#userpwd").val();
	let pwdcheck = $("#pwdcheck").val();
	
	if(userpwd != pwdcheck){
		alert("Password and Re-enter password are not correct. Please check that.");
		$("#pwdcheck").focus();
		return;
	}
	
	if(userid.trim().length < 10 || userid.trim().length > 11){
		alert("Please enter your Phone Number(without '-').");
		$("#userid").focus();
		return;
	}
	
	location.href="resetPassword?userid="+userid+"&userpwd="+userpwd;
	
}

function joinMember(){
	let userid = $("#userid").val();
	let userpwd = $("#userpwd").val();
	let pwdcheck = $("#pwdcheck").val();
	
	if(userpwd != pwdcheck){
		alert("Please check your password. That's not correct.");
		$("#pwdcheck").focus();
		return;
	}
	
	if(userid.trim().length < 10 || userid.trim().length > 11){
		alert("Please enter your Phone Number(without '-').");
		$("#userid").focus();
		return;
	}
	
	if(userpwd.trim().length < 1 || userpwd.trim().length > 10){
		alert("Only 1 to 10 digits of password are allowed.");
		$("#userpwd").focus();
	}
		
	let joinData = {"userid" : userid};
	
	$.ajax({
		url : 'joinChk'
		, method : 'POST'
		, data : joinData
		, success : function(resp){
			if(resp == "SUCCESS"){
				$("#myFrm").submit();
			} else {
			alert("Someone is already using the same ID. Please enter other ID.");
			$("#userid").focus();
			}
		}
	});
}

$(function () {
	$("#reset1").on("click", function () {
		$("#userid").val("").focus();
	});
});
$(function () {
	$("#reset2").on("click", function () {
		$("#userpwd").val("").focus();
	});
});
$(function () {
	$("#reset3").on("click", function () {
		$("#pwdcheck").val("").focus();
	});
});

</script>

<style>
a {
	text-decoration : none;
	color: black;
}
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
#joinBtn {
	padding: 15px 200px;
	color: white;
}
</style>
</head>
<body>
	<body>
	<div>
		<table width="500">
			<tr>
				<th style="height: 50px;">STUDYCAFE</th>
				<th>SCIT41 Branch<input type="hidden" id="key" value="${key}"></th>
			</tr>
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="/std/" id="HomeBtn">Home</a></th>
				<c:if test="${key == 'join'}"><th style="background-color: #213d62;">Join</th></c:if>
				<c:if test="${key == 'reset'}"><th style="background-color: #213d62;">Reset</th></c:if>
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
					<td class="reset" width="15%"><a href="#" id="reset1">reset</a></td>
				</tr>
				<tr>
					<td class="division1">
					<span id="required">*required fields</span><br>Password</td>
					<td class="info"><input type="password" id="userpwd" name="userpwd"></td>
					<td class="reset"><a href="#" id="reset2">reset</a></td>
				</tr>
				<tr>
					<td class="division1">
					<span id="required">*required fields</span><br>Re-enter password</td>
					<td class="info"><input type="password" id="pwdcheck"></td>
					<td class="reset"><a href="#" id="reset3">reset</a></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
		<table width="500">
			<tr>
				<c:if test="${key == 'join'}"><td style="height: 50px; background-color: #68CC74;"><a href="javascript:joinMember();" id="joinBtn"><b>JoinStudyCafe</b></a></td></c:if>
				<c:if test="${key == 'reset'}"><td style="height: 50px; background-color: #68CC74;"><a href="javascript:resetMember();" id="joinBtn"><b>Reset</b></a></td></c:if>
			</tr>
		</table>
</body>
</html> 