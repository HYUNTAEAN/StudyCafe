<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ purchaseForm ]</title>
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

.context {
	padding: 20px; 
	width: 460px; 
	margin: auto;
	background-color: #e3ddd1;
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
				<th style="height: 50px; background-color: #68CC74;"><a href="#" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Purchase of Products</th>
			</tr>
		</table>
		<div class="context" style="padding-bottom: 0;">
			<table width="460">
				<tr>
					<td class="division" style="background-color: #ededed;">Division</td>
					<td class="time" style="background-color: #ededed;">Time</td>
				</tr>
				<tr>
					<td class="division">Time package remaining time</td>
					<td class="time">0 hours</td>
				</tr>
				<tr>
					<td class="division">Charging time</td>
					<td class="time">0 hours</td>
				</tr>
				<tr>
					<td class="division">Total time after charging</td>
					<td class="time">0 hours</td>
				</tr>
			</table>
		</div>
		<div class="context">
			<table width="460">
				<tr>
					<td style="background-color: #ededed;" class="division">Product name</td>
					<td style="background-color: #ededed; text-align: right;">Effective days</td>
					<td style="background-color: #ededed; text-align: right;">Price</td>
				</tr>
				<tr>
					<td class="division">30 hour package</td>
					<td class="time">30 days</td>
					<td class="time">49,000 won</td>
				</tr>
				<tr>
					<td class="division">50 hour package</td>
					<td class="time">50 days</td>
					<td class="time">70,000 won</td>
				</tr>
				<tr>
					<td class="division">100 hour package</td>
					<td class="time">100 days</td>
					<td class="time">130,000 won</td>
				</tr>
			</table>
		</div>
		<table width="500">
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="#" id="PaymentBtn">Payment</a></th>
			</tr>
		</table>
	</div>
</body>
</html>