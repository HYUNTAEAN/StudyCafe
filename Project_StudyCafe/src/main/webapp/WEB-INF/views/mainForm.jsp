<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ Login ]</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  
<script>


function loginChk(){
	let userid = $("#userid").val();
	let userpwd = $("#userpwd").val();
	
	if(userid.trim().length < 1){
		alert("아이디 길이 오류");
		return;
	}
	if(userpwd.trim().length < 1){
		alert("비밀번호 길이 오류");
		return;
	}
	
	let myData = {"userid" : userid , "userpwd" : userpwd};

	$.ajax({
		url : 'login'
		, method : 'POST'
		, data : myData
		, success : function(resp){
			alert(JSON.stringify(resp));
			window.location = '/std/';
		}
	});
}

</script>

<style>
	table{
		margin:auto; 
		background-color : #1E6EC7;
		display: table;
      	table-layout: fixed;
	}
	table, th, td, a {
    	text-align: center;
    	color : white;
    	text-decoration : none;
    }
    td{
    	height:50px;
    }
	.button, .button1, .button2{
  		color: white;
  		padding: 15px 32px;
  		text-align: center;
  		text-decoration: none;
		display: inline-block;
  		margin: 4px 2px;
}
	
	.button {background-color: #1E6EC7;} 
	.button1 {background-color: #0386F2; width: 73%;}
	.button2 {background-color: #68CC74; width: 73%;}
	
	 #userid, #userpwd {
	 	padding: 5px;
	 }
	img{
		max-width : 100%;
	}
</style>
</head>
<body>
<div class="wrapper">
	<form id="login" action="login" method="POST">
		<table width ="500">
		<tr>
			<td><b>STUDYCAFE</b></td>
			<td><b>SCIT41 Branch</b></td>
		</tr>
		<tr>
			<td colspan="2">
			<img src="resources/images/pic1.jpg"></td>
		</tr>
		<tr>
			<td colspan="2"> 
			<a href="#">Check available seats</a></td>
		</tr>
		<c:if test="${sessionScope.loginId == null}">
		<tr>
			<th><input type="text" id="userid" name="userid" style="width:200px"></th>
			<td rowspan="2">
			<a href="javascript:loginChk();" class="button">ID/PW Login</a></td>
		</tr>
		<tr>
			<th><input type="password" id="userpwd" name="userpwd" style="width:200px"></th>
		</tr>
		<tr>
			<td><a href="join" class="button1">Join</a></td>
			<td><a href="#" class="button2">Reset Password</a></td>
		</tr>
		</c:if>
		</table>
	</form>
	<p>세션 정보 확인 : ${sessionScope.loginId}</p>
</div>
</body>
</html> 