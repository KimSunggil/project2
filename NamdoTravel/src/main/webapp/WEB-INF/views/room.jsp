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
			<div class="card bg-light mb-3" style="width:100%;">
			<div class="card-header">
				<h1 class="text-center">전라남도 숙박시설정보</h1>
				</div>
			</div>
			<!-- /.col-md-4 -->


		<div class="card bg-secondary mb-3" style="width:100%;">
			<p style="margin-top: -12px" class="text-center">
			<br>
				<em class="btn btn-light"> <a href="javascript:void(0);"
					onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
						혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
				</em>
			</p>
			<div id="map" style="width: 100%; height: 350px;"></div>


			<select id="area_select">
				<c:forEach items="${room}" var="list">
					<option value="${list.area}">${list.area}</option>
				</c:forEach>
			</select> <input type="button" id="button1" onclick="area_click();"
				value="지역선택" />
		</div>
		</div>

		<!-- /.row -->

		<div class="card bg-light mb-3" style="width: 100%; height: 400px; overflow: auto">
			<table class="talbe">
				<thead class="thead-dark">
					<tr style="text-align: center;">
						<th scope="col">지역</th>
						<th scope="col">숙소이름</th>
						<th scope="col">숙소 주소</th>
						<th scope="col">주차여부</th>
						<th scope="col">홈페이지</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${room}" var="room">
						<tr>
							<td style="width: 100px;">${room.area}</td>
							<td style="width: 300px;">${room.tourismNm}</td>
							<td style="width: 300px;">${room.locationNmAddress}</td>
							<td style="width: 100px;">${room.parking}</td>
							<td style="width: 200px; cursor: hand;" align="center"
								onClick="location.href='${room.tourismHp}'">${room.tourismHp}</td>
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

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7cb307437cf02090b0b5c00c3eb40d9&libraries=services"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(34.9438702, 127.5022322), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var roomAddress = JSON.parse('${json}');

		for (var i = 0; i < roomAddress.length; i++) {

			geocoder.addressSearch(roomAddress[i].address,
					function(result, status, data) {

						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							/* -----------------------------------------------전체마커 ----------------------------------------------------
							       // 결과값으로 받은 위치를 마커로 표시합니다
							       var marker = new kakao.maps.Marker({
							          map : map,
							          position : coords
							       });

							       // 마커를 지도에 표시합니다.
							       marker.setMap(map);

							       // 커스텀 오버레이를 생성합니다
							       var customOverlay = new daum.maps.CustomOverlay({
							          position : coords,
							       });
							       // 커스텀 오버레이를 지도에 표시합니다
							       customOverlay.setMap(map);

							       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							       map.setCenter(coords); */

						}

					});

		}
		function area_click() {
			var select_area_btn = $("#area_select option:selected").val();
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(34.9438702, 127.5022322), // 지도의 중심좌표
				level : 6
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			var roomAddress = JSON.parse('${json}');

			for (var i = 0; i < roomAddress.length; i++) {
				if (roomAddress[i].area == select_area_btn) {

					geocoder.addressSearch(roomAddress[i].address, function(
							result, status, data) {

						if (status === kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 마커를 지도에 표시합니다.
							marker.setMap(map);

							/* var content = '<div>'+ result[0].address_name '</div>'; */

							// 커스텀 오버레이를 생성합니다
							var customOverlay = new daum.maps.CustomOverlay({
							/* 	position : coords,
								content : content */
							});
							// 커스텀 오버레이를 지도에 표시합니다
							customOverlay.setMap(map);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);

						}

					});

				}
			}
		}
	</script>



</body>

</html>