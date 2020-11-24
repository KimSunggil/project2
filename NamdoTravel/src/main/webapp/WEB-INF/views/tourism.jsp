<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관광</title>

<!-- Bootstrap core CSS -->
<link href=<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href=<c:url value="/resources/css/small-business.css"/> rel="stylesheet">

<style>
table {
	border-collapse: collapse;
}

th, td {
	text-align: center;
}

td {
	word-break: break-all;
	font-size: 13px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>

</head>


<body>

	<!-- Navigation -->
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">

			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<h1 class="fst_title">전라남도 관광지정보</h1>
			</div>


		</div>

		<div>
			<div id="map" style="width: 100%; height: 350px;"></div>

			<div>
				<select id="area_select">
						<option value="">지역</option>
					<c:forEach items="${areaList}" var="list">
						<option value="${list}">${list}</option>
					</c:forEach>
				</select>
				
				<select id="category_select">
					<option value="">항목</option>
					<c:forEach items="${sortationList}" var="list">
						<option value="${list}">${list}</option>
					</c:forEach>
				</select>
				
				<input type="button" id="seachBtn" value="검색" />
			</div>						
		</div>
		<!-- /.row -->

		<div style="width: 100%; height: 300px; overflow: auto">
			<table>
				<thead>
					<tr style="text-align: center;">
						<th style="width: 100px;">지역</th>
						<th style="width: 300px;">관광지</th>
						<th style="width: 300px;">관광지 주소</th>
						<th style="width: 100px;">주차여부</th>
						<th style="width: 200px;">홈페이지</th>
					</tr>
				</thead>

				<tbody id=infoTableBody>
  					
				</tbody>
			</table>
		</div>

	</div>
	<!-- /.container -->
	
	<br>

	<!-- Footer -->
		<jsp:include page="includejsp/footer.jsp"></jsp:include>


	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7cb307437cf02090b0b5c00c3eb40d9&libraries=services"></script>

	<script>
	document.addEventListener("DOMContentLoaded",function(){
		kakaoMaps(false);
		document.getElementById("seachBtn").addEventListener("click",function(){
			var seachResult = selectorFunc();
			mkTableBody(seachResult);
			kakaoMaps(seachResult);
		});
	})
	
	
	
	function kakaoMaps(seachResult){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(34.9438702, 127.5022322), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var geocoder = new kakao.maps.services.Geocoder();
		//var list = JSON.parse('${tourismListJSON}');

		if(seachResult == false)
			return;
		// 전체마커 출력
 		for (let i = 0; i < seachResult.length ; i++) {
			geocoder.addressSearch(seachResult[i].locationNmAddress, function(
					result, status) {
				
				//console.log(seachResult[i]);

				if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        // 마커를 표시할 위치입니다 
					
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					  position: coords,
					  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					});
					
					// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
					// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					// marker.setClickable(true);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
										
					// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					if(seachResult[i].tourismHp == "-")
						{
							var iwContent = 
								`<div style="padding:5px;">
									<p style="font-size:13px;">
										<b>\${seachResult[i].tourismNm} </b> <br>
										주소 : \${seachResult[i].locationNmAddress} <br>
										주차 여부 : \${seachResult[i].parking} <br>
									</p>
								</div>`, 
							// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
						} else{
							var iwContent = 
								`<div style="padding:5px;">
									<p style="font-size:13px;">
										<b>\${seachResult[i].tourismNm} </b> <br>
										주소 : \${seachResult[i].locationNmAddress} <br>
										주차 여부 : \${seachResult[i].parking} <br>
										홈페이지 : <a href="\${seachResult[i].tourismHp}"> link </a><br>
									</p>
								</div>`, 
							// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
						}
					
					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    content : iwContent,
					    removable : iwRemoveable
					});
					
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
					      // 마커 위에 인포윈도우를 표시합니다
					      infowindow.open(map, marker);  
					});

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		}// --- for End ---
 
	}	// ------ kakaoMaps Func End -----	
	
	function selectorFunc() {
		var selectArea = document.getElementById("area_select").value;
		var selectSortation = document.getElementById("category_select").value;
		var tourAddress = JSON.parse('${tourismListJSON}');
		var seachResult = new Array();
		
		tourAddress.forEach(function(item){
			if(item.area == selectArea || selectArea == ""){
				if(item.sortation == selectSortation || selectSortation == ""){
					seachResult.push(item);	
				}
			}
		});
		
/* 		console.log(selectArea);
		console.log(seachResult); */
				
		return seachResult;
	} // ------ selectorFunc Func End ---------
	
	function mkTableBody(seachResult){
		var tbody = document.getElementById("infoTableBody");
		
		// tbody 모든 node 삭제
		while ( tbody.hasChildNodes() )
		{
			tbody.removeChild(tbody.firstChild );
		}
		
		// tbody에 열 추가
		for(let list of seachResult){
			var tr = document.createElement("tr");
			
			var td1 = document.createElement("td");
			var td2 = document.createElement("td");
			var td3 = document.createElement("td");
			var td4 = document.createElement("td");
			var td5 = document.createElement("td");
			
			td1.innerText = `\${list.area}`;
			td2.innerText = `\${list.tourismNm}`;
			td3.innerText = `\${list.locationNmAddress}`;
			td4.innerText = `\${list.parking}`;
			td5.innerText = `\${list.tourismHp}`;
			
			td5.addEventListener("click", function(){
				location.href = list.tourismHp;
			});
			
			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);
			tr.appendChild(td4);
			tr.appendChild(td5);
			
			tbody.appendChild(tr);
		} // -- for end --
	} // ------- mkTableBody Func End --------

	</script>


	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>" ></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

</body>

</html>