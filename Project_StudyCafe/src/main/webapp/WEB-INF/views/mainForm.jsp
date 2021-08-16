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
		display: table;
      	table-layout: fixed;
	}
	#pretable{
		background-color : #1E6EC7;
	}
	table, th, td, a {
    	text-align: center;
    	color : white;
    	text-decoration : none;
    }
    td{
    	height:50px;
    }
    .posttd{
    	height : 30px;
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
	
	#table1 {
		background-color: #1E6EC7;
	}
	
	#table2 {
		background-color: #0B0B3B;
		padding-top: 10px;
	}
	#table3 {
		background-color: white;
	}
	#tableA {
	margin: auto;
	display: table;
	table-layout: fixed;
	}
	span {
	color: #00BFFF;
	}
	.context {
	padding: 20px;
	padding-bottom: 20px;
	width: 460px;
	margin: auto;
	background-color: #0B0B3B;
	}
	#logoutBtn {
		padding: 0;
		color: white;
	}
	.firsttd{
		background-color: #1E6EC7;
		width: 120px;
	}
	.lasttd{
		background-color: #228B22;
	}
	.change{
		background-color: #008000;
	}
	.choose{
		background-color: #00008B;
	}
	
</style>
</head>
<body>

<c:if test="${sessionScope.loginId == null}">
<div class="wrapper">
	<form id="login" action="login" method="POST">
		<table width ="500" id="pretable">
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
</c:if>
<c:if test="${sessionScope.loginId != null}">
<div>
			<table width="500" class="tableA" id="table1">
				<tr>
					<td id="posttd"><b>STUDYCAFE</b></td>
					<td id="posttd"><b>SCIT41 Branch</b></td>
				</tr>
				<tr>
					<td colspan="2"><img src="resources/images/pic1.jpg"></td>
				</tr>
				<tr>
					<td colspan="2" id="posttd"><a href="#">Check available seats</a></td>
				</tr>
			</table>
			<table width="500" class="tableA" id="table2">
				<tr>
					<td id="posttd">
						<b><span>Welcome! ${sessionScope.loginId}</span><br> 
						Please<span> logout</span> when you leave.</b></td>
				</tr>
			</table>
			<div class="context">
			<table width="460" class="tableA" id="table3">
				<tr>
					<td class="firsttd" id="posttd">Purchase of products</td>
					<td class="choose" colspan="2" id="posttd"><a href="purchase?productType=A">Single Ticket</a></td>
					<td class="choose" colspan="2" id="posttd"><a href="purchase?productType=B">TimePackage</a></td>
					<td class="choose" colspan="2" id="posttd"><a href="purchase?productType=C">기간권</a></td>
				</tr>
				<tr>
					<td class="firsttd" id="posttd">Use 정액권</td>
					<td class="choose" colspan="3" id="posttd"><a href="#">Choose seat as TimePackage</a></td>
					<td class="choose" colspan="3" id="posttd"><a href="#">Choose seat as 기간권</a></td>
				</tr>
				<tr>
					<td class="firsttd" id="posttd">Charge 정액권</td>
					<td class="choose" colspan="3" id="posttd"><a href="#">Charge TimePackage</a></td>
					<td class="choose" colspan="3" id="posttd"><a href="#">Charge 기간권</a></td>
				</tr>
				<tr>
					<td class="lasttd" id="posttd">Additional Function</td>
					<td class="change" colspan="2" id="posttd"><a href="#">Check User Information</a></td>
					<td class="change" colspan="2" id="posttd"><a href="#">Change Seat</a></td>
					<td class="change" colspan="2" id="posttd"><a href="#">Extend hour</a></td>
				</tr>
			</table>
		</div>
		<table width="500" class="tableA" style="border-spacing: 0px;">
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="#" id="leaveBtn">Leave Studycafe</a></th>
				<th style="background-color: #213d62;"><a href="logout" id="logoutBtn">Logout</a></th>
			</tr>
		</table>
	</div>
</c:if>	
</body>
</html> 