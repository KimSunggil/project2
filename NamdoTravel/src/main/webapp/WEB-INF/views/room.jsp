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

<title>숙박업체 정보</title>

<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/small-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="./resources/vendor/jquery/jquery.min.js"></script>
<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<head>
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
				<h1>전라남도 숙박시설정보</h1>
			</div>
			<!-- /.col-md-4 -->

		</div>

		<div>
			<p style="margin-top: -12px">
				<em class="link"> <a href="javascript:void(0);"
					onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
						혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
				</em>
			</p>
			<div id="map" style="width: 100%; height: 350px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7cb307437cf02090b0b5c00c3eb40d9&libraries=services"></script>

			<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(34.6924371, 127.6949505), // 지도의 중심좌표
					level : 8
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(map);

				// 카테고리로 숙소를 검색합니다
				ps.categorySearch('AD5', placesSearchCB, {
					useMapBounds : true
				});
				// 카테고리로 관광지를 검색합니다
				ps.categorySearch('AT4', placesSearchCB, {
					useMapBounds : true
				});
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {
						for (var i = 0; i < data.length; i++) {
							displayMarker(data[i]);
						}
					}
				}
				// kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

				function displayPlaces(places) {
					for (var i = 0; i < places.length; i++) {
						console.log(places[i].place_url);
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
					// 마커를 생성하고 지도에 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : new kakao.maps.LatLng(place.y, place.x)
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event
							.addListener(
									marker,
									'click',
									function() {
										// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										infowindow
												.setContent('<div style="padding:5px;font-size:12px;">'
														+ place.place_name
														+ '</div>');
										infowindow.open(map, marker);
										// var link = 'http://google.com'
										//링크로 넣는 방법이 있고 div에 a태크 href 로넣는방법이 있음

										// infowindow.setContent('<div>' + alert("페이지를 이동합니다.") + '</div>');
										// location.href=link

									});
				}
				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

					// 콘솔에 마커들 url을 가져오긴 했는데 어떻게 마커에다가 집어넣냐
					for (var i = 0; i < places.length; i++) {
						console.log(places[i].place_url);
					}

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}

				kakao.maps.event.addListener(map, 'dragend', function() {

					// 지도 중심좌표를 얻어옵니다 
					var latlng = map.getCenter();

					var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
					message += '경도는 ' + latlng.getLng() + ' 입니다';

					console.log(message);

					map.relayout();

				});
				/* 		
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						var addressArray = [];
						var roomAddress = JSON.parse('${room}');

						for (var i = 0; i < roomAddress.length; i++) {
							addressArray.push({'groupAddress' : $("input[name='address']").eq(i).val()});
						}

						for (var i = 0; i < addressArray.length; i++) {
							geocoder.addressSearch(addressArray[i].groupAddress, function(result, status, data) {

								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker(
											{
												map : map,
												position : coords
											});
									// 마커를 지도에 표시합니다.
									marker.setMap(map);

									var content = '<div class ="labelWish"><span class="leftWish"></span><span class="centerWish">'
											+ result[0].address_name
											+ '</span><span class="rightWish"></span></div>';

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new daum.maps.CustomOverlay(
											{
												position : coords,
												content : content
											});

									// 커스텀 오버레이를 지도에 표시합니다
									customOverlay.setMap(map);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
						} */
			</script>
		</div>

		<!-- /.row -->

		<div style="width: 100%; height: 500px; overflow: auto">
			<table>
				<thead>
					<tr style="text-align: center;">
						<th>지역</th>
						<th>숙소이름</th>
						<th>숙소 주소</th>
						<th>주차여부</th>
						<th>홈페이지</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${room}" var="room">
						<tr>
							<td style="width: 100px;">${room.area}</td>
							<td>${room.tourism_nm}</td>
							<td>${room.location_nm_address}</td>
							<td style="width: 100px;">${room.parking}</td>
							<td style="width: 200px; cursor: hand;" align="center"
								onClick="location.href='${room.tourism_hp}'">${room.tourism_hp}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>



		<!-- Content Row -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title"></h2>
						<p class="card-text"></p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title"></h2>
						<p class="card-text"></p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title"></h2>
						<p class="card-text"></p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary btn-sm">More Info</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>



</body>

</html>
