<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-">
<title>Insert title here</title>
   <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
  <link href="./resources/css/small-business.css" rel="stylesheet">
</head>
<body>
<jsp:include page="includejsp/menubar.jsp"></jsp:include>
<!-- 이 아래로 내용 넣으시면 됩니다. -->

<jsp:include page="includejsp/footer.jsp"></jsp:include>
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>