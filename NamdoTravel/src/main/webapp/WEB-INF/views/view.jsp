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
		margin:100px 40px;
	}
	
	.board_info_box{
		
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
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onClick="window.location.href='<c:url value='/board/write_post${posts.postId}'/> ">수정</button>
				
				<form style="display:inline;" id='tmpForm' action="<c:url value='/board/deletePost${posts.boardId}_${posts.postId}'/>" method="POST">
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</form>
				
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onClick="window.location.href = /app/board/${boardId}">목록</button>
			</div>
		</article>
		
		<article>
			<section class="reply-list">
				<div>
					<table>
						<thead>
						</thead>
						
						<tbody>
							<tr>
								<td> 아이디 </td>
								<td> 난죽경없(난 죽음을 경험한 적이 없네), 언제든지, 가 짐 어서 </td>
								<td> date </td>
								<td> 수정 </td>
								<td> 삭제 </td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
			
			<section class="post-reply">
			</section>
		</article>
		
		<hr/>
		
	</section>
		
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
</body>
</html>