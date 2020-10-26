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

  <title>Travel to JN</title>
  
  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
	
  <!-- Custom styles for this template -->
  <link href="./resources/css/small-business.css" rel="stylesheet">
</head>

<body>

  <!-- Navigation -->
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>

  <!-- Page Content -->
  <div class="container">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div class="col-lg-7">
        <img id="namdo" class="img-fluid rounded mb-4 mb-lg-0" src="./resources/img/main.jpg" alt="">
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5">
        <h1 class="font-weight-light">전라남도 숙박 여행정보</h1>
        <p></p>
        <a class="btn btn-primary" href="#">찾아보기</a>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <%-- <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
	      <jsp:include page="includejsp/map.jsp"></jsp:include>
	      <form action="weather" method="post">
	      <input type="text" id="suncheon" name="suncheon" value="순천">
	      <input  class="btn btn-primary" type="button" value="순천시" id="ajaxBtn">
	      </form>
	      
	      <a class="btn btn-primary" onclick="mappen(34.760374 , 127.662222)">여수시</a>
	      <a class="btn btn-primary" href="weather">목포시</a>
	      <a class="btn btn-primary" href="#">나주시</a>
	      <a class="btn btn-primary" href="#">광양시</a>
	      <a class="btn btn-primary" href="#">곡성군</a>
	      <a class="btn btn-primary" href="#">구례군</a>
	      <a class="btn btn-primary" href="#">고흥군</a>
	      <a class="btn btn-primary" href="#">보성군</a>
	      <a class="btn btn-primary" href="#">화순군</a>
	      <a class="btn btn-primary" href="#">장흥군</a>
	      <a class="btn btn-primary" href="#">강진군</a>
	      <a class="btn btn-primary" href="#">해남군</a>
	      <a class="btn btn-primary" href="#">영암군</a>
	      <a class="btn btn-primary" href="#">무안군</a>
	      <a class="btn btn-primary" href="#">함평군</a>
	      <a class="btn btn-primary" href="#">영광군</a>
	      <a class="btn btn-primary" href="#">장성군</a>
	      <a class="btn btn-primary" href="#">완도군</a>
	      <a class="btn btn-primary" href="#">진도군</a>
	      <a class="btn btn-primary" href="#">신안군</a>	
      </div>
    </div> --%>

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
            	<sec:authorize property="principal.username" var="user_id">
                    <div id="user_id">안녕하세요. ${userid }</div>
                    </sec:authorize>
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
