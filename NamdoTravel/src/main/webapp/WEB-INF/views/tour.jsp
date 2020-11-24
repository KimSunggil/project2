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
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/small-business.css" rel="stylesheet">

</head>

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


			<select id="area_select">
				<c:forEach items="${tour}" var="list">
					<option value="${list.area}">${list.area}</option>
				</c:forEach>
			</select> <input type="button" id="button1" onclick="area_click();"
				value="지역선택" />
		</div>
		<!-- /.row -->

		<div style="width: 100%; height: 300px; overflow: auto">
			<table>
				<thead>
					<tr style="text-align: center;">
						<th>지역</th>
						<th>관광지</th>
						<th>관광지 주소</th>
						<th>주차여부</th>
						<th>홈페이지</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${tour}" var="tour">
						<tr>
							<td style="width: 100px;">${tour.area}</td>
							<td style="width: 300px;">${tour.tourismNm}</td>
							<td style="width: 300px;">${tour.locationNmAddress}</td>
							<td style="width: 100px;">${tour.parking}</td>
							<td style="width: 200px; cursor: hand;" align="center"
								onClick="location.href='${tour.tourismHp}'">${tour.tourismHp}</td>
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
		var tourAddress = JSON.parse('${json}');

		for (var i = 0; i < tourAddress.length; i++) {

			geocoder.addressSearch(tourAddress[i].address,
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
			var tourAddress = JSON.parse('${json}');

			for (var i = 0; i < tourAddress.length; i++) {
				if (tourAddress[i].area == select_area_btn) {



				}
			}
		}
	</script>




	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>