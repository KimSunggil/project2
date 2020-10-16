<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	document.addEventListener("DOMContentLoaded",function(){
		console.log(${result});
	})
</script>
</head>
<body>
	현재 접속자 : <c:out value="${result}"></c:out>
</body>
</html>