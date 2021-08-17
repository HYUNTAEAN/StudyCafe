<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ seatForm ]</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script>
function seatChk(seat){
	let seatnum = {"seatnum" : seat};

	$.ajax({
		url : 'seatChk'
		, method : 'GET'
		, data : seatnum
		, success : function(resp){
			if(resp == "FAIL"){
				alert("Please check the Other Seat");
				return;
			}
		}
	});
	
	// input css
	let proType = $("#proType").val();
	$("#numSeat").val(seat);
}

function inuse(){
	let seatnum = $("#numSeat").val();
	
	if(seatnum == ""){
		alert("please check your seat");
		return;
	}
	
	let proType = $("#proType").val();
	
	if(proType == 'D'){
		alert("Seat Changed : " + seatnum);
		location.href="useChange?seatnum=" + seatnum + "&proType=" + proType;
	} else {
		location.href="inuse?seatnum=" + seatnum + "&proType=" + proType;
	}
};
</script>
<style>
table{
	margin: auto;
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
a {
	text-decoration : none; 
}
#allSeat {
	padding: 20px;
	width: 460px;
	margin: auto;
	background-color: #e3ddd1;
	position: relative;
}
.seatSection {
	position: absolute;
}
#section1 {
	height: 430px; 
	width: 30px; 
	top: 35px;
}
#section2 {
	height: 460px; 
	width: 30px; 
	left: 110px;
}
#section3 {
	height: 460px; 
	width: 30px; 
	left: 155px;
}
#section4 {
	height: 100px; 
	width: 140px; 
	left: 230px;
}
#section5 {
	height: 300px; 
	width: 30px; 
	left: 220px;
	top: 175px;
}
#section6 {
	height: 300px; 
	width: 30px; 
	left: 265px;
	top: 175px;
}
#section7 {
	height: 500px; 
	width: 30px; 
	left: 365px;
}
#section8 {
	height: 300px; 
	width: 30px; 
	right: 20px;
}
#homeBtn {
	padding: 15px 100px;
	color: white;
}
#backBtn {
	padding: 15px 105px;
	color: white;
}
#completeBtn {
	padding: 15px 85px;
	color: white;
}
.seatbtn {
	height: 30px;
	width: 30px;
	margin-bottom: 3px;
	border: solid #1E6EC7 3px;
	background-color: white;
	color: #1E6EC7;
	font-size: 12px;
}
.headerBtn {
	width: 15px;
	height: 15px;
	padding: 0px;
}
#Available {
	border: solid #1E6EC7 3px;
	background-color: white;
}
#NotAvailable {
	background-color: #353535;
	border: solid #353535 3px;
}
#Selected {
	border: solid #1E6EC7 3px;
	background-color: #1E6EC7;
}
</style>
</head>
<body>
	<div id="wrap">
		<table width="500">
			<tr>
				<th style="height: 50px;">STUDYCAFE</th>
				<th>SCIT41 Branch</th>
			</tr>
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="/std/" id="homeBtn">Home<input type="hidden" id="numSeat" value=""></a></th>
				<th style="background-color: #213d62;">Select Seat<input type="hidden" id="proType" value="${productType}"></th>
			</tr>
		</table>
		<table width="500" style="background-color: #E4F1EE;">
			<tr>
				<td>
					<input type="button" id="Available" class="headerBtn">
					<span style="padding-right: 20px;">Available</span>
					<input type="button" id="NotAvailable" class="headerBtn">
					<span style="padding-right: 20px;">Not Available</span>
					<input type="button" id="Selected" class="headerBtn">
					<span style="padding-right: 20px;">Selected</span>
				</td>
			</tr>
		</table>
		<div id="allSeat" style="height: 455px;">
			<div id="section1" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="0" end="12" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">
			</c:forEach>
			</div>
			<div id="section2" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="13" end="24" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">
			
			</c:forEach>
			</div>
			<div id="section3" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="25" end="36" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">
			
			</c:forEach>
			</div>
			<div id="section4" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="37" end="44" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">
			
			</c:forEach>
			</div>
			<div id="section5" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="45" end="50" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">
				
			</c:forEach>
			</div>
			<div id="section6" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="51" end="57" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">
				
			</c:forEach>
			</div>
			<div id="section7" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="58" end="69" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">

			</c:forEach>
			</div>
			<div id="section8" class="seatSection">
			<c:forEach var="seat" items="${list}" begin="70" end="82" step="1">
				<input type="button" value="${seat.seatnum}" class="seatbtn" onclick="javascript:seatChk(${seat.seatnum})">

			</c:forEach>
			</div>
		</div>
		<table width="500">
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="/std/" id="backBtn">Back</a></th>
				<th style="height: 50px; background-color: #88837d;"><a href="javascript:inuse();" id="completeBtn">Complete</a></th>
			</tr>
		</table>
	</div>
</body>
</html> 