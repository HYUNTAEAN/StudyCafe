<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ paymentForm ]</title>
<style>
table {
	margin: auto;
	display: table;
	table-layout: fixed;
	text-align: center;
	border-color: #1E6EC7;
	border-collapse: collapse;
}

th {
	background-color: #1E6EC7;
	color: white;
}

td {
	background-color: white;
	border: #e3ddd1 solid 1px;
	padding: 5px;
}

a {
	text-decoration: none;
}

.context {
	padding: 20px;
	width: 460px;
	margin: auto;
	background-color: #F0F0F0;
}

#PaymentBtn {
	padding: 15px 215px;
	color: white;
}

#HomeBtn {
	padding: 15px 100px;
	color: white;
}

.division {
	text-align: left;
}

.time {
	text-align: right;
}

p {
	text-align: right;
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
	<div>
		<table width="500">
			<tr>
				<th style="height: 50px;">STUDYCAFE</th>
				<th>SCIT41 Branch</th>
			</tr>
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a
					href="#" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Payment</th>
			</tr>
		</table>
	
		<div class="context">
			<table width="460">
				<tr>
					<td class="division" style="font-size: 7px;">Division of
						TimePackage</td>
					<td style="text-align: right; font-size: 7px;">Time of
						TimePackage</td>
					<td style="text-align: right; font-size: 7px;">Remaining
						available time</td>
				</tr>
				<tr>
					<td class="division">Remaining Time</td>
					<td class="time">No remaining time</td>
					<td class="time"></td>
				</tr>
				<tr>
					<td class="division">Charging Time</td>
					<td class="time">+ 50 hours</td>
					<td class="time">50 days</td>
				</tr>
				<tr>
					<td class="division">Total time after charging</td>
					<td class="time">50 hours</td>
					<td class="time" style="font-size: 3px;">*Remaining available
						time depends on your product.
					</td>
				</tr>
			</table>
		</div>
		<div class="context" style="padding-bottom: 10;">
			<table width="460">

				<tr>
					<td class="division" width="30%">Until when</td>
					<td class="time">Until 2021-May-09 19:49PM</td>
				</tr>
				<tr>
					<td class="division">Payment Amount</td>
					<td class="time">70,000 Won</td>
				</tr>
			</table>
		</div>
		<table width="500">
			<tr>
				<th style="height: 50px; background-color: #68CC74;">
				<a href="#" id="PaymentBtn">Payment</a></th>
			</tr>
		</table>
		
</body>
</html>
