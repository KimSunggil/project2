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
<style>
  table {
  	height:400px;
    width: 100%;
    border: 1px bold black; 
  }
td {
  	font:bold 30px;
    padding: 10px;
    text-align: center;
  }
  tr{
  	 border: 1px bold black; 
  }
.pty{
	width:100%;
	height:100%;
}
#area{
	color:black;
}
img[usemap] {
	border: none;
	height: auto;
	max-width: 100%;
	width: auto;
	}
area{
	cursor: pointer;
}
area:hover{
	
}
</style>
</head>
<body>
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	<div>
		<div class="container" id="container">
			<h1>오늘의 날씨!</h1>
			<hr>
			<div class="bg-white rounded shadow-sm">
			<div>
				<table id="weatherTb">
				<tbody>
					<tr>
						<td id="area" colspan="8">1</td>
					</tr>
					<tr>
						<td rowspan="2" id="pty">1</td>
						<td>강수확률</td>
						<td>습도</td>
						<td>하늘상태</td>
						<td>기온</td>
						<td>아침 최저기온</td>
						<td>낮 최고기온</td>
						<td>풍속(동서)</td>
					</tr>
					<tr>
						<td id="pop"></td>
						<td id="reh"></td>
						<td id="sky"></td>
						<td id="t3h"></td>
						<td id="tmn"></td>
						<td id="tmx"></td>
						<td id="uuu"></td>
					</tr>
				</tbody>
			</table>
			</div>
				
				<img id="Image-Maps-Com-image-maps-2020-10-27-064121" src="https://www.image-maps.com/m/private/0/b8uufhongbr0cnq99idbkrm037_.jpg" border="0" width="1024" height="768" usemap="#image-maps-2020-10-27-064121" alt="" />
			<map name="image-maps-2020-10-27-064121" id="ImageMapsCom-image-maps-2020-10-27-064121">
			
			
			
			<area  onmouseover="weatherBtn(8)" shape="rect" coords="820,151,870,201" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(5)" shape="rect" coords="874,233,924,283" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(2)" shape="rect" coords="873,339,923,389" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(3)" shape="rect" coords="755,250,805,300" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(7)" shape="rect" coords="691,145,741,195" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(11)"shape="rect" coords="581,241,631,291" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(10)"shape="rect" coords="651,320,701,370" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(9)" shape="rect" coords="712,418,762,467" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(12)" shape="rect" coords="533,349,583,398" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(4)" shape="rect" coords="438,235,488,284" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(0)" shape="rect" coords="500,180,550,229" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(6)" shape="rect" coords="572,118,622,167" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(13)" shape="rect" coords="460,381,510,430" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(14)" shape="rect" coords="360,468,410,517" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(20)" shape="rect" coords="434,548,484,597" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(21)" shape="rect" coords="216,490,266,539" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(15)" shape="rect" coords="399,328,449,377" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(16)" shape="rect" coords="307,280,357,329" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(1)" shape="rect" coords="245,308,295,357" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(17)" shape="rect" coords="356,197,406,246" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(19)" shape="rect" coords="454,119,504,168" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(18)" shape="rect" coords="324,111,374,160" style="outline:none;" target="_self"     />
			<area  onmouseover="weatherBtn(22)" shape="rect" coords="143,315,193,364" style="outline:none;" target="_self"     />
			<area shape="rect" coords="1022,766,1024,768" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
			</map>
			</div>
			<div id="map" style="width:100%;height:350px;"></div>
		</div>
	</div>
	<jsp:include page="includejsp/footer.jsp"></jsp:include>
	<script type="text/javascript"src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c731503805ccfcc41946121c0050cfc"></script>
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
function weatherBtn(i) {
	
		 var areas = new Array();
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate());
		var hours = date.getHours();
		var body = document.getElementsByTagName("body");
		
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
		<c:forEach items="${weather}" var="weather">
		areas.push([ "${weather.city}", "${weather.gridX}","${weather.gridY}","{weather.latitude}","${weatehr.longitude}" ]);
		</c:forEach>
		weather(areas[i][0], areas[i][1], areas[i][2],d_day,hours);
		
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
			document.getElementById("area").innerHTML = "<h1>"+area+"</h1>";
			for (var j = 0; j < 64; j++) {
				if(d_day == list[j].fcstDate){
				if (list[j].category === "POP") {
					if (list[j].fcstTime == hours) {
						var pop = list[j].fcstValue + "%"
						document.getElementById("pop").innerHTML = pop;
						var fcstTime = "<td>" + list[j].fcstTime + "</td>"
						var fcstDate = "<td>" + list[j].fcstDate + "</td>"
						/* out += "<td>" + list[j].fcstValue + "%" + "</td>" */
						}
					}
				if (list[j].category == "PTY") {
					if (list[j].fcstTime == hours) {
						fcstValue = list[j].fcstValue;
						if (fcstValue == "0") {
							var pty = '<img src="../resources/img/clear.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "1") {
							var pty ='<img src="../resources/img/rain.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "2") {
							var pty = '<img src="../resources/img/rain-or-snow.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "3") {
							var pty = '<img src="../resources/img/snow.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "4") {
							var pty ='<img src="../resources/img/rain.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "5") {
							var pty = '<img src="../resources/img/rain.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "6") {
							var pty ='<img src="../resources/img/rain-or-snow.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						} else if (fcstValue == "7") {
							var pty = '<img src="../resources/img/snow.jpg" class="pty">';
							document.getElementById("pty").innerHTML = pty;
						}
					}
				}
				if (list[j].category == "REH") {
					if (list[j].fcstTime == hours) {
						fcstValue = list[j].fcstValue;
						var reh = fcstValue + "%";
						document.getElementById("reh").innerHTML = reh;
	/* 						out += "<td>" + fcstValue + "%" + "</td>" */
					}
				}
				if (list[j].category == "SKY") {
					if (list[j].fcstTime == hours) {
						fcstValue = list[j].fcstValue;
						if (fcstValue == "1") {
							var sky ='맑음';
							document.getElementById("sky").innerHTML = sky;
						} else if (fcstValue == "3") {
							var sky ='흐림';
							document.getElementById("sky").innerHTML = sky;
						} else if (fcstValue == "4") {
							var sky ='구름많음';
							document.getElementById("sky").innerHTML = sky;
						}
					}
				} 
				if (list[j].category == "T3H") {
					if (list[j].fcstTime == hours) {
						var t3h = list[j].fcstValue + "℃"
						document.getElementById("t3h").innerHTML = t3h;
	/* 						out += "<td>" + list[j].fcstValue + "℃" + "</td>" */
					}
				}
				if (list[j].category == "TMN") {
					var tmn = list[j].fcstValue + "℃"
					document.getElementById("tmn").innerHTML = tmn;
	/* 			out += "<td>" + "최저기온" + list[j].fcstValue + "℃" + "</td>" */
				}
				if (list[j].category == "UUU") {
					if (list[j].fcstTime == hours) {
						var uuu = list[j].fcstValue + "m/s"
						document.getElementById("uuu").innerHTML = uuu;0
	/* out += "<td>" + list[j].fcstValue + "m/s" + "</td>" */
					}
				}
				if (list[j].category === "TMX") {
					var tmx =list[j].fcstValue + "℃"
					document.getElementById("tmx").innerHTML = tmx;
	/* out += "<td>" + "최고기온" + list[j].fcstValue + "℃" + "</td>" */
				}
				};
			};
			out += pty+fcstDate+fcstTime+pop + reh + t3h + tmn + uuu + tmx;
		};
		ajaxJSON(url, "post", query, fn);
		
	};
};
	</script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
<script>
$(function(e){
	$('img[usemap]').rwdImageMaps();
	$("#img").width("100%");
});
</script> 
</body>
</html>

