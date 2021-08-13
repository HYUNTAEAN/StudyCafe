<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ purchaseForm ]</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  
<script>
$(function(){

	$(".pretd").css("background-color","white");
	$(".purclick").css("background-color","white");
});
function cal(resp){
	$(".purclick").css("background-color","white");
	$('#'+resp).css("background-color","red");
	
	let lvtime = $("#lvtime").val();
	
	let researchData = {"productcode" : resp , "lvtime" : lvtime};
	
	$.ajax({
		url : 'research'
		, method : 'GET'
		, data : researchData
		, success : function(resp){
			$('#chargetime').html(resp['result'] + " hours");
			$('#plustime').html(resp['lvtime'] + " hours");
		}
	});

};
</script>
<style>
.bgon{
	background-color : red;
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
				<th style="height: 50px; background-color: #68CC74;"><a href="/std/" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Purchase of Products</th>
			</tr>
		</table>
		<div class="context" style="padding-bottom: 0;">
			<table width="460">
				<tr class="pretd">
					<td class="division" style="background-color: #ededed;">Division</td>
					<td class="time" style="background-color: #ededed;">Time</td>
				</tr>
				<tr class="pretd">
					<td class="division">Time package remaining time</td>
					<td class="time">${lavetime} hours<input type="hidden" id="lvtime" value="${lavetime}"></td>
					
				</tr>
				<tr class="pretd">
					<td class="division">Charging time</td>
					<td class="time" id="chargetime">0 hours</td>
				</tr>
				<tr class="pretd">
					<td class="division">Total time after charging</td>
					<td class="time" id="plustime">0 hours</td>
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
			<c:forEach var="product" items="${list}">
				<tr class="purclick" id="${product.productcode}" onclick="javascript:cal('${product.productcode}');">
					<td class="division">${product.productname}</td>
					<td class="time">${product.expirytime}</td>
					<td class="time">${product.price} WON</td>
				</tr>
			</c:forEach>
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