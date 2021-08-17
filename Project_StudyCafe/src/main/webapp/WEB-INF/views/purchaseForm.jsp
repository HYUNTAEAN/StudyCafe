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
	let type = $("#typechk").val();
	let firstlave = $("#lvtime").val();
	if(type == 'C'){
		$('#firstlv').html(firstlave + " days");
		$('#chargetime').html("0 days");
		$('#plustime').html("0 days");
	}
	$(".pretd").css("background-color","white");
	$(".purclick").css("background-color","white");
});

function cal(resp){
	$(".purclick").css("color", "black");
	$(".purclick").on("mouseover", function () {
		$(this).css("background-color", "#1E6EC7")
		.css("color", "white");
	});
	$(".purclick").on("mouseout", function () {
		$(this).css("background-color", "white")
		.css("color", "black");
	});
	$(".purclick").css("background-color", "white");
	$('#'+resp).css("background-color","#213d62").css("color", "white");
	$('#'+resp).off("mouseout").off("mouseover");
	$('#cod').val(resp);
	
	let lvtime = $("#lvtime").val();
	let researchData = {"code" : resp , "lvtime" : lvtime};

	
	$.ajax({
		url : 'research'
		, method : 'GET'
		, data : researchData
		, success : function(resp){
			let type = $("#typechk").val();
			$('#exp').val(resp['expiry']);
			$('#pri').val(resp['price']);
			
			if(type == 'C'){
				$('#chargetime').html(resp['result'] + " days");
				$('#plustime').html(resp['lvtime'] + " days");
			} else {
			$('#chargetime').html(resp['result'] + " hours");
			$('#plustime').html(resp['lvtime'] + " hours");
			}
		}
	});
	
};

function payment(){

	let lavetime = $('#lvtime').val();
	let charge = $('#chargetime').html();
	let plus = $('#plustime').html();
	let expiry = $('#expiry').html();
	let chargetime = charge.split(' ')[0];
	let plustime = plus.split(' ')[0];
	let exp = $('#exp').val();
	let pri = $('#pri').val();
	let cod = $('#cod').val();
	
	if(chargetime == '0'){
		alert("상품을 선택해");
		return;
	}
	let type = $("#typechk").val();
	location.href='payment?lavetime='+lavetime+'&chargetime='+chargetime+'&plustime='+plustime+'&type='+type+'&expiry='+exp+'&price='+pri+'&cod='+cod;
}
$(function () {
	$(".purclick").on("mouseover", function () {
		$(this).css("cursor", "pointer");
		$(this).css("background-color", "#1E6EC7")
		.css("color", "white");
	});
	$(".purclick").on("mouseout", function () {
		$(this).css("background-color", "white")
		.css("color", "black");
	});
});
$(function () {
	$(".highlight").on("mouseover", function () {
		$(this).css("background-color", "#62C15B");
	});
	$(".highlight").on("mouseout", function () {
		$(this).css("background-color", "rgba(104, 204, 116, 1)");
	});
	$(".highlight").on("mousedown", function () {
		$(this).css("background-color", "rgba(104, 204, 116, 0.8)");
	});
});
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
				<th class="highlight" style="height: 50px; background-color: #68CC74;"><a href="/std/" id="HomeBtn">Home</a></th>
				<th style="background-color: #213d62;">Purchase of Products</th>
			</tr>
		</table>
		<div class="context" style="padding-bottom: 0;">
			<table width="460">
				<tr class="pretd">
					<td class="division" style="background-color: #ededed;">Division<input type="hidden" id="typechk" value="${productType}"></td>
					<td class="time" style="background-color: #ededed;">Time</td>
				</tr>
				<tr class="pretd">
					<td class="division">Time package remaining time<input type="hidden" id="lvtime" value="${lavetime}"></td>
					<td class="time" id="firstlv">${lavetime} hours</td>
					
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
					<td style="background-color: #ededed;" class="division">Product name<input type="hidden" id="cod" value=""></td>
					<td style="background-color: #ededed; text-align: right;">Effective days<input type="hidden" id="exp" value=""></td>
					<td style="background-color: #ededed; text-align: right;">Price<input type="hidden" id="pri" value=""></td>
				</tr>
			<c:forEach var="product" items="${list}">
				<tr class="purclick" id="${product.productcode}" onclick="javascript:cal('${product.productcode}');">
					<td class="division">${product.productname}</td>
					<td class="time">${product.expirytime} days</td>
					<td class="time">${product.price} WON</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<table width="500">
			<tr>
				<th class="highlight" style="height: 50px; background-color: #68CC74;"><a href="javascript:payment();" id="PaymentBtn"><b>Payment</b></a></th>
			</tr>
		</table>
	</div>
</body>
</html>