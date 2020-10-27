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
<title></title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
<script>
$(function(){
	$('img[usemap]').rwdImageMaps();
	$("#img").width("100%");
});
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
img[usemap] {
	border: none;
	height: auto;
	max-width: 100%;
	width: auto;
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
			<img id="Image-Maps-Com-image-maps-2020-10-27-064121" src="https://www.image-maps.com/m/private/0/b8uufhongbr0cnq99idbkrm037_.jpg" border="0" width="1024" height="768" orgWidth="1024" orgHeight="768" usemap="#image-maps-2020-10-27-064121" alt="" />
			<map name="image-maps-2020-10-27-064121" id="ImageMapsCom-image-maps-2020-10-27-064121">
			
			
			
			<area  alt="" title="" href="#" shape="rect" coords="820,151,870,201" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="874,233,924,283" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="873,339,923,389" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="755,250,805,300" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="691,145,741,195" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="581,241,631,291" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="651,320,701,370" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="712,418,762,467" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="533,349,583,398" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="438,235,488,284" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="500,180,550,229" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="572,118,622,167" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="460,381,510,430" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="360,468,410,517" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="434,548,484,597" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="216,490,266,539" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="399,328,449,377" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="307,280,357,329" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="245,308,295,357" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="356,197,406,246" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="454,119,504,168" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="324,111,374,160" style="outline:none;" target="_self"     />
			<area  alt="" title="" href="#" shape="rect" coords="143,315,193,364" style="outline:none;" target="_self"     />
			<area shape="rect" coords="1022,766,1024,768" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
			</map>
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
						var pty = "<td>" + '<img src="../resources/img/sun.gif">' + "</td>";
					} else if (fcstValue == "1") {
						var pty = "<td>" + '<img src="../resources/img/rain.png">' + "</td>";
					} else if (fcstValue == "2") {
						var pty = "<td>" + '<img src="../resources/img/rain-or-snow.ico">' + "</td>";
					} else if (fcstValue == "3") {
						var pty = "<td>" + '<img src="../resources/img/snow.png">' + "</td>";
					} else if (fcstValue == "4") {
						var pty = "<td>" + '<img src="../resources/img/rain.png">' + "</td>";
					} else if (fcstValue == "5") {
						var pty = "<td>" + '<img src="../resources/img/rain.png">' + "</td>";
					} else if (fcstValue == "6") {
						var pty = "<td>" + '<img src="../resources/img/rain-or-snow.ico">' + "</td>";
					} else if (fcstValue == "7") {
						var pty = "<td>" + '<img src="../resources/img/snow.png">' + "</td>";
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
						var sky ="<td>"+'<img src="../resources/img/sun.gif">'+"</td>";
					} else if (fcstValue == "3") {
						var sky ="<td>"+'<img src="../resources/img/cloud.png">'+"</td>";
					} else if (fcstValue == "4") {
						var sky ="<td>"+'<img src="../resources/img/cloudy.png">'+"</td>";
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
};
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


