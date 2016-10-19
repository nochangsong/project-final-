<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- <link rel="stylesheet" href="../css/board.css" type="text/css"> -->
<style type="text/css">
#box {
	width: 290px;
	border: 1px;
	float: left;
	overflow: hidden;
	margin-left: 5px;
	margin-bottom: 10px;
	margin-top: 10px;
}

table {
	width: 280px;
	border: 1px solid #bcbcbc;
}

td {
	align: center;
	border: 1px solid #bcbcbc;
	vertical-align: middle;
}

table.alignCenter {
	margin-left: auto;
	margin-right: auto;
}

table.alignRight {
	float: right;
}
.first_td_a{
height: 40px;
vertical-align: middle;
}
</style>
<title>게시판 리스트</title>
</head>
<body>
	<div id="box">
		<table>
			<tr>
				<td align="center" style="height: 40px;">
					<a class='first_td_a' href="#">공지사항</a>
				</td>
			</tr>
			<tr height="250">
				<c:if test="${notifycount!=0}">
				<td>
				<c:forEach var="notify" items="${notifylist}">
						<!-- <td> -->
							<a  href="notifyview.puzzle?BNO=${notify.BNO}">${notify.SUBJECT}</a><br><br>
							<div style="float:left; width:50px">${notify.NAME}</div>
							<div style="float:right; width:110px;">
								<fmt:formatDate value="${notify.REG_DATE}" pattern="yy년MM월dd일" />
							</div>
							<hr size="1" width="100%">
						<!-- </td> -->
				</c:forEach>
				</td>
				</c:if>
				<c:if test="${notifycount==0}">
					<td colspan="5" align="center">등록된 게시물이 없습니다.<br> 
					<c:if test="${sessionScope.position_num==1}">
						<input type="button" value="글쓰기" class="input_b"
							onclick="location.href='/Puzzle/board/write1.puzzle'"/>
					</c:if>
					</td>
				</c:if>
			</tr>
		</table>
	</div>

		<div id="box">
		<table>
			<tr>
				<td align="center" style="height: 40px;"><a  class='first_td_a' href="#">영업팀</a></td>
			</tr>
			<tr height="250">
				<c:if test="${count!=0}">
				<td>
				<c:forEach var="article" items="${list}">
						<!-- <td> -->
							<a href="/Puzzle/board/view.puzzle?BNO=${article.BNO}">${article.SUBJECT}</a><br><br>
							<div style="float:left; width:50px">${article.NAME}</div>
							<div style="float:right; width:110px;">
								<fmt:formatDate value="${article.REG_DATE}" pattern="yy년MM월dd일" />
							</div>
							<hr size="1" width="100%">
						<!-- </td> -->
				</c:forEach>
				</td>
				</c:if>
				<c:if test="${count==0}">
						<td colspan="5" align="center">등록된 게시물이 없습니다.<br> 
						<c:if test="${sessionScope.dept_num==1||sessionScope.position_num==1}">
							<input type="button" value="글쓰기" class="input_b"
							onclick="location.href='/Puzzle/board/write1.puzzle'">
						</c:if>
						</td>
				</c:if>
		</table>
	</div>

		<div id="box">
		<table>
			<tr>
				<td align="center" style="height: 40px;"><a class='first_td_a' href="#">개발팀</a></td>
			</tr>
			<tr height="250">
				<c:if test="${count2!=0}">
				<td>
				<c:forEach var="article2" items="${list2}">
						<!-- <td> -->
							<a href="/Puzzle/board/view.puzzle?BNO=${article2.BNO}">${article2.SUBJECT}</a><br><br>
							<div style="float:left; width:50px">${article2.NAME}</div>
							<div style="float:right; width:110px;">
								<fmt:formatDate value="${article2.REG_DATE}" pattern="yy년MM월dd일" />
							</div>
							<hr size="1" width="100%">
						<!-- </td> -->
				</c:forEach>
				</td>
				</c:if>
				<c:if test="${count2==0}">
						<td colspan="5" align="center">등록된 게시물이 없습니다.<br> 
						<c:if test="${sessionScope.dept_num==2||sessionScope.position_num==1}">
							<input type="button" value="글쓰기" class="input_b"
							onclick="location.href='/Puzzle/board/write1.puzzle'">
						</c:if>
						</td>
				</c:if>
		</table>
	</div>

		<div id="box">
		<table>
			<tr>
				<td align="center" style="height: 40px;"><a class='first_td_a' href="#">인사팀</a></td>
			</tr>
			<tr height="250" >
				<c:if test="${count3!=0}">
				<td>
				<c:forEach var="article3" items="${list3}">
						<!-- <td> -->
							<a href="/Puzzle/board/view.puzzle?BNO=${article3.BNO}">${article3.SUBJECT}</a><br><br>
							<div style="float:left; width:50px">${article3.NAME}</div>
							<div style="float:right; width:110px;">
								<fmt:formatDate value="${article3.REG_DATE}" pattern="yy년MM월dd일" />
							</div>
							<hr size="1" width="100%">
						<!-- </td> -->
				</c:forEach>
				</td>
				</c:if>
				<c:if test="${count3==0}">
						<td colspan="2" align="center">등록된 게시물이 없습니다.<br> 
						<c:if test="${sessionScope.dept_num==3||sessionScope.position_num==1}">
							<input type="button" value="글쓰기" class="input_b"
							onclick="location.href='/Puzzle/board/write1.puzzle'">
						</c:if>
						</td>
				</c:if>
		</table>
	</div>
</body>
</html>