<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<script>

</script>
</head>
<body>
<br>
	<br>
	<br>
	<form:form commandName="command">
	<div style="align: center;">
		<table border="1" align="center" width="900">
			<thead align="center" style="background-color: lavender" >
				<tr>
					<th></th>
					<th>부서명</th>
					<th>직급</th>
					<th>이름</th>
					<th>근태종류</th>
					<th>시작시간</th>
					<th>종료시간</th>
				</tr>
			</thead>
			<tbody align="center">
					<c:forEach var="article" items="${Email}">
						<tr>
							<td><input type="checkbox" name="checking"></td> 
							<td>${article.dept_Type}</td>
							<td>${article.positionType}</td>
							<td>${article.name}</td>
							<td>${article.work_Type}</td>
							<td>${article.startTime}</td>
							<td>${article.endTime }</td>
						</tr>
					</c:forEach>		
			</tbody>
		</table>
	</div>
	<div align="right">
	<input type="submit" class="btn btn-default" value="삭제하기"/>
	</div>
	</form:form>
</body>
</html>