<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
document.addEventListener("DOMContentLoaded", function(){
	document.getElementById("ajaxBtn").addEventListener("click", function(){
		var httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function(){
			if ( httpRequest.readyState == XMLHttpRequest.DONE ){
				if ( httpRequest.status == '200' ){
					var result = JSON.parse(httpRequest.responseText);
					document.getElementByClassname("card-body").innerhtml =  
				}
			}
		}
</script>
</head>
<body>
<jsp:include page="includejsp/menubar.jsp"></jsp:include>
	      <form action="weather" method="post">
	      <input type="text" id="suncheon" name="suncheon" value="순천">
	      <input  class="btn btn-primary" type="button" value="순천시" id="ajaxBtn">
	      </form>
<jsp:include page="includejsp/footer.jsp"></jsp:include>
</body>
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>