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
	<c:if test="${board.WRITE_TYPE=='비공개'}">
		<c:if
			test="${sessionScope.DEPT_NUM==board.DEPT_NUM||sessionScope.name=='admin'}">
			<div id="detail">
				<h3>작성글</h3>
				<ul>
					<li>번호 : ${board.BNO}</li>
					<li>작성자 : ${board.NAME}</li>
					<li>제목 : ${board.SUBJECT}</li>
					<li>등록날짜 : <fmt:formatDate value="${board.REG_DATE}"
							pattern="yy년 MM월 dd일" /></li>
				</ul>

				<hr size="1" width="100%">
				${B_CONTENT}
				<hr size="1" width="100%">
				<c:if test="${sessionScope.id==board.WRITER}">
					<input type="button" value="수정" class="inputb"
						onclick="location.href='update1.puzzle?BNO=${command.BNO}'">
					<input type="button" value="삭제" class="inputb"
						onclick="location.href='delete1.puzzle?BNO=${command.BNO}'">
				</c:if>
				<input type="button" value="목록" class="inputb"
					onclick="location.href='boardList.puzzle'">
			</div>
			<div>
				<div align="left">
					<span>댓글 ${count}건</span>
				</div>
				<hr size="1" align="left" width="50%">
				<form:form enctype="multipart/form-data" action="writeComment.do"
					commandName="command">
					<input type="hidden" name="BNO" value="${board.BNO}"/>
					<input type="hidden" name="EMAIL" value="${sessionScope.id}"/>
					<div id="comment_div">
						<form:textarea path="CONTENT" id="comment_content" cols="80"
							row="4" />
						<input type="submit" id="comment_submit" value="입력"
							class="inputb2" /> <br>
					</div>
					<hr size="1" align="left" width="50%">
					<table id="comment_list" align="left" width="800">
						<thead>
							<tr>
								<td width="40" align="center">번호</td>
								<td width="60" align="center">작성자</td>
								<td width="400" align="center">내용</td>
								<td width="100" align="center">날짜</td>
								<td></td>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="article" items="${commentList}">
								<tr>
									<td align="center">${article.CNO}</td>
									<td align="center">${article.NAME}</td>
									<td>${article.CONTENT}</td>
									<td><fmt:formatDate value="${article.REG_DATE}"
											pattern="yy/MM/dd" /></td>
									<td><c:if test="${sessionScope.id==article.EMAIL}">
											<input type="button" value="삭제" class="inputb"
												onclick="location.href='deleteComment1.puzzle?BNO=${command.BNO}&CNO=${article.CNO}'"/></td>
									</c:if>
								</tr>
							</c:forEach>

							<c:if test="${count==0}">
								<tr>
									<td colspan="5" class="align-center">등록된 댓글이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<br>
					<hr size="1" align="left" width="100%">
				</form:form>
			</div>
		</c:if>
		<c:if
			test="${sessionScope.DEPT_NUM!=board.DEPT_NUM&&sessionScope.name!='admin'}">
			<br>
			<p align="center">볼수 있는 권한이 없습니다.</p>
			<br>
			<div align="center">
				<input type="button" id="back" value="뒤로" class="inputb2"
					onclick="location.href='boardList.puzzle'" />
			</div>
		</c:if>
	</c:if>
	<c:if test="${board.WRITE_TYPE=='공개'}">
	<div id="detail">
		<h3>작성글</h3>
		<ul>
			<li>번호 : ${board.BNO}</li>
			<li>작성자 : ${board.NAME}</li>
			<li>제목 : ${board.SUBJECT}</li>
			<li>등록날짜 : <fmt:formatDate value="${board.REG_DATE}"
					pattern="yy년 MM월 dd일" /></li>
		</ul>

		<hr size="1" width="100%">
		${B_CONTENT}
		<hr size="1" width="100%">
		<c:if test="${sessionScope.id==board.WRITER}">
			<input type="button" value="수정" class="inputb"
				onclick="location.href='update1.puzzle?BNO=${command.BNO}'">
			<input type="button" value="삭제" class="inputb"
				onclick="location.href='delete1.puzzle?BNO=${command.BNO}'">
		</c:if>
		<input type="button" value="목록" class="inputb"
			onclick="location.href='boardList.puzzle'">
	</div>
	<div>
		<div align="left">
			<span>댓글 ${count}건</span>
		</div>
		<hr size="1" align="left" width="50%">
		<%-- <form:form enctype="multipart/form-data" action="writeComment.puzzle"
			commandName="command"> --%>
		<form method="POST" action="writeComment.puzzle" commandName="command">
			<input type="hidden" name="BNO" value="${board.BNO}"/>
			<input type="hidden" name="EMAIL" value="${sessionScope.id}"/>
			<div id="comment_div">
				<%-- <form:textarea path="CONTENT" id="comment_subject" cols="80" row="4" /> --%>
				<textarea rows="4" cols="80" name="CONTENT"
					id="comment_subject"></textarea>
				<input type="submit" id="comment_submit" value="입력" class="inputb2" />
				<br>
			</div>
			<hr size="1" align="left" width="50%">
			<table id="comment_list" align="left" width="800">
				<thead>
					<tr>
						<td width="40" align="center">번호</td>
						<td width="60" align="center">작성자</td>
						<td width="400" align="center">내용</td>
						<td width="100" align="center">날짜</td>
						<td></td>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="article" items="${commentList}">
						<tr>
							<td align="center">${article.CNO}</td>
							<td align="center">${article.NAME}</td>
							<td>${article.CONTENT}</td>
							<td><fmt:formatDate value="${article.REG_DATE}"
									pattern="yy/MM/dd" /></td>
							<td><c:if test="${sessionScope.id==article.EMAIL}">
									<input type="button" value="삭제" class="inputb"
										onclick="location.href='deleteComment1.puzzle?BNO=${command.BNO}&CNO=${article.CNO}'"/></td>
							</c:if>
						</tr>
					</c:forEach>

					<c:if test="${count==0}">
						<tr>
							<td colspan="5" class="align-center">등록된 댓글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<br>
			<hr size="1" align="left" width="100%">
		<%-- </form:form> --%>
		</form>
	</div>
	</c:if>
</body>
</html>