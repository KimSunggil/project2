<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="kr">
<html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Travel JN</title>
  
  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
	
  <!-- Custom styles for this template -->
  <link href="./resources/css/small-business.css" rel="stylesheet">
  <style>
  	#firstimg{
  		height: 500px;
  		width: 200px;
  		position: center;
  		margin-felt:20px;
  		justify-content: space-around;
  		position: relative;

  	}
  	#secondimg{
  		height: 500px;
  	}
  	#threeimg{
  		height: 500px;
  		width: 200px;
  	}
  	.header-overlay{
  		height:100%;
  		position:absolute;
  		top:0;
  		left:0;
  		width:100%;
  		background-color:#6c757d;
  		z-index: 1;
  		opacity:0.88;
  	}
  </style>
</head>

<body>
  <div class="container">

  <!-- Navigation -->
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>

  <!-- Page Content -->
  <div class="card text-white py-4 text-center" style="height:100%">
	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div id="screenfull" class="carousel-inner">
    <div class="carousel-item active">
      <img id="firstimg" src="./resources/img/sunsun1.jpg" class="d-block w-100" alt="순천 국가정원 핑크뮬리 사진">
      <div class="carousel-caption d-none d-md-block">
        <h2>여행을 시작하세요</h2>
        <p class="font-weight-bolder">순천만 국가정원 핑크뮬리</p>
      </div>
    </div>
    <div class="carousel-item">
      <img id="secondimg" src="./resources/img/screen2.jpg" class="d-block w-100" alt="순천만 갈대 숲 사진">
      <div class="carousel-caption d-none d-md-block">
        <h2>여행을 즐기세요</h2>
        <p class="font-weight-bolder">순천만 슾지 갈대 숲</p>
      </div>
    </div>
    <div class="carousel-item">
      <img id="threeimg" src="./resources/img/screen333333333.PNG" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h2 style="color:black;">여행지를 공유하세요</h2>        
        <p class="font-weight-bolder" style="color:black;">SNS 인증은 필수 !!! </p>
      </div>
    </div>
    </div>
    <div>
    
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

  

    <!-- Content Row -->
<div class="card text-white bg-secondary my-5 py-4 text-center">
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
      </div>
      <!-- /.col-md-4 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
	<jsp:include page="includejsp/footer.jsp"></jsp:include>
  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

</body>

</html>
