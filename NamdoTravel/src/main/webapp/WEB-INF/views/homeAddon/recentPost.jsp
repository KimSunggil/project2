<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="kr">
<html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Travel JN</title>
  
  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
	
  <!-- Custom styles for this template -->
  <style>
  	.table-condensed{
	  font-size: 13px;
	}
  </style>
</head>

<body>
  <div class="">
		<table id="board" class="table table-sm table-condensed table-hover">
			<thead>
				<tr>
					<td>#</td>
					<td>제목</td>
					<td>작성자</td>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="list" items="${recentPostLists }">
					<tr>
						<td>${list.postId}</td>
						<td>${list.postNm}</td>
						<td>${list.userNm}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
        
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
  <script>
	document.querySelector("#board > tbody").addEventListener("click",function(e){
		var src = e.target;

		if(!(src.nodeType === 1 && src.nodeName === "TD")) return;
		
		window.location.href = "/app/board/view"+src.parentElement.firstElementChild.innerText+"_page1";
	})
  </script>

</body>

</html>
