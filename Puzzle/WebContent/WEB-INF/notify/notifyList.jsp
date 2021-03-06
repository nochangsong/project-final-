<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="../css/board.css" type="text/css">
<style>
#top{
	text-align:center;
}
</style>
<title><%-- ${부서명} --%>게시판 리스트</title>
</head>
<body>
<div id="n_list">
	<div align="center">
		<h2>공지사항</h2>
	</div>
	<div align="center">
		<span>Total ${count}건</span>
		${currentPage} 페이지
	</div>
	
	<div>
		<table class="border-style" width="600">
			<caption>글목록</caption>
			<thead>
			<tr>
				<th id="top" width="40">번호</th>
				<th id="top" width="400">제목</th>
				<th id="top" width="60">작성자</th>
				<th id="top" width="60">날짜</th>
			</tr>
			</thead>
			
			<tbody>
				<c:forEach var="article" items="${list}">
					<tr>
						<td class="align-center">
							${number}<c:set var="number" value="${number-1}"/>
						</td>
						<td>
							<a href="notifyview.puzzle?BNO=${article.BNO}">${article.SUBJECT}</a>
						</td>
						<td>${article.NAME}</td>
						<td><fmt:formatDate value="${article.REG_DATE}" pattern="yy/MM/dd"/></td>
					</tr>
				</c:forEach>
				
				<c:if test="${count==0}">
					<tr>
						<td colspan="5" class="align-center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

<!-- 검색 -->
<form action="notifyList.puzzle" name="search" method="get" onsubmit="return searchCheck()">
	<table class="search">
		<tr>
			<td>
				<select name="keyField">
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
					<option value="all">전체</option>									
				</select>
			</td>
			<td>
				<input type="text" size="16" name="keyWord">
			</td>
			<td>
				<input type="submit" value="찾기" class="input_b">
			</td>
		</tr>
	</table>
</form>

<!-- 페이징 -->
<table>
	<c:if test="${count>0}">
		<tr>
			<td class="align-center">${pagingHtml}</td>
		</tr>
	</c:if>
	<c:if test="${sessionScope.position_num==1}">
		<tr>
			<td class="align-right">
			<input type="button" value="글쓰기" class="input_b" onclick="location.href='notifywrite1.puzzle'">
			</td>
		</tr>
	</c:if>
</table>
</body>
</html>