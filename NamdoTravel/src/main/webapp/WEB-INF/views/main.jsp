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
		["평균날씨",126
, 35
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
			
		    if(list[j].category==="POP"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+list[j].fcstValue+"%"+"</td>"
		        }
		    }
		    if(list[j].category=="PTY"){
		        if(list[j].fcstTime==hours){
		        	fcstValue=list[j].fcstValue;
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
		        }
		    }
		    if(list[j].category=="REH"){
		        if(list[j].fcstTime==hours){
		        	fcstValue=list[j].fcstValue;
		            out+="<td>"+fcstValue+"%"+"</td>"
		        }
		    }
		    if(list[j].category=="SKY"){
		        if(list[j].fcstTime==hours){
		        	fcstValue=list[j].fcstValue;
		        	if(fcstValue=="1") {
		    			out+="<td>"+"맑음"+"<td>";
		    		} else if(fcstValue=="3") {
		    			out+="<td>"+"구름 많음"+"<td>";
		    		} else if(fcstValue=="4") {
		    			out+="<td>"+"흐림"+"<td>";
		    		}
		        }
		    }
		    if(list[j].category=="T3H"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+list[j].fcstValue+"℃"+"</td>"
		        }
		    }
		    if(list[j].category=="TMN"){
		            out+="<td>"+"최저기온"+list[j].fcstValue+"℃"+"</td>"
		    }
		    if(list[j].category=="UUU"){
		        if(list[j].fcstTime==hours){
		            out+="<td>"+list[j].fcstValue+"m/s"+"</td>"
		        }
		    }
		    if(list[j].category==="TMX"){
	            out+="<td>"+"최고기온"+list[j].fcstValue+"℃"+"</td>"
	    	}
		    
		}
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
	text-align: center;
	color:black;
		}
	thead{
	text-align: center;
	}
	th{
	text-align: center;
	border-color: black;
	border: 1px;
	border-style: solid;
	}
	td{
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
		<table id="weatherTb">
			<thead>
				<tr>
					<th>지역</th>
					<th>강수확률</th>
					<th>강수형태</th>
					<th>습도</th>
					<th>하늘 상태</th>
					<th></th>
					<th>3시간 기준 최저기온</th>
					<th>최저기온</th>
					<th>풍속</th>
					<th>최고기온</th>
				</tr>
			</thead>
			<tbody id="resultLayout">
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="includejsp/footer.jsp"></jsp:include>
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>