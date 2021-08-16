<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ paymentForm ]</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  
<script>
$(function(){
	let typechk = $("#typechk").val();
	
	let firstlave = $("#lvtime").val();
	let chtime = $("#chtime").val();
	let pltime = $("#pltime").val();
	if(typechk == 'C'){
		$('#firstlave').html(firstlave + " days");
		$('#chargetime').html("+ " + chtime + " days");
		$('#plustime').html(pltime + " days");
	}
});

$(function () {
	$(".highlight").on("mouseover", function () {
		$(this).css("background-color", "rgba(104, 204, 116, 0.8)");
	});
	$(".highlight").on("mouseout", function () {
		$(this).css("background-color", "rgba(104, 204, 116, 1)");
	});
	$(".highlight").on("mousedown", function () {
		$(this).css("background-color", "#62C15B");
	});
});
</script>
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
				<th class="highlight" style="height: 50px; background-color: #68CC74;"><a
					href="#" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Payment</th>
			</tr>
		</table>
	
		<div class="context">
			<table width="460">
				<tr>
					<td class="division" style="font-size: 7px;">Division of
						TimePackage<input type="hidden" id="typechk" value="${type}"></td>
					<td style="text-align: right; font-size: 7px;">Time of
						TimePackage</td>
					<td style="text-align: right; font-size: 7px;">Remaining
						available time</td>
				</tr>
				<tr>
					<td class="division">Remaining Time<input type="hidden" id="lvtime" value="${lavetime}"></td>
					<td class="time" id="firstlave">${lavetime} hours</td>
					<td class="time"></td>
				</tr>
				<tr>
					<td class="division">Charging Time<input type="hidden" id="chtime" value="${chargetime}"></td>
					<td class="time" id="chargetime">+ ${chargetime} hours</td>
					<td class="time">${expiry} days</td>
				</tr>
				<tr>
					<td class="division">Total time after charging<input type="hidden" id="pltime" value="${plustime}"></td>
					<td class="time" id="plustime">${plustime} hours</td>
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
					<td class="time">Until ${nYear}-${eMonth}-<c:if test="${nDay<10}">0${nDay}</c:if><c:if test="${nDay>9}">${nDay}</c:if>
						<c:if test="${nHour<10}">0${nHour}</c:if><c:if test="${nHour>9}">${nHour}</c:if>:<c:if test="${nMinu<10}">0${nMinu}</c:if><c:if test="${nMinu>9}">${nMinu}</c:if>
						<c:if test="${nHour<12}"> AM</c:if><c:if test="${nHour>11}"> PM</c:if></td>
					</tr>
				<tr>
					<td class="division">Payment Amount</td>
					<td class="time">${price} Won</td>
				</tr>
			</table>
		</div>
		<table width="500">
			<tr>
				<th style="height: 50px; background-color: #68CC74;" class="highlight">
				<a href="endPay?productcode=${productcode}" id="PaymentBtn">Payment</a></th>
			</tr>
		</table>
		
</body>
</html>
