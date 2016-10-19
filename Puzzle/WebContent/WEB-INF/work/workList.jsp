<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <style>
table.decorate thead tr th tbody td {
   border: 1px solid black;
   text-align:center;
   font-size: 8pt;
   padding: 4px;
   width: 50%;
}
</style> -->
<link
	href="../../Startr - Free Startup Landing page Template/css/work.css" />
<script>
	function check() {
		if (document.find.Name.value == "") {
			alert("이름을 입력해주세요");
			document.find.Name.focus();
			return false; //이걸 false로 지정해야 확인 눌러도 안넘어감....
		}
	}
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
</script>

</head>
<body>
	<br>
	<br>
	<br>
	<div style="align: center;">
		
		<table border="1" align="center" width="900">
			<thead style="background-color: lavender" align="center;">
				<tr>
					<th>부서명</th>
					<th>직급</th>
					<th>이름</th>
					<th>근태종류</th>
					<th>시작시간</th>
					<th>종료시간</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:if test="${Name!=null}">
					<c:forEach var="article" items="${Name}">
						<tr>
							<td>${article.dept_Type}</td>
							<td>${article.positionType}</td>
							<td>${article.name}</td>
							<td>${article.work_Type}</td>
							<td>${article.startTime}</td>
							<td>${article.endTime }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<br> <br> <br>
		<form name="find" method="post">
			<div align="center">
				이름 : <input name="Name"> <input type="submit" value="검색" onclick="return check();"> &nbsp;
			</div>
		</form>
	</div>
</body>
</html>