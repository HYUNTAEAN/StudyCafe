<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ MainForm after login]</title>
<style>
table {
	margin: auto;
	display: table;
	table-layout: fixed;
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
table, th, td, a {
	text-align: center;
	color: white;
	text-decoration: none;
}
td {
	height: 30px;
}

img {
	max-width: 100%;
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
	<div>
			<table width="500" id="table1">
				<tr>
					<td><b>STUDYCAFE</b></td>
					<td><b>SCIT41 Branch</b></td>
				</tr>
				<tr>
					<td colspan="2"><img src="resources/images/pic1.jpg"></td>
				</tr>
				<tr>
					<td colspan="2"><a href="#">Check available seats</a></td>
				</tr>
			</table>
			<table width="500" id="table2">
				<tr>
					<td>
						<b><span>Welcome! 010-1111-2222</span><br> 
						Please<span> logout</span> when you leave.</b></td>
				</tr>
			</table>
			<div class="context">
			<table width="460" id="table3">
				<tr>
					<td class="firsttd">Purchase of products</td>
					<td class="choose" colspan="2"><a href="#">Single Ticket</a></td>
					<td class="choose" colspan="2"><a href="#">TimePackage</a></td>
					<td class="choose" colspan="2"><a href="#">기간권</a></td>
				</tr>
				<tr>
					<td class="firsttd">Use 정액권</td>
					<td class="choose" colspan="3"><a href="#">Choose seat as TimePackage</a></td>
					<td class="choose" colspan="3"><a href="#">Choose seat as 기간권</a></td>
				</tr>
				<tr>
					<td class="firsttd">Charge 정액권</td>
					<td class="choose" colspan="3"><a href="#">Charge TimePackage</a></td>
					<td class="choose" colspan="3"><a href="#">Charge 기간권</a></td>
				</tr>
				<tr>
					<td class="lasttd">Additional Function</td>
					<td class="change" colspan="2"><a href="#">Check User Information</a></td>
					<td class="change" colspan="2"><a href="#">Change Seat</a></td>
					<td class="change" colspan="2"><a href="#">Extend hour</a></td>
				</tr>
			</table>
		</div>
		<table width="500" style="border-spacing: 0px;">
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="#" id="leaveBtn">Leave Studycafe</a></th>
				<th style="background-color: #213d62;"><a href="#" id="logoutBtn">Logout</a></th>
			</tr>
		</table>
	</div>
	
</body>
</html>