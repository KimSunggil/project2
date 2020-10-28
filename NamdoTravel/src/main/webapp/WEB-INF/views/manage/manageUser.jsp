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
	<div class="mangement-user">
		<h5>유저 관리</h5>
		<table class="table text-center">
			<thead>
				<tr>
					<th>ID</th>
					<th>닉네임</th>
					<th>Email</th>
					<th>가입일자</th>
					<th>마지막<br>로그인</th>
					<th>권한</th>
					<th>활성화</th>
					<th>수정</th>
					<th>비밀번호<br>초기화</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="user" items="${users}">
				<tr>
					<form action="<c:url value="/admin/updateAcc" />" method="post">
						<input type="hidden" name="userId" value="${user.userId}">
						<input type="hidden" name="password" value="${user.password }">
						<input type="hidden" name="nickName" value="${user.nickName}">
						<input type="hidden" name="email" value="${user.email}">
						<td >${user.userId}</td>
						<td>${user.nickName }</td>
						<td>${user.email }</td>
						<td style="font-size:0.8rem; width:5vw;">${user.regDate }</td>
						<td style="font-size:0.8rem; width:5vw;">${user.lastLogin }</td>
						<td>
							<select name="authority">
								<c:choose>
									<c:when test="${user.authority == 'ROLE_ADMIN' }">
										<option value="ROLE_ADMIN" selected="selected">ADMIN</option>
										<option value="USER">USER</option>
									</c:when>
									<c:when test="${user.authority == 'USER' }">
										<option value="ROLE_ADMIN">ADMIN</option>
										<option value="USER" selected="selected">USER</option>
									</c:when>	
								</c:choose>
							</select>
						</td>

						<td>
							<select name="enable">
								<c:choose>
									<c:when test="${user.enable == '1' }">
										<option value="1" selected="selected">활성</option>
										<option value="0">비활성</option>
									</c:when>
									<c:when test="${user.enable == '0' }">
										<option value="1">활성</option>
										<option value="0" selected="selected">비활성</option>
									</c:when>	
								</c:choose>
							</select></td>
						<td><input type="submit" class="btn btn-primary btn-sm" value="수정"></td>
						</form>
						<td>
							<form action="<c:url value="/admin/resetPass"/>" method="post">
								<input type="hidden" name="userId" value="${user.userId }">
								<input type="submit" value="초기화" class="btn btn-warning btn-sm">
							</form>
						</td>
						<td>
							<form action="<c:url value="/admin/deleteAccount"/>" method="post">
								<input type="hidden" name="userId" value="${user.userId }">
								<input type="submit" value="삭제" class="btn btn-danger btn-sm">
							</form>
						</td>
					</tr>
				
				</c:forEach>
			</tbody>
		</table>
	</div>


	<script
		src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.js'/>"></script>

</body>
</html>