<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ seatForm ]</title>
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
				<th style="height: 50px; background-color: #68CC74;"><a href="#" id="homeBtn">Home</a></th>
				<th style="background-color: #213d62;">Select Seat</th>
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
				<input type="button" value="1" class="seatbtn">
				<input type="button" value="2" class="seatbtn">
				<input type="button" value="3" class="seatbtn">
				<input type="button" value="4" class="seatbtn">
				<input type="button" value="5" class="seatbtn">
				<input type="button" value="6" class="seatbtn">
				<input type="button" value="7" class="seatbtn">
				<input type="button" value="8" class="seatbtn">
				<input type="button" value="9" class="seatbtn">
				<input type="button" value="10" class="seatbtn">
				<input type="button" value="11" class="seatbtn">
				<input type="button" value="12" class="seatbtn">
				<input type="button" value="13" class="seatbtn">
			</div>
			<div id="section2" class="seatSection">
				<input type="button" value="14" class="seatbtn">
				<input type="button" value="15" class="seatbtn">
				<input type="button" value="16" class="seatbtn">
				<input type="button" value="17" class="seatbtn" style="margin-bottom: 33px;">
				<input type="button" value="18" class="seatbtn">
				<input type="button" value="19" class="seatbtn">
				<input type="button" value="20" class="seatbtn">
				<input type="button" value="21" class="seatbtn" style="margin-bottom: 33px;">
				<input type="button" value="22" class="seatbtn">
				<input type="button" value="23" class="seatbtn">
				<input type="button" value="24" class="seatbtn">
				<input type="button" value="25" class="seatbtn">
			</div>
			<div id="section3" class="seatSection">
				<input type="button" value="26" class="seatbtn">
				<input type="button" value="27" class="seatbtn">
				<input type="button" value="28" class="seatbtn">
				<input type="button" value="29" class="seatbtn" style="margin-bottom: 33px;">
				<input type="button" value="30" class="seatbtn">
				<input type="button" value="31" class="seatbtn">
				<input type="button" value="32" class="seatbtn">
				<input type="button" value="33" class="seatbtn" style="margin-bottom: 33px;">
				<input type="button" value="34" class="seatbtn">
				<input type="button" value="35" class="seatbtn">
				<input type="button" value="36" class="seatbtn">
				<input type="button" value="37" class="seatbtn">
			</div>
			<div id="section4" class="seatSection">
				<input type="button" value="38" class="seatbtn" style="margin-left: 98px;">
				<input type="button" value="39" class="seatbtn" style="margin-right: -3px;">
				<input type="button" value="40" class="seatbtn" style="margin-right: 30px;">
				<input type="button" value="41" class="seatbtn">
				<input type="button" value="42" class="seatbtn" style="margin-right: -3px;">
				<input type="button" value="43" class="seatbtn" style="margin-right: -3px;">
				<input type="button" value="44" class="seatbtn" style="margin-right: -3px;">
				<input type="button" value="45" class="seatbtn">
			</div>
			<div id="section5" class="seatSection">
				<input type="button" value="46" class="seatbtn">
				<input type="button" value="47" class="seatbtn">
				<input type="button" value="48" class="seatbtn" style="margin-bottom: 36px">
				<input type="button" value="49" class="seatbtn">
				<input type="button" value="50" class="seatbtn">
				<input type="button" value="51" class="seatbtn">
			</div>
			<div id="section6" class="seatSection">
				<input type="button" value="52" class="seatbtn">
				<input type="button" value="53" class="seatbtn">
				<input type="button" value="54" class="seatbtn">
				<input type="button" value="55" class="seatbtn">
				<input type="button" value="56" class="seatbtn">
				<input type="button" value="57" class="seatbtn">
				<input type="button" value="58" class="seatbtn">
			</div>
			<div id="section7" class="seatSection">
				<input type="button" value="59" class="seatbtn">
				<input type="button" value="60" class="seatbtn">
				<input type="button" value="61" class="seatbtn">
				<input type="button" value="62" class="seatbtn" style="margin-bottom: 45px;">
				<input type="button" value="63" class="seatbtn">
				<input type="button" value="64" class="seatbtn">
				<input type="button" value="65" class="seatbtn">
				<input type="button" value="66" class="seatbtn">
				<input type="button" value="67" class="seatbtn">
				<input type="button" value="68" class="seatbtn">
				<input type="button" value="69" class="seatbtn">
				<input type="button" value="70" class="seatbtn">
			</div>
			<div id="section8" class="seatSection">
				<input type="button" value="71" class="seatbtn">
				<input type="button" value="72" class="seatbtn">
				<input type="button" value="73" class="seatbtn">
				<input type="button" value="74" class="seatbtn">
				<input type="button" value="75" class="seatbtn" style="margin-bottom: 12px;">
				<input type="button" value="76" class="seatbtn">
				<input type="button" value="77" class="seatbtn">
				<input type="button" value="78" class="seatbtn">
				<input type="button" value="79" class="seatbtn">
				<input type="button" value="80" class="seatbtn">
				<input type="button" value="81" class="seatbtn">
				<input type="button" value="82" class="seatbtn">
				<input type="button" value="83" class="seatbtn">
			</div>
		</div>
		<table width="500">
			<tr>
				<th style="height: 50px; background-color: #68CC74;"><a href="#" id="backBtn">Back</a></th>
				<th style="height: 50px; background-color: #88837d;"><a href="#" id="completeBtn">Complete</a></th>
			</tr>
		</table>
	</div>
</body>
</html> 