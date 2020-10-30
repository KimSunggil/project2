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
	.displayInactive{
		display:none;'
	}
	.backboard{
		background-color:#cfcfcf;
	}
	.whiteBoard{
		background-color:#eeeeee;
		padding:30px;
	}
	.margin100px{
		margin:100px 10px;
	}
</style>

</head>

<body class="">

	<jsp:include page="../admin.jsp"></jsp:include>

	<div class="mangement-post container ">
		<h5>게시글 관리</h5>
		<table id="board" class="table text-center table-hover">
			<thead>
				<tr>
					<th>게시판</th>
					<th>게시글No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>게시일자</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>싫어요</th>
					
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="post" items="${posts}" varStatus="stats">
					<c:set var="postCount" value="${stats.count }"/>
					<tr id="postInfo${stats.index }" class="post-info">
						<td>${post.boardId }</td>
						<td>${post.postId }</td>
						<td>${post.postNm }</td>
						<td>${post.userNm }</td>
						<td>${post.postDate }</td>
						<td>${post.hits }</td>
						<td>${post.like }</td>
						<td>${post.dislike }</td>
						<td>
						<form action="<c:url value='/admin/deletePost${post.postId}_${postPages}'/>" method="post">
							<input type="submit" class="btn btn-danger btn-sm" value="삭제">
						</form>
						</td>
					</tr>
					<tr id="postContent${stats.index }" class="post-content displayInactive">
						<td colspan='9'>${post.content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<nav>
			<ul id="pagination" class="pagination justify-content-center">
				<li id="prePage" class="page-item"><a id="preA" class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					
				<c:forEach var="pageIndex" begin="${postBlockStartNums}" end="${postBlockLastNums}" varStatus="state">
					<c:choose>
						<c:when test="${pageIndex <= postAllPages}">
							<li id="page${pageIndex}" class="page-item"><a class="page-link" href="<c:url value='/admin/postPage_${pageIndex}'/>">${pageIndex}</a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<li id="nextPage" class="page-item"><a id="nextA" class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>


	<script
		src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<script>
		document.addEventListener("DOMContentLoaded",function(){
			
			(function(){
				for(var i=0; i<${postCount};i++){
					document.querySelector("#postInfo"+i).addEventListener("click",function(e){
						e.target.parentNode.nextSibling.nextSibling.classList.toggle("displayInactive");
					})
				}
			})()
			
			(function() {	
				document.getElementById("page${postPages}").classList.add('active');
				
				if(${postBlockStartNums} <= 1){
					document.getElementById("prePage").classList.add('disabled');
				}else{
					document.getElementById("preA").addEventListener("click",function(){
						window.location.href = "/app/admin/postPage_" + (${postBlockLastNums} - 10);
					});
				}
				
				if(${postBlockLastNums} >= ${postAllPages} ){
					document.getElementById("nextPage").classList.add('disabled');
				}else{
					document.getElementById("nextA").addEventListener("click",function(){
						window.location.href = "/app/admin/postPage_" + (${postBlockStartNums} + 10);
					});

				}
				
			})()
			
		})
	</script>

</body>
</html>