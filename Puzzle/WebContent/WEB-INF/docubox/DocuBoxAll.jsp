<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<title>전체문서</title>
<style>
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
	width: 200px;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f9f9f9;
	min-width: 10px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>
<script>
	$(document).ready(function() {
		$("#checkAll").click(function() {
			$("input[name=allcheck]:checkbox").each(function() {
				$(this).attr("checked", true);
			});
		});
		$("#checkAll").click(function() {
			$("input[name=allcheck]:checkbox").each(function() {
				$(this).attr("checked", false);
		});
	});
});
</script>
</head>
<body>
	<div align="center">
	<h2>전체문서함</h2>
		<div class="dropdown" style="float:center;">
			<button class="dropbt">전체문서</button>
			<div class="dropdown-content">
				<a href="DocuBoxAll.puzzle">전체문서</a> 
				<a href="DocuBoxPG.puzzle">진행중인 문서</a> 
				<a href="DocuBoxFN.puzzle">최종승인 문서</a> 
				<a href="DocuBoxRB.puzzle">반려문서</a>
			</div>
		</div>
		<br>
		<br>
		<form:form>
			<table id="doc" border="1">
				<thead>
					<tr>
						<th><input type="checkbox" name="checkAll" id="checkAll" value="전체선택"></th>
						<th>제목</th>
						<th>작성자</th>
						<th>문서양식</th>
						<th>라벨명</th>
						<th>기안일</th>
					</tr>
				</thead>
				<tbody>
					<C:forEach var="All" items="${list}">
						<tr>
							<td><input type="checkbox" name="allcheck"></td>
							<td>${All.fileName}</td>
							<td>${All.email}</td>
							<td>${All.fileType}</td>
							<td>${All.confirm}</td>
							<td>${All.reg_Date}</td>
						</tr>
					</C:forEach>

				</tbody>
				<tfoot>
					<tr>

					</tr>
				</tfoot>
			</table>
		</form:form>
		<div><input class="check" type="button" name="delete" value="선택삭제"></div>
	</div>
	<div align="center">
	<div class="pageing">
		<C:if test="${startPage>4}">
			<ul class="pager">
				<li><a href="DocuBoxAll.puzzle?pageNum=${startPage-1}">Back</a></li>
			</ul>
		</C:if>
		<ul class="pagination">
			<C:forEach var="i" begin="${startPage}" end="${endPage}">
				<li id="${i}"><a href="DocuBoxAll.puzzle?pageNum=${i}">${i}</a></li>
			</C:forEach>
		</ul>
		<C:if test="${pageCount>endPage}">
			<ul class="pager">
				<li><a href="DocuBoxAll.puzzle?pageNum=${startPage+5}">Next</a></li>
			</ul>
		</C:if>
	</div>
	</div>
</body>
</html>