<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#" style="text-shadow: 0.1em 0.1em 0.15em #7fffd4">Travel to JN</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">지역별 추천 숙박</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">지역별 추천 관광지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">여행지역 날씨</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">관광 안내소</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">리뷰/신규 여행지추천</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자유게시판</a>
          </li>
        </ul>
        
    <sec:authorize access="isAnonymous()">
    	<a href="<c:url value='/auth/login' />"><button>LOGIN</button></a>
    </sec:authorize>
    
	<sec:authorize access="isAuthenticated()">
	    <form action=<c:url value='/logout' /> method="GET">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <button type="submit">LOGOUT</button>
	    </form>
	</sec:authorize>
		
      </div>
    </div>
  </nav>
</body>
</html>