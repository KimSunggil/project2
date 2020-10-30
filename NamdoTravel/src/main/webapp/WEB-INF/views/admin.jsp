<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다.</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.css' />" >
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />">
<style>
	.whiteBoard{
		background-color:white;
		padding:30px;
	}
	
</style>


</head>

<body class="margin100px">
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
		<nav class="container whiteBoard">
			<ul class="nav nav-pills">
				<li class="nav-item">
					<a id="userA" class="nav-link" href="<c:url value="/admin/userPage_1"/>">유저관리</a>
				</li>
				<li class="nav-item">
					<a id="postA" class="nav-link" href="<c:url value="/admin/postPage_1"/>">게시글 관리</a>
				</li>
			</ul>
		</nav>
	
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<script>
		
	</script>
	
</body>
</html>