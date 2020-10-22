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
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	var areas = [
		[126, 34],
		[126, 35],
		[126, 34],
		[127, 34],
		[127, 34],
		[126, 35],
		[126, 35],
		[127, 35],
		[127, 35],
		[127, 34],
		[127, 34],
		[126, 35],
		[126, 35],
		[126, 34],
		[126, 34],
		[126, 34],
		[126, 34],
		[126, 35],
		[126, 35],
		[126, 35],
		[126, 34],
		[126 ,34],
		[126, 34]
	];
	document.getElementById("btnSend2").addEventListener("click",function(){
		for(var i=0; i<24; i++){
			console.log(areas[i][0],areas[i][1]);
			wae(areas[i][0],areas[i][1]);
		};
	});
});
function wae(ny,nx){
	var url="<%=cp%>/weather/search2";
	var base_date="20201022";
	var base_time="0200";
	var area = ""; 
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
		
		var list=data.response.body.items.item;
		category=list[0].category;
		fcstDate=list[0].fcstDate;
		fcstTime=list[0].fcstTime;
		fcstValue=list[0].fcstValue;
		out+='지역'+area+"<br>";
		out+="발표일자 : "+fcstDate+"<br>";
		out+="발표시간 : "+fcstTime+"<br>";
		out+="강수확률 : "+fcstValue+"%"+"<br>";
		category=list[1].category;
		fcstDate=list[1].fcstDate;
		fcstTime=list[1].fcstTime;
		fcstValue=list[1].fcstValue;
		if(fcstValue=="0") {
			out+="강수형태 : 맑음<br>";
		} else if(fcstValue=="1") {
			out+="강수형태 : 비<br>";
		} else if(fcstValue=="2") {
			out+="강수형태 : 비/눈<br>";
		} else if(fcstValue=="3") {
			out+="강수형태 : 눈<br>";
		} else if(fcstValue=="4") {
			out+="강수형태 : 소나기<br>";
		} else if(fcstValue=="5") {
			out+="강수형태 : 빗방울<br>";
		} else if(fcstValue=="6") {
			out+="강수형태 : 빗방울/눈날림<br>";
		} else if(fcstValue=="7") {
			out+="강수형태 : 눈날림<br>";
		}
		category=list[2].category;
		fcstDate=list[2].fcstDate;
		fcstTime=list[2].fcstTime;
		fcstValue=list[2].fcstValue;
		if(fcstValue=="0") {
		}else{
			out+="6시간 강수량 : "+fcstValue+"mm"+"<br>"
		}
		category=list[3].category;
		fcstDate=list[3].fcstDate;
		fcstTime=list[3].fcstTime;
		fcstValue=list[3].fcstValue;
		out+="습도 : "+fcstValue+"%"+"<br>"
		category=list[4].category;
		fcstDate=list[4].fcstDate;
		fcstTime=list[4].fcstTime;
		fcstValue=list[4].fcstValue;
		if(fcstValue=="0") {
		}else{
			out+="6시간 신적설 : "+fcstValue+"cm"+"<br>"
		}
		category=list[5].category;
		fcstDate=list[5].fcstDate;
		fcstTime=list[5].fcstTime;
		fcstValue=list[5].fcstValue;
		if(fcstValue=="1") {
			out+="하늘상태 : 맑음<br>";
		} else if(fcstValue=="3") {
			out+="하늘상태 : 구름 많음<br>";
		} else if(fcstValue=="4") {
			out+="하늘상태 : 흐림<br>";
		}
		category=list[6].category;
		fcstDate=list[6].fcstDate;
		fcstTime=list[6].fcstTime;
		fcstValue=list[6].fcstValue;
		out+="3시간 기온 : "+fcstValue+"℃"+"<br>"
		category=list[7].category;
		fcstDate=list[7].fcstDate;
		fcstTime=list[7].fcstTime;
		fcstValue=list[7].fcstValue;
		out+="아침최저 기온 : "+fcstValue+"℃"+"<br>"
		category=list[8].category;
		fcstDate=list[8].fcstDate;
		fcstTime=list[8].fcstTime;
		fcstValue=list[8].fcstValue;
		out+="풍속(동서) : "+fcstValue+"m/s"+"<br>"
		category=list[10].category;
		fcstDate=list[10].fcstDate;
		fcstTime=list[10].fcstTime;
		fcstValue=list[10].fcstValue;
		out+="풍속(남북) : "+fcstValue+"m/s"+"<br>"
		
/* 			if(fcstValue=="1") {
			out+="하늘상태 : 맑음<br>";
		} else if(fcstValue=="3") {
			out+="하늘상태 : 구름 많음<br>";
		} else if(fcstValue=="4") {
			out+="하늘상태 : 흐림<br>";
		} */
/* 			out+="섭씨온도:"+fcstValue+"<br>"; */
		
		document.getElmentById("resultLayout").innerHTML=out;
		
	};
	
	ajaxJSON(url, "post", query, fn);
};
</script>


</head>
<body>

<div>
	<h3>동네예보</h3>
	<div>
		<p> <button type="button" id="btnSend2">초단기  예보 확인</button> </p>
	</div>
	<hr>
	
	<div id="resultLayout"></div>
</div>

</body>
</html>