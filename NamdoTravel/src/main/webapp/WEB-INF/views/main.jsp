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
document.addEventListener("DOMContentLoaded",function(){
	var areas = new Array();
	<c:forEach items="${weather}" var="weather">
	 areas.push(["${weather.city}","${weather.gridX}","${weather.gridY}"]);
	</c:forEach>
		for(var i=0; i<24; i++){
			(function(){
				weather(areas[i][0],areas[i][1],areas[i][2]);
			})(i)
		};
});
function weather(area,nx,ny){
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	var hours = date.getHours();

	if(20<hours){
		hours="2100";
	}else if(17<hours){
		hours="1800";
	}else if(14<hours){
		hours="1500";
	}else if(11<hours){
		hours="1200";
	}else if(8<hours){
		hours="0900";
	}else if(0<hours){
		hours="0600";
	}

	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	}
	var d_day = year+month+day;
	var url="<%=cp%>/weather/search2";
	var base_date = d_day;
		var base_time = "0200";
		var area;
		var query = "base_date=" + base_date + "&base_time=" + base_time
				+ "&nx=" + nx + "&ny=" + ny;

		var out = "";
		var fn = function(data) {
			// console.log(data);
			var category;
			var fcstDate, fcstTime; // 발표일자, 시간
			var fcstValue;

			if (!data.response.body) {
				alert("등록된 정보가 없습니다.");
				return false;
			}
			out += "<tr>";
			var list = data.response.body.items.item;

			out += "<td>" + area;
			+"</td>"

			for (var j = 0; j < 64; j++) {

				if (list[j].category === "POP") {
					if (list[j].fcstTime == hours) {
						out += "<td>" + list[j].fcstValue + "%" + "</td>"
					}
				}
				if (list[j].category == "PTY") {
					if (list[j].fcstTime == hours) {
						fcstValue = list[j].fcstValue;
						if (fcstValue == "0") {
							out += "<td>" + "없음" + "</td>";
						} else if (fcstValue == "1") {
							out += "<td>" + "비" + "</td>";
						} else if (fcstValue == "2") {
							out += "<td>" + "비/눈" + "</td>";
						} else if (fcstValue == "3") {
							out += "<td>" + "눈" + "</td>";
						} else if (fcstValue == "4") {
							out += "<td>" + "소나기" + "</td>";
						} else if (fcstValue == "5") {
							out += "<td>" + "빗방울" + "</td>";
						} else if (fcstValue == "6") {
							out += "<td>" + "빗방울/눈날림" + "</td>";
						} else if (fcstValue == "7") {
							out += "<td>" + "눈날림" + "</td>";
						}
					}
				}
				if (list[j].category == "REH") {
					if (list[j].fcstTime == hours) {
						fcstValue = list[j].fcstValue;
						out += "<td>" + fcstValue + "%" + "</td>"
					}
				}
				if (list[j].category == "SKY") {
					if (list[j].fcstTime == hours) {
						fcstValue = list[j].fcstValue;
						if (fcstValue == "1") {
							out += "<td>" + "맑음" + "<td>";
						} else if (fcstValue == "3") {
							out += "<td>" + "구름 많음" + "<td>";
						} else if (fcstValue == "4") {
							out += "<td>" + "흐림" + "<td>";
						}
					}
				}
				if (list[j].category == "T3H") {
					if (list[j].fcstTime == hours) {
						out += "<td>" + list[j].fcstValue + "℃" + "</td>"
					}
				}
				if (list[j].category == "TMN") {
					out += "<td>" + "최저기온" + list[j].fcstValue + "℃" + "</td>"
				}
				if (list[j].category == "UUU") {
					if (list[j].fcstTime == hours) {
						out += "<td>" + list[j].fcstValue + "m/s" + "</td>"
					}
				}
				if (list[j].category === "TMX") {
					out += "<td>" + "최고기온" + list[j].fcstValue + "℃" + "</td>"
				}
			}
			out += "</tr>";
			document.getElementById("resultLayout").innerHTML += out;

		};
		ajaxJSON(url, "post", query, fn);
	};

</script>
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
				<!-- 이미지 지도를 표시할 div 입니다 -->
				<div id="staticMap" style="width:60vw;height:70vh;"></div>    
				<table id="weatherTb">
					<thead>
						<tr>
						</tr>
					</thead>
					<tbody id="resultLayout">
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c731503805ccfcc41946121c0050cfc"></script>
	<script>    
			var markers = new Array();
			<c:forEach items="${weather}" var="weather">
			 markers.push([{position: new kakao.maps.LatLng(${weather.latitude},${weather.longitude}),text:'${weather.city}'}]);
			</c:forEach>
				var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
				    staticMapOption = { 
				        center: new kakao.maps.LatLng(34.97385, 126.97021), // 이미지 지도의 중심좌표
				        level: 11, // 이미지 지도의 확대 레벨
				        marker: markers // 이미지 지도에 표시할 마커 
				    };    
console.log(markers);
				// 이미지 지도를 생성합니다
				var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>    
	<jsp:include page="includejsp/footer.jsp"></jsp:include>
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


