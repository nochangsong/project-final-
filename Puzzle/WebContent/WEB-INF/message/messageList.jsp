<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script> -->

<!-- Magnific Popup core CSS file -->
<link rel="stylesheet" href="/Puzzle/themes/magnific-popup.css">

<!-- jQuery 1.7.2+ or Zepto.js 1.0+ -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- Magnific Popup core JS file -->
<script src="/Puzzle/themes/jquery.magnific-popup.min.js"></script>
<script>
$(document).ready(function() {
	$('.simple-ajax-popup').magnificPopup({
		type: 'ajax'
	});
	
	$('.test-popup-link').magnificPopup({
		type: 'image'
		// other options
	});
	
});
</script>
</head>
<body>
<h2>쪽지함</h2>
<div class="container">
<table class="table">
	<tr>
		<th>선택</th>
		<th>보낸사람</th>
		<th>내용</th>
		<th>날짜</th>
	</tr>
	<c:if test="${msg==null}">
		<tr>
			<td colspan="2">쪽지가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${msg!=null}">
		<c:forEach var="msg" items="${msg}">
		<tr>
			<c:if test="${msg.checked=='new'}">
				<td><input type="checkbox"/></td>
				<td><b>${msg.sender}</b></td>
				<td><a href="#"><b>${msg.content}</b></a></td>
				<td><b>${msg.reg_date}</b></td>
			</c:if>
			<c:if test="${msg.checked=='read'}">
				<td><input type="checkbox"/></td>
				<td>${msg.sender}</td>
				<td><a href="#">${msg.content}</a></td>
				<td>${msg.reg_date}</td>
			</c:if>
		</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<div>
	<button type="button" class="btn btn-default">쪽지보내기</button>
	<button type="button" class="btn btn-default">삭제</button><br>
	
	
	<a class="simple-ajax-popup" href="/Puzzle/message.jsp">Ajax</a><br>
	<a class="test-popup-link" href="/Puzzle/1.jpg">image</a><br>
</div>
</body>
</html>