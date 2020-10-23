<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scal-1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.css' />" >
<style>
	.margin100px{
		margin:100px 40px;
	}
	.sub-info-font{
		font-size:10px;
	}
</style>

<script>
	document.addEventListener("DOMContentLoaded",function(){
		
		document.getElementById("btnDelete").addEventListener("click", function(){
			document.getElementById("tmpForm").submit();	
		});
		
		document.getElementById("contentDiv").innerHTML = `${postContents}`;
	})
</script>

<title>Insert title here</title>

</head>
<body class="margin100px">
	
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
	<!-- 본 문  -->
	<section class="container">
		<article>
			<h2><c:out value="${posts.postNm}"/></h2>

			<div class="bg-white rounded shadow-sm">
				<div class="board_info_box float-right">
					<span class="board_hits sub-info-font">
						조회수 : <c:out value="${posts.hits}"/>/
						작성자 : <c:out value="${posts.userNm}"/>/
						작성일 : <c:out value="${posts.postDate}"/>
					</span>
				</div>
				<br>
				<div id="contentDiv" class="board_content float-none">
					<c:out value="${postContents}"></c:out>
				</div>
			</div>

			<div style="margin-top : 20px;">
			<c:if test="${posts.userId == principals }">
				<a href="<c:url value='/board/write_post${posts.postId}'/>"> <button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button> </a>
				
				<form style="display:inline;" id='tmpForm' action="<c:url value='/board/delete_Post${posts.boardId}_${posts.postId}'/>" method="POST">
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</form>
			</c:if>
				<a href="<c:url value='/board/${posts.boardId}'/> "><button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button></a>
			</div>
			<br>
		</article>
		
		<!-- 댓글  -->
		<article>
			<section class="reply-list">
				<div class="bg-white rounded shadow-sm">
					<table class="table">
						<thead>
						</thead>
						
						<tbody>
							<tr>
								<td> 아이디 </td>
								<td> 내용 </td>
								<td> 날짜 </td>
								<td> 댓글 </td>
								<td> 수정 </td>
								<td> 삭제 </td>
							</tr>
							
							<c:forEach items="${replys}" var="reply">
								<tr>
									<td> ${reply.nickName} </td>
									<td> ${reply.content} </td>
									<td> ${reply.replyDate }</td>
									<td> 답글 </td>
									<c:if test="${reply.userId == principals }">
										<td><a id="modifyReplyA"> 수정 </a></td>
										<td><a href="<c:url value ='#'/>"> 삭제 </a></td>
									</c:if>
								</tr>
								
								<tr id="relplyUpdateBox" class="">
									<td colspan='6'>
										<textarea> <c:out value = "${principals}"/> </textarea> <input type="submit">
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>					
				</div>
			</section>
			
			<section class="post-reply">
				<form action="<c:url value ='/board/write_reply'/>" method="post">
					<input type="hidden" name="postId" value="${posts.postId }">
					<input type="hidden" name="userId" value="${principals}">
					<textarea id="inputReply" name="content" style="width:50%;"></textarea> <input type="submit">
				</form>
			</section>
		</article>
		
		<hr/>
		
	</section>
		
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
</body>
</html>