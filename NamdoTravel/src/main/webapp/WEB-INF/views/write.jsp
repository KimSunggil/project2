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

<!-- summernote -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<script src="<c:url value='/resources/summernote/lang/summernote-ko-KR.js'/>"></script>

<script>
	$(document).ready(function() {
	      $('#summernote').summernote({
	          placeholder: 'content',
	          tabsize: 2,
	          height: 500,
	          lang: 'ko-KR',
	        });
		});
</script>

<style>
	.margin100px{
		margin:100px 20px;
	}
</style>

<title>Insert title here</title>
</head>
<body class="margin100px">
	
	<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	
	<section class="container">
		<article>
			<form action="<c:url value='/board/write'/>" method="post">
				<input type="hidden" name="boardId" value="${boardIds}">
				<sec:authentication property="principal.username" var="user_id" />
				<input type="hidden" name="userId" value="${user_id}">

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-sm"> 제목 </span>
					</div>
					<input type="text" name="postNm" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
				</div>
				<br>
				<textarea id="summernote" name="postContent"> </textarea>
				<br>
				<input type="submit" class="btn btn-primary float-right">
			</form>
		</article>
	</section>

</body>
</html>