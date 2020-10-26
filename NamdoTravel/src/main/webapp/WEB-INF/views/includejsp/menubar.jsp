<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
  <link href="<c:url value='/resources/css/small-business.css'/>" rel="stylesheet">
  <link href="<c:url value='/resources/sb2/css/sb-admin-2.min.css'/>" rel="stylesheet">
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	.logout-form{
		display:flex;
		justify-content:center;
		align-items:center;
	}

 .logoutbtn{
    background-color: transparent;
    border: none;
    cursor: pointer;
    }
    
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/home'/>"
				style="text-shadow: 0.1em 0.1em 0.15em #7fffd4">Travel to JN</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" id="nav-link" href="/app/room">숙박 업소</a></li>
					<li class="nav-item"><a class="nav-link" id="nav-link" href="/app/tour">관광지</a></li>
					<li class="nav-item"><a class="nav-link" id="nav-link" href="/app/festival">지역별 축제</a></li>
					<li class="nav-item"><a class="nav-link" id="nav-link" href="/app/weather/main">전남지역 날씨(미완)</a>
					</li>
					<li class="nav-item"><a class="nav-link" id="nav-link" href="#">리뷰/신규
							여행지추천</a></li>
					<li class="nav-item"><a class="nav-link" id="nav-link" href="<c:url value='/board/1_page1'/>">자유게시판</a></li>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter"><img/></span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<h1>*</h1>
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div>
						</li>
					</sec:authorize>
				</ul>

				<sec:authorize access="isAnonymous()">
					<a href="<c:url value='/auth/login' />"><button>LOGIN</button></a>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
            <li class="nav-item dropdown no-arrow" style="list-style: none;">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <sec:authentication property="principal.username" var="user_id" />
                    <span id="user_id" class="mr-2 d-none d-lg-inline text-gray-600 small">${user_id}</span>
                <img class="img-profile rounded-circle" src="<c:url value='/resources/img/avatar.png'/>" style="height:30px;widht:30px;">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
					<form action=<c:url value='/logout' /> method="GET" class="logout-form">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button type="submit" class="logoutbtn">LOGOUT</button>
					</form>
              </div>
            </li>
				</sec:authorize>
			</div>
		</div>
	</nav>
</body>
</html>