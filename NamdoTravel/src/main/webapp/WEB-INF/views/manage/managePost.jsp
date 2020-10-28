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
	.table > tbody > tr > td {
     vertical-align: middle;
}
</style>

</head>

<body class="margin100px">
	<div class="mangement-post">
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
						<form>
							<input type="submit" class="btn btn-danger btn-sm" value="삭제">
						</form>
						</td>
					</tr>
					<tr id="postContent${post.postId }" class="post-content" style="display:none;">
						<td colspan='9'>${post.content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<script
		src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<script>
		document.addEventListener("DOMContentLoaded",function(){
			
			document.querySelector("#board > tbody").addEventListener("click",function(e){
				var src = e.target;
				
				console.log(src);
		
				if(!(src.nodeType === 1 && src.nodeName === "TD")) return;
				
				for(var i=0 ; i<${postCount};i++)
					if(e.target && e.target.id == 'postInfo'+i){
				          //do something
				    	//document.getElementById("postInfo"+i).style.display === 'none' ? '' : 'none';
				        alert("inter");

				     }
				 });
				
			})
	</script>

</body>
</html>