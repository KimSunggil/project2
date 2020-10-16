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
				<h1>전라남도 숙박시설정보</h1>
			</div>
			<!-- /.col-md-4 -->

		</div>

		<div id="map" style="width: 100%; height: 350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7cb307437cf02090b0b5c00c3eb40d9&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							'제주특별자치도 제주시 첨단로 242',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>

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
							<td style="width: 200px; cursor:hand;" align="center" onClick="location.href='${room.tourism_hp}'">${room.tourism_hp}</td>
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

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
