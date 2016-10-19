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
$(function(){
    //전체선택 체크박스 클릭
	$("#checkAll").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#checkAll").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	})
})
	
</script>
</head>
<body>
	<h2>대기문서함</h2>
		<div class="dropdown" style="float: right;">
			<button class="btn btn-default dropdown-toggle" type="button">전체문서<span class="caret"></span></button>
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
			<table class="table" id="doc">
				<thead>
					<tr>
						<th><input type="checkbox" name="checkAll" id="checkAll" value="전체선택"></th>
						<th>제목</th>
						<th>작성자</th>
						<th>결재상태</th>
						<th>Email</th>
						<th>기안일</th>
					</tr>
				</thead>
				<tbody>
					<C:forEach var="All" items="${list}">
						<tr>
							<td><input type="checkbox" id="allcheck" name="allcheck"></td>
							<td>${All.fileName}</td>
							<td>${All.writer}</td>
							<td>${All.confirm}</td>
							<td>${All.email}</td>
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