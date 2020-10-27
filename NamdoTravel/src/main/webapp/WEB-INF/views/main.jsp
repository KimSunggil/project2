<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<link href="./resources/css/weather.css" rel="stylesheet">
<style>
#weatherTb {
	border-color: black;
	border: 1px;
	border-style: solid;
	width: 100%;
	text-align: center;
	color: black;
}

thead {
	text-align: center;
}

th {
	text-align: center;
	border-color: black;
	border: 1px;
	border-style: solid;
}

td {
	text-align: center;
	border-color: black;
	border: 1px;
	border-style: solid;
}
</style>
</head>
<body>
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	<div>
		<div class="container" id="container">
			<h1>동네예보</h1>
			<hr>
			<div class="bg-white rounded shadow-sm">
			<div>
				<a href="#" id="yesD" class="btn btn-primary btn-sm">어제</a>
				<a href="#" id="toD" class="btn btn-primary btn-sm">오늘</a>
				<a href="#" id="tomD" class="btn btn-primary btn-sm">내일</a>
			</div>
				<table id="weatherTb">
					<tbody id="resultLayout">
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<jsp:include page="includejsp/footer.jsp"></jsp:include>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
function ajaxJSON(url, type, query, fn) {
		$.ajax({
			type:type,
			url:url,
			data:query,
			dataType:"json",
			success:function(data) {
				fn(data);
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
	}
document.addEventListener("DOMContentLoaded", function() {
function weather(area,nx,ny,d_day,hours){
	var url="<%=cp%>/weather/search2";
	var base_date = d_day;
	var base_time = "0200";
	var area;
	var out = "";
	var query = "base_date=" + base_date + "&base_time="
	+ base_time + "&nx=" + nx + "&ny=" + ny;
	var fn = function(data) {
		var category;
		var fcstDate, fcstTime; // 발표일자, 시간
		var fcstValue;
		if (!data.response.body) {
			alert("등록된 정보가 없습니다.");
			return false;
		}
		var list = data.response.body.items.item;
		out += "<tr>"
		out += "<td>" + area + "</td>"
		for (var j = 0; j < 64; j++) {
			if (list[j].category === "POP") {
				if (list[j].fcstTime == hours) {
					var pop = "<td>" + list[j].fcstValue + "%" + "</td>"
					var fcstTime = "<td>" + list[j].fcstTime + "</td>"
					var fcstDate = "<td>" + list[j].fcstDate + "</td>"
					/* out += "<td>" + list[j].fcstValue + "%" + "</td>" */
					}
				}
			if (list[j].category == "PTY") {
				if (list[j].fcstTime == hours) {
					fcstValue = list[j].fcstValue;
					pty = list[j].fcstValue
					if (fcstValue == "0") {
						var pty = "<td>" + "없음" + "</td>";
					} else if (fcstValue == "1") {
						var pty = "<td>" + "비" + "</td>";
					} else if (fcstValue == "2") {
						var pty = "<td>" + "비/눈" + "</td>";
					} else if (fcstValue == "3") {
						var pty = "<td>" + "눈" + "</td>";
					} else if (fcstValue == "4") {
						var pty = "<td>" + "소나기" + "</td>";
					} else if (fcstValue == "5") {
						var pty = "<td>" + "빗방울" + "</td>";
					} else if (fcstValue == "6") {
						pty = "<td>" + "빗방울/눈날림" + "</td>";
					} else if (fcstValue == "7") {
						var pty = "<td>" + "눈날림" + "</td>";
					}
				}
			}
			if (list[j].category == "REH") {
				if (list[j].fcstTime == hours) {
					fcstValue = list[j].fcstValue;
					var reh = "<td>" + fcstValue + "%" + "</td>"
/* 						out += "<td>" + fcstValue + "%" + "</td>" */
				}
			}
			if (list[j].category == "SKY") {
				if (list[j].fcstTime == hours) {
					fcstValue = list[j].fcstValue;
					if (fcstValue == "1") {
						var sky ="<td>"+'맑음'+"</td>";
					} else if (fcstValue == "3") {
						var sky ="<td>"+'흐림'+"</td>";
					} else if (fcstValue == "4") {
						var sky ="<td>"+'구름많음'+"</td>";
					}
				}
			}
			if (list[j].category == "T3H") {
				if (list[j].fcstTime == hours) {
					var t3h = "<td>" + list[j].fcstValue + "℃"+ "</td>"
/* 						out += "<td>" + list[j].fcstValue + "℃" + "</td>" */
				}
			}
			if (list[j].category == "TMN") {
				var tmn = "<td>" + "최저기온" + list[j].fcstValue + "℃"+ "</td>"
/* 			out += "<td>" + "최저기온" + list[j].fcstValue + "℃" + "</td>" */
			}
			if (list[j].category == "UUU") {
				if (list[j].fcstTime == hours) {
					var uuu = "<td>" + list[j].fcstValue + "m/s"+ "</td>"
/* out += "<td>" + list[j].fcstValue + "m/s" + "</td>" */
				}
			}
			if (list[j].category === "TMX") {
				var tmx = "<td>" + "최고기온" + list[j].fcstValue + "℃"+ "</td>"
/* out += "<td>" + "최고기온" + list[j].fcstValue + "℃" + "</td>" */
			}
		}
		out += fcstDate+fcstTime+pop + pty + reh + sky + t3h + tmn + uuu + tmx;
		out += "</tr>"
		document.getElementById("resultLayout").innerHTML += out;
		console.log(list);
	};
	ajaxJSON(url, "post", query, fn);
}
	</script>
</body>
</html>
<!-- {
        position: new kakao.maps.LatLng(35.156974999999996,	126.85336388888888),
    	text: '광주' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    },{
        position: new kakao.maps.LatLng(34.808788888888884,	126.39441944444445),
    	text: '목포'
    },{
        position: new kakao.maps.LatLng(34.757311111111115,	127.66438611111111),
    	text: '여수'
    },{
        position: new kakao.maps.LatLng(34.947605555555555,	127.48933055555555),
    	text: '순천'
    },{
        position: new kakao.maps.LatLng(35.012838888888886,	126.71286666666667),
    	text: '나주'
    },{
        position: new kakao.maps.LatLng(34.93753611111111,	127.69817777777779),
    	text: '광양'
    },{
        position: new kakao.maps.LatLng(35.318125,	126.99016388888889),
    	text: '담양'
    },{
        position: new kakao.maps.LatLng(35.278955555555555,	127.29410833333333),
    	text: '곡성'
    },{
        position: new kakao.maps.LatLng(35.19945833333333,127.46493333333333),
    	text: '구례'
    },{
        position: new kakao.maps.LatLng(34.608069444444446,127.28705555555555),
    	text: '고흥'
    },{
        position: new kakao.maps.LatLng(34.76833333333333,127.08208888888889),
    	text: '보성'
    },{
        position: new kakao.maps.LatLng(35.061480555555555,126.98856666666667),
    	text: '화순'
    },{
        position: new kakao.maps.LatLng(34.678525,126.90910833333334),
    	text: '장흥'
    },{
        position: new kakao.maps.LatLng(34.63891111111111,126.76919722222222),
    	text: '강진'
    },{
        position: new kakao.maps.LatLng(34.570436111111114,126.60128888888889),
    	text: '해남'
    },{
        position: new kakao.maps.LatLng(34.79698888888889,126.69861944444445),
    	text: '영암'
    },{
        position: new kakao.maps.LatLng(34.98736944444445,126.4837),
    	text: '무안'
    },{
        position: new kakao.maps.LatLng(35.06274444444444,126.51861944444444),
    	text: '함평'
    },{
        position: new kakao.maps.LatLng(35.274166666666666,126.51408611111111),
    	text: '영광'
    },{
        position: new kakao.maps.LatLng(35.29881111111111,126.786975),
    	text: '장성'
    },{
        position: new kakao.maps.LatLng(34.307852777777775,126.75709722222223),
    	text: '완도'
    },{
        position: new kakao.maps.LatLng(34.48375,126.26554444444444),
    	text: '진도'
    },{
        position: new kakao.maps.LatLng(126.12666666666667,	34.752947222222225),
    	text: '신안'
    } -->


