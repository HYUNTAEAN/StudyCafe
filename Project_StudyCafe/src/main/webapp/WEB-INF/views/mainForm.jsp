<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ Login ]</title>
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
	<form action="login">
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
		<tr>
			<th><input type="text" id="userid" style="width:200px"></th>
			<td rowspan="2">
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