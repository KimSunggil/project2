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

</script>
</head>
<body>
	Spring Security 현 사용자 정보 불러오기 위한 테스트 장소 입니다.<br><br>
	<c:out value='${aaa}'/>
</body>
</html>