<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>

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
	
	<section class="container">
		<article>
			<h5>정보 수정</h5>
			<div>
				<form>
					<span class="txt1 p-b-11">
						Username
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text" name="username" >
						<span class="focus-input100"></span>
					</div>
				
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">ID</span>
						</div>
						<input type="text" name="content" value="${users.userId }"
							class="form-control" aria-label="Recipient's username"
							aria-describedby="basic-addon2">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">Password</span>
						</div>
						<input type="password" name="password" value="${users.password }"
							class="form-control" aria-label="Recipient's username"
							aria-describedby="basic-addon2">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">Password</span>
						</div>
						<input type="text" name="email" value="${users.email }"
							class="form-control" aria-label="Recipient's username"
							aria-describedby="basic-addon2">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">Password</span>
						</div>
						<input type="text" name="nickName" value="${users.nickName }"
							class="form-control" aria-label="Recipient's username"
							aria-describedby="basic-addon2">
					</div>
					
					<input type="text" name="nickName" class="" value="${users.nickName }"/>
					<input type="text" name="name" class="" value="${users.name }"/>
					<input type="text" name="phoneNo" class="" value="${users.phoneNo }"/>
					<input type="text" name="address" class="" value="${users.address }"/>
					
					<input type="submit" class="btn btn-primary">
				</form>
			</div>
		</article>
	</section>
	
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>
	<script>
		
	</script>
	
</body>
</html>