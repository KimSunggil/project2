<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="whaethers" items="${wheather}">
	<li>${wheather.pop} ${wheather.pty} ${wheather.reh} ${wheather.sky}</li>
</c:forEach>
</body>
</html>