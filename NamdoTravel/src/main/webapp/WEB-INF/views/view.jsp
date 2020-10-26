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
	
	.displayActive{
		display:none;
	}
</style>

<title>Insert title here</title>

</head>
<body class="margin100px">
	
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
	<!-- 본 문  -->
	<section class="container">
		<article class="bg-white rounded shadow-sm">
			<br>
			<h2 style="padding:0.2%;"><c:out value="${posts.postNm}"/></h2>
			<hr/>

			<div >
				<div class="board_info_box float-right">
					<span class="board_hits sub-info-font">
						조회수 : <c:out value="${posts.hits}"/> /
						작성자 : <c:out value="${posts.userNm}"/> /
						작성일 : <c:out value="${posts.postDate}"/> /
						좋아요 : <c:out value="${posts.like }"/> /
						싫어요 : <c:out value="${posts.dislike}"/>
					</span>
				</div>
				<br>
				<div id="contentDiv" class="board_content float-none">
					<c:out value="${posts.content}"/>
				</div>
			</div>
			<hr/>
			<!-- 좋아요 싫어요 -->
			<div style="display:flex; justify-content: space-around; ">
				<form action="<c:url value='/board/favor'/>" method="post">
					<input type="hidden" name="favor" value="LIKE"/>
					<input type="hidden" name="postId" value="${posts.postId}">
					<input type="submit" value="좋아요">
				</form>
				<form action="<c:url value='/board/favor'/>" method="post">
					<input type="hidden" name="favor" value="DISLIKE"/>
					<input type="hidden" name="postId" value="${posts.postId}"/>
					<input type="submit" value="싫어요">
				</form>
			</div>
		</article>
		
		<!-- 게시글 수정 삭제 목록 -->
		<article style="margin-top : 20px;">
			<c:if test="${posts.userId == principals }">
				<a href="<c:url value='/board/write_post${posts.postId}'/>"> <button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button> </a>
				
				<form style="display:inline;" id='tmpForm' action="<c:url value='/board/delete_Post${posts.boardId}_${posts.postId}'/>" method="POST">
				<button type="submit" class="btn btn-sm btn-primary">삭제</button>
				</form>
			</c:if>
				<a href="<c:url value='/board/${posts.boardId}_page${pages}'/> "><button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button></a>
		</article>
		<br>
		
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
							
							<c:forEach items="${replys}" var="reply" varStatus="status">
								<c:set var="replyIndex" value="${status.index}"/>
								<tr>
									<td> ${reply.nickName} </td>
									<td> ${reply.content} </td>
									<td> ${reply.replyDate }</td>
									
									<td> 답글 </td>
									<c:choose>
										<c:when test="${reply.userId == principals }">
											<td><button id="modifyReplyA${status.index}"> 수정 </button></td>
											<td>
												<form action="<c:url value ='/board/delete_reply_page${pages }' />" method="post">
													<input type="hidden" name="replyId" value="${reply.replyId }">
													<input type="hidden" name="postId" value="${reply.postId }">
													<input type="submit" value="삭제">
												</form>
											</td>
										</c:when>
										<c:otherwise>
											<td colspan='2'/>
										</c:otherwise>
									</c:choose>
								</tr>
								
								<!-- 수정 활성화 시 -->
								<tr id="relplyUpdateBox${status.index}" class="displayActive">
									<td colspan='6'>
										<form action="<c:url value="/board/modify_reply_${reply.postId}_${pages}" />" method="post">
											<input type="hidden" name="replyId" value="${reply.replyId}">
											<textarea name="content"> <c:out value = "${reply.content}"/> </textarea> <input type="submit">
										</form>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>					
				</div>
			</section>
			
			<!-- 댓글 작성 (로그인시 보임) -->
			<sec:authorize access="isAuthenticated()"> 
				<section class="post-reply">
					<form action="<c:url value ='/board/write_reply${pages}'/>" method="post">
						<input type="hidden" name="postId" value="${posts.postId }">
						<input type="hidden" name="userId" value="${principals}">
						<textarea id="inputReply" name="content" style="width:50%;"></textarea> <input type="submit">
					</form>
				</section>
			</sec:authorize>
		</article>
		
		<hr/>
		
	</section>
		
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<script>	
		document.addEventListener("DOMContentLoaded",function(){
			
			document.getElementById("contentDiv").innerHTML = `${posts.content}`;
			
			document.addEventListener('click',function(e){
				for(var i=0; i<=${replyIndex}; i++)
					{
						if(e.target && e.target.id== 'modifyReplyA'+i){
					          //do something
					    	document.getElementById("relplyUpdateBox"+i).classList.toggle("displayActive");
					     }
					}
			 });
					
			if(`${errorLog}`){
				alert(`${errorLog}`);
			}
		})
	</script>
</body>
</html>