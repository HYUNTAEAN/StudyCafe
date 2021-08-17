<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ User Information ]</title>
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
.check{
	text-align: center;
}

p {
	text-align: right;
}
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
					href="/std/" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Payment</th>
			</tr>
		</table>
	
		<div class="context" style="padding-bottom: 10;">
			<table width="460">
				<tr>
					<td class="division" width="30%">ID</td>
					<td class="time">${sessionScope.loginId}</td>
				</tr>
				<tr>
					<td class="check" colspan="2">Services in use</td>
				</tr>
				<tr>
					<td class="division">Day Package</td>
					<c:if test="${chargeC != '[]'}"><td class="time">${cName}</td></c:if><c:if test="${chargeC == '[]'}"><td class="time">구매한 상품이 없습니다</td></c:if>
				</tr>
				<tr>
					<td class="division">Time Package</td>
					<c:if test="${chargeB != '[]'}"><td class="time">${bName}</td></c:if><c:if test="${chargeB == '[]'}"><td class="time">구매한 상품이 없습니다</td></c:if>
				</tr>
				<tr>
					<td class="check" colspan="2">Check remaining time/days</td>
				</tr>
				<tr>
					<td class="division">Charged days</td>
					<td class="time"><c:if test="${cTime > 1}">${cTime}</c:if><c:if test="${cTime < 1}">0</c:if> days</td>
				</tr>
				<tr>
					<td class="division">Charged time</td>
					<c:if test="${bTime > 1}">
						<td class="time">${bTime} hours</td>
					</c:if>
					<c:if test="${aTime > 1}">
						<td class="time">${aTime} hours</td>
					</c:if>
				</tr>
				
				<c:if test="${list.size() < 1}">
				<tr>
					<td class="division">Service</td>
					<td class="time">There are no services in use.</td>
				</tr>
				</c:if>
			</table>
		</div>
		</div>
</body>
</html>
