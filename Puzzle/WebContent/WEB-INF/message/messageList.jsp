<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE>
<html>
<head>
<!-- include the core styles -->
<link rel="stylesheet" href="/Puzzle/themes/alertify.core.css" />
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet" href="/Puzzle/themes/alertify.default.css" id="toggleCSS"/>
<meta name="viewport" content="width=device-width">
	<style>
		.alertify-log-custom {
			background: blue;
		}
	</style>
	
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="/Puzzle/themes/alertify.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script> -->
<script src="/Puzzle/alarm.js"></script>
</head>
<body>
<h2>쪽지함</h2>
<table border="1" cell-spacing="0">
	<tr>
		<th>보낸사람</th>
		<th>내용</th>
	</tr>
	<c:if test="${msg==null}">
		<tr>
			<td colspan="2">쪽지가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${msg!=null}">
		<c:forEach var="msg" items="${msg}">
		<tr>
			<td>${msg.sender}</td>
			<td>${msg.content}</td>
		</tr>
		</c:forEach>
	</c:if>
</table>
</body>
</html>