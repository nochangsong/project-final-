<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
	<div class="sidenav">
		<ul class="nav nav-pills nav-stacked">
			<li><div class="img">
					<img alt="조직로고" src="/Puzzle/admin/company/getLogo.puzzle" />
				</div></li>
			<c:if test="${sessionScope.authority=='1'}">
				<li id="dropMenu1" class="menu"><a href="#"><span
						class="glyphicon glyphicon-cog">&nbsp;관리자</span></a>
					<ul class="nav nav-pills nav-stacked hide">
						<li><a href="/Puzzle/admin/company/company.puzzle"><span
								class="glyphicon glyphicon-wrench">&nbsp;조직관리</span></a></li>
						<li><a href="/Puzzle/admin/position/positionList.puzzle"><span
								class="glyphicon glyphicon-tasks">&nbsp;직급관리</span></a></li>
						<li><a href="/Puzzle/department/departmentList.puzzle"><span
								class="glyphicon glyphicon-credit-card">&nbsp;조직도/조직원관리</span></a></li>
						<li><a href="/Puzzle/docubox/DocuBoxAll.puzzle"><span
								class="glyphicon glyphicon-inbox">&nbsp;전체문서함</span></a></li>
						<li><a href="#"><span class="glyphicon glyphicon-pencil">&nbsp;문서양식</span></a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-list-alt">&nbsp;게시판관리</span></a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-calendar">&nbsp;근태관리</span></a></li>
					</ul></li>
			</c:if>
			<li class="menu"><a href="/Puzzle/document/lately.puzzle"><span
					class="glyphicon glyphicon-edit">&nbsp;기안문서작성</span></a></li>
			<li class="menu"><a href="#"><span
					class="glyphicon glyphicon-duplicate">&nbsp;결제할문서</span></a></li>
			<li id="dropMenu2" class="menu"><a href="#"><span
					class="glyphicon glyphicon-blackboard">&nbsp;게시판</span></a>
				<ul class="nav nav-pills nav-stacked hide">
					<li><a href="/Puzzle/notify/notifyList.puzzle"><span
							class="glyphicon glyphicon-bullhorn">&nbsp;공지사항</span></a></li>
					<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=1">영업팀</a></li>
					<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=2">개발팀</a></li>
					<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=3">인사팀</a></li>
				</ul></li>
			<li class="menu"><a href="#"><span
					class="glyphicon glyphicon-user">&nbsp;조직원정보</span></a></li>
			<li id="dropMenu3" class="menu last"><a href="#"><span
					class="glyphicon glyphicon-calendar">&nbsp;일정관리</span></a>
				<ul class="nav nav-pills nav-stacked hide">
					<li><a href="/Puzzle/calendar/calendarList.puzzle">일정관리</a></li>
					<li><a href="/Puzzle/work/workListNormal.puzzle">근태현황</a></li>
					<li><a href="/Puzzle/work/vacation.puzzle">휴가등록</a></li>
				</ul></li>
		</ul>
	</div>
</body>
</html>