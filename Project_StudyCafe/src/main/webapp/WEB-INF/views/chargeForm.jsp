<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ chargeForm ]</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  
<script>
$(function(){
	let type = $("#typechk").val();
	
	let myData = {"type" : type};
	
	$.ajax({
		url : 'chargeChk'
		, method : 'GET'
		, data : myData
		, success : function(resp){
			if(resp == "FAIL"){
				alert("이미 충전한 상품 존재");
				location.href="/std/";
			}
		}
	})
	
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
	$(".purclick").css("background-color","white");
	$('#'+resp).css("background-color","red");
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
	
	let atResp = resp.charAt(0);
	
		$.ajax({
			url : 'research'
			, method : 'GET'
			, data : researchData
			, success : function(resp){
				$('#exp').val(resp['expiry']); //유효기간 쓸일 있는지 향후 체크
				
				$('#inputCharge').html(resp['result'] + " days");
				$('#plustime').html(resp['lvtime'] + " days");
				
			}
		});
	
};

function cal2(resp){
	$(".purclick").css("background-color","white");
	$('#'+resp).css("background-color","red");
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
	$('#trCod').val(resp);
	
	let researchData = {"code" : resp};
	
	$.ajax({
		url : 'timeChk'
		, method : 'GET'
		, data : researchData
		, success : function(resp2){
		
			$('#lvtimeone').val(resp2);
		}
	})
	
}

function hourCharge(param){
	let cod = $('#cod').val();

	if(cod == ""){
		alert("상품을 선택해");
		return; 
	}
	
	$('#hidCharge').val(param);
	
	let hidCharge = $('#hidCharge').val();
	
	let lvtime = $("#lvtime").val();
	let researchData = {"lvtime" : lvtime , "hidCharge" : hidCharge};
	
	
	$.ajax({
		url : 'research2'
		, method : 'GET'
		, data : researchData
		, success : function(resp){
			$('#plustime').html(resp + " hours");
		}
	});
}

function chargeTime(){
	let cod = $('#cod').val();
	let typeChk = $('#typechk').val();
	let lvtimeone = $('#lvtimeone').val();
	
	if(cod == '' && typeChk == 'C'){
		alert("상품을 선택해");
		return;
	}
	let chargetime = '';
	if(typeChk == 'C'){
		
		let charge = $('#inputCharge').html();

		chargetime += charge.split(' ')[0];
	} else {
		let time = $('#hidCharge').val();
		chargetime += time; 
	}
	
	if(chargetime == ''){
		alert("충전시간을 선택해");
		return;
	}
	
	
	if(parseInt(lvtimeone) < parseInt(chargetime)){
		alert("충전 시간 부족");
		return;
	}
	
	
	let type = $("#typechk").val();
	location.href='inputCharge?type='+typeChk+'&cod='+cod+'&chargetime='+chargetime;
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

#UseBtn {
	padding: 15px 233px;
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
				<th style="height: 50px; background-color: #68CC74;"><a href="/std/" id="HomeBtn" class="highlight">Home</a></th>
				<th style="background-color: #213d62;">charge of Products</th>
			</tr>
		</table>
		<div class="context" style="padding-bottom: 0;">
			<table width="460">
				<tr class="pretd">
					<td class="division" style="background-color: #ededed;">Division<input type="hidden" id="typechk" value="${productType}"></td>
					<td class="time" style="background-color: #ededed;">Time</td>
				</tr>
				<tr class="pretd">
				<!-- 선택한 패키지의 남아있는 시간 -->
					<td class="division">Time package remaining time<input type="hidden" id="lvtime" value="${lavetime}"><input type="hidden" id="lvtimeone" value=""></td>
					<td class="time" id="firstlv">${lavetime} hours</td>
				</tr>
				<tr class="pretd">
				<!-- 충전할 시간 입력 -->
					<td class="division">Charging time<input type="hidden" id="hidCharge" value=""></td>
					
					<c:if test="${productType== 'B'}">
					<td class="time" id="chargetime">
						<input type="button" id="inputCharge1" value="1 hours" onclick="hourCharge(1);" style="width: 60px;">
						<input type="button" id="inputCharge3" value="3 hours" onclick="hourCharge(3);"style="width: 60px;">
						<input type="button" id="inputCharge5" value="5 hours" onclick="hourCharge(5);"style="width: 60px;">
					</td>
					</c:if>
					<c:if test="${productType== 'C'}">
					<td class="time" id="inputCharge">${lavetime} days</td>
					</c:if>
					
				</tr>
				<tr class="pretd">
				<!-- 선택한 패키지에서 남아있는 시간 - 충전할 시간 -->
					<td class="division">remaining time after charging</td>
					<td class="time" id="plustime">0 hours</td>
				</tr>
			</table>
		</div>
		<div class="context">
			<table width="460">
				<tr>
					<td style="background-color: #ededed;" class="division">Product name<input type="hidden" id="cod" value=""><input type="hidden" id="trCod" value=""></td>
					<td style="background-color: #ededed; text-align: right;">lave Time</td>
					<td style="background-color: #ededed; text-align: right;">Effective days<input type="hidden" id="exp" value=""></td>
				</tr>
			<c:if test="${productType == 'B'}">
			<c:forEach var="trade" items="${list}">
				<tr class="purclick" id="${trade.tradenum}" onclick="javascript:cal2('${trade.tradenum}');">
					<td class="division">${trade.productname}</td>
					<td class="time">${trade.lavetime} hours</td>
					<td class="time">${trade.laveexpiry}</td>
					
				</tr>
			</c:forEach>
			</c:if>
				
			<c:if test="${productType == 'C'}">
			<c:forEach var="trade" items="${list}">
				<tr class="purclick" id="${trade.productcode}" onclick="javascript:cal('${trade.productcode}');">
					<td class="division">${trade.productname}</td>
					<td class="time">${trade.lavetime} days</td>
					<td class="time">${trade.laveexpiry}</td>
				</tr>
			</c:forEach>
			</c:if>
			</table>
		</div>
		<table width="500">
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="javascript:chargeTime();" id="UseBtn" class="highlight">Use</a></th>
			</tr>
		</table>
	</div>
</body>
</html>