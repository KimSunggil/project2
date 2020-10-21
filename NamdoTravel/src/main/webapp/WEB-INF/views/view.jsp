<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scal-1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.css' />" >
<style>
	.margin100px{
		margin:100px 20px;
	}
	
	.board_info_box{
	}
	
	.board_date{
		font-size:10px;
	}
</style>

<title>Insert title here</title>

</head>
<body class="margin100px">
	
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
	<section class="container">
		<article>
			<h2>Title</h2>

			<div class="bg-white rounded shadow-sm">
				<div class="board_info_box float-right">
					<span class="board_hits">조회수 : </span><br>
					<span class="board_author">작성자 : </span><span class="board_date">작성일 : 2020-10-16 02:12</span>
				</div>
				<br>
				<div id="contentDiv" class="board_content float-none">Content
					<c:out value="${postContents}"></c:out>
				</div>
			</div>

			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</article>
		
		<article label="reply">
		</article>
		
		<hr/>
		
	</section>
		
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
</body>
</html>