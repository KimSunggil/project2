<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scal-1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.css' />" >
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />">

<style>
	.margin100px{
		margin:100px 20px;
	}
	.whiteBoard{
		background-color:white;
		padding:40px;
	}
	.jumbotron{
		background-color:red;
	}
</style>

<script>
	document.addEventListener("DOMContentLoaded", function(){
		
		
		document.querySelector("#board > tbody").addEventListener("click",function(e){
			var src = e.target;
	
			if(!(src.nodeType === 1 && src.nodeName === "TD")) return;
			
			window.location.href = "/app/board/view"+src.parentElement.firstElementChild.innerText;
		})
	});
</script>

<title>Insert title here</title>
</head>
<body class="margin100px">
	
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
	<section class="container whiteBoard">
		<article>
			<table id="board" class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">날짜</th>
						<th scope="col">조회수</th>
						<th scope="col">좋아요</th>
						<th scope="col">싫어요</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${posts}" var="post">
						<tr>
							<td id="postId"><c:out value="${post.postId}"></c:out></td>
							<td id="postNm"><c:out value="${post.postNm}"></c:out></td>
							<td id="userNm"><c:out value="${post.userNm}"></c:out></td>
							<td id="postDate"><c:out value="${post.postDate}"></c:out></td>
							<td id="postHit"><c:out value="${post.hits}"></c:out></td>
							<td id="postLike"><c:out value="${post.like}"></c:out></td>
							<td id="postDislike"><c:out value="${post.dislike}"></c:out></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>

		<article class="container">
			<a href="<c:url value='/board/write${boardIds}'/>" class="btn btn-primary float-right"> 글쓰기</a>
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</article>
	</section>
		
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
</body>
</html>