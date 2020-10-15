<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>숙박업체 정보</title>

  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/small-business.css" rel="stylesheet">

</head>

<style>
	
	table {
	  border-collapse: collapse;
	  width: 100%;
	  height: 800px;
	  table-layout:fixed; 
	}
	
	th, td {
	  text-align: left;
	  padding: 8px;
	}

	tr:nth-child(even) {background-color: #f2f2f2;}
	
	
	
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
        <h1 class="fst_title">전라남도 숙박시설정보</h1>
      </div>
      <!-- /.col-md-4 -->
   
    </div>
    <!-- /.row -->

	<div>
	   <table>
	   	<thead>
	   		<tr>
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
					<td>${room.area}</td>
					<td>${room.tourism_nm}</td>
					<td>${room.location_nm_address}</td>
					<td>${room.parking}</td>
					<td>${room.tourism_hp}</td>
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
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>