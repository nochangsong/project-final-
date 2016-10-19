<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<link rel="stylesheet" href="../css/board.css" type="text/css">
</head>
<body>
	<div id="detail">
		<h3>작성글</h3>
		<ul>
			<%-- <li>번호 : ${board.BNO}</li> --%>
			<li>작성자 : ${board.NAME}</li>
			<li>제목 : ${board.SUBJECT}</li>
			<li>등록날짜 : <fmt:formatDate value="${board.REG_DATE}"
					pattern="yy년 MM월 dd일" /></li>
		</ul>

		<hr size="1" width="100%">
		${N_CONTENT}
		<hr size="1" width="100%">
		<c:if test="${sessionScope.id==board.WRITER}">
			<input type="button" value="수정" class="inputb"
				onclick="location.href='notifyupdate1.puzzle?BNO=${command.BNO}'">
			<input type="button" value="삭제" class="inputb"
				onclick="location.href='notifydelete1.puzzle?BNO=${command.BNO}'">
		</c:if>
		<input type="button" value="목록" class="inputb"
			onclick="location.href='notifyList.puzzle'">
	</div>
</body>
</html>