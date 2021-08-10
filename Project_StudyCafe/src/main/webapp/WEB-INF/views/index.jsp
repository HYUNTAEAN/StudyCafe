<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[메인 화면]</title>
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
    }
    th{
    	width: 300px;
    }
    a{
    	text-decoration : none;
    }
	.button, .button1, .button2{
  		border: none;
  		color: white;
  		padding: 15px 32px;
 		text-align: center;
  		text-decoration: none;
		display: inline-block;
 		font-size: 16px;
  		margin: 4px 2px;
  		cursor: pointer;
}
	
	.button {background-color: #1E6EC7;} 
	.button1 {background-color: #0386F2; width: 73%;}
	.button2 {background-color: #68CC74; width: 73%;}
	
	 #userid, #userpwd {
	 	padding: 5px;
	 }
	
</style>
</head>
<body>
<div class="wrapper">
	<form action="login">
		<table width ="500">
		<tr>
			<td style="height:50px"><b>STUDYCAFE</b></td>
			<td><b>SCIT41 Branch</b></td>
		</tr>
		<tr>
			<td colspan="2">
			<img src="images/pic1.jpg" style="max-width : 100%"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" style="height:50px"> 
			<a href="#">Check available seats</a></td>
		</tr>
		<tr>
			<th><input type="text" id="userid" style="width:200px"></th>
			<td rowspan="2" align="center">
			<a href="#" class="button">ID/PW Login</a></td>
		</tr>
		<tr>
			<th><input type="password" id="userpwd" style="width:200px"></th>
		</tr>
		<tr>
			<td><a href="#" class="button1">Join</a></td>
			<td><a href="#" class="button2">Reset Password</a></td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>