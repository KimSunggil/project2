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
	.margin100px{
		margin:100px 10px;
	}
</style>

<script>
	function categoryTab(){
		var userDiv = document.getElementById("userDiv"); 
		var postDiv = document.getElementById("postDiv");
				
		document.getElementById('userA').addEventListener("click",function (){
			userDiv.style.display = 'block';
			postDiv.style.display = 'none';
		})
		
		document.getElementById('postA').addEventListener("click",function (){
			userDiv.style.display = 'none';
			postDiv.style.display = 'block';
		})	
	}
	
	document.addEventListener("DOMContentLoaded",function(){
		categoryTab();
	})
</script>

</head>

<body class="margin100px">
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
	<section class="container whiteBoard">
		<nav>
			<ul class="nav">
				<li class="nav-item">
					<a id="userA" class="nav-link" href="#">유저관리</a>
				</li>
				<li class="nav-item">
					<a id="postA" class="nav-link" href="#">게시글 관리</a>
				</li>
			</ul>
		</nav>
		<br>
		<article>
			<div id="userDiv">
				<jsp:include page="manage/manageUser.jsp"/>
			</div>
			
			<div id="postDiv" style="display:none;">
				<jsp:include page="manage/managePost.jsp"/>
			</div>
			
		</article>
	</section>	
	
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<script>
		
	</script>
	
</body>
</html>