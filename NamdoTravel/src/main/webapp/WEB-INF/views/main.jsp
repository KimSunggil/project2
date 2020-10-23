<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="java.util.*" %>
   <%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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
console.log(hours);

if(month.length == 1){ 
  month = "0" + month; 
} 
if(day.length == 1){ 
  day = "0" + day; 
}

var d_day = year+month+day;
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
	var areas = [
		["전라남도",126.853
, 35.156
],
		["광주",126, 35],
		["목포",126, 34],
		["여수",127, 34],
		["순천",127, 34],
		["광양",127, 34],
		["나주",126, 35],
		["담양", 126, 35],
		["곡성",127, 35],
		["구례",127, 35],
		["고흥",127, 34],
		["보성",127, 34],
		["화순",126, 35],
		["강진",126, 35],
		["장흥",126, 34],
		["해남",126, 34],
		["영암",126, 34],
		["무안",126, 34],
		["함평",126, 35],
		["영광",126, 35],
		["장성",126, 35],
		["완도",126, 34],
		["진도",126 ,34],
		["신안",126, 34]
	];
		for(var i=0; i<24; i++){
			(function(){
				wae(areas[i][0],areas[i][1],areas[i][2]);
			})(i)
		};
});
function wae(area,ny,nx){
	var url="<%=cp%>/weather/search2";
	var base_date=d_day;
	var base_time="0200";
	var area;
	var query="base_date="+base_date+"&base_time="+base_time+"&nx="+nx+"&ny="+ny;
	
	var out="";
	var fn=function(data) {
		// console.log(data);
		var category;
		var fcstDate, fcstTime; // 발표일자, 시간
		var fcstValue;
		
		if(! data.response.body) {
			alert("등록된 정보가 없습니다.");
			return false;
		}
		out+="<tr>";
		var list=data.response.body.items.item;
		out+="<td>"+area;+"</td>"
		for(var j=0; j<64; j++){
			
		    if(list[j].category=="POP"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+"ㄱ"+list[j].fcstValue+"</td>"
		        }
		    }
		    if(list[j].category=="PTY"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+"ㄴ"+list[j].fcstValue+"</td>"
		        }
		    }
		    if(list[j].category=="REH"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+"ㄷ"+fcstValue+"</td>"
		        }
		    }
		    if(list[j].category=="SKY"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+"ㄹ"+list[j].fcstValue+"</td>"
		        }
		    }
		    if(list[j].category=="T3H"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+"ㅂ"+list[j].fcstValue+"</td>"
		        }
		    }
		    if(list[j].category=="TMN"){
		            out+="<td>"+"ㅈ"+list[j].fcstValue+"</td>"
		    }
		    if(list[j].category=="TMX"){
		            out+="<td>"+"ㅅ"+list[j].fcstValue+"</td>"
		    }
		    if(list[j].category=="WSD"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+"ㅎ"+list[j].fcstValue+"</td>"
		        }
		    }
		}
/* 		category=list[0].category;
		fcstDate=list[0].fcstDate;
		fcstTime=list[0].fcstTime;
		fcstValue=list[0].fcstValue;
		out+="<tr>";
		out+="<td>"+area+"</td>"; */
		/* out+="발표일자 : "+fcstDate+"<br>";
		out+="발표시간 : "+fcstTime+"<br>"; */
/* 		out+="<td>"+fcstValue+"%"+"</td>";
		category=list[1].category;
		fcstDate=list[1].fcstDate;
		fcstTime=list[1].fcstTime;
		fcstValue=list[1].fcstValue;
		if(fcstValue=="0") {
			out+="<td>"+"없음"+"</td>";
		} else if(fcstValue=="1") {
			out+="<td>"+"비"+"</td>";
		} else if(fcstValue=="2") {
			out+="<td>"+"비/눈"+"</td>";
		} else if(fcstValue=="3") {
			out+="<td>"+"눈"+"</td>";
		} else if(fcstValue=="4") {
			out+="<td>"+"소나기"+"</td>";
		} else if(fcstValue=="5") {
			out+="<td>"+"빗방울"+"</td>";
		} else if(fcstValue=="6") {
			out+="<td>"+"빗방울/눈날림"+"</td>";
		} else if(fcstValue=="7") {
			out+="<td>"+"눈날림"+"</td>";
		}
		category=list[2].category;
		fcstDate=list[2].fcstDate;
		fcstTime=list[2].fcstTime;
		fcstValue=list[2].fcstValue;
		if(fcstValue=="0") {
			out+="<td>"+"없음"+"</td>";
		}else{
			out+="<td>"+"6시간 강수량 : "+fcstValue+"mm"+"</td>"
		}
		category=list[3].category;
		fcstDate=list[3].fcstDate;
		fcstTime=list[3].fcstTime;
		fcstValue=list[3].fcstValue;
		out+="<td>"+fcstValue+"%"+"<td>"
		category=list[5].category;
		fcstDate=list[5].fcstDate;
		fcstTime=list[5].fcstTime;
		fcstValue=list[5].fcstValue;
		if(fcstValue=="1") {
			out+="<td>"+"맑음"+"<td>";
		} else if(fcstValue=="3") {
			out+="<td>"+"구름 많음"+"<td>";
		} else if(fcstValue=="4") {
			out+="<td>"+"흐림"+"<td>";
		}
		category=list[6].category;
		fcstDate=list[6].fcstDate;
		fcstTime=list[6].fcstTime;
		fcstValue=list[6].fcstValue;
		out+="<td>"+fcstValue+"℃"+"</td>"
		category=list[8].category;
		fcstDate=list[8].fcstDate;
		fcstTime=list[8].fcstTime;
		fcstValue=list[8].fcstValue;
		out+="<td>"+fcstValue+"m/s"+"</td>"
		out+="</tr>"
			console.log(out);
		console.log(list); */
/* 			if(fcstValue=="1") {
			out+="하늘상태 : 맑음<br>";
		} else if(fcstValue=="3") {
			out+="하늘상태 : 구름 많음<br>";
		} else if(fcstValue=="4") {
			out+="하늘상태 : 흐림<br>";
		} */
/* 			out+="섭씨온도:"+fcstValue+"<br>"; */
		console.log(list)
		out+="</tr>";
		document.getElementById("resultLayout").innerHTML+=out;
		
	};
	
	ajaxJSON(url, "post", query, fn);
};
</script>
   <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
  <link href="./resources/css/small-business.css" rel="stylesheet">
    <link href="./resources/css/weather.css" rel="stylesheet">
    <style>
    #weatherTb{
	border-color: black;
	border: 1px;
	border-style: solid;
	width:100%;
	justify-content: center;
	color:black;
}
    </style>
</head>
<body>
<jsp:include page="includejsp/menubar.jsp"></jsp:include>
<div>

	
	<div class="container" id="container">
		<h1>동네예보</h1>
	<hr>
		<table id="weatherTb">
			<thead>
				<tr>
					<th>지역</th>
					<th>강수확률</th>
					<th>비 형태</th>
					<th>6시간 강수량</th>
					<th>습도</th>
					<th>낮 최저기온</th>
					<th>풍속(동서기준)</th>
					<th>풍속(동서기준)</th>
					<th>풍속(동서기준)</th>
				</tr>
			</thead>
			<tbody id="resultLayout">
				<tr>
				
				</tr>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="includejsp/footer.jsp"></jsp:include>
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>