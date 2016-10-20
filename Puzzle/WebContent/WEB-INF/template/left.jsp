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
					<img alt="�����ΰ�" src="/Puzzle/admin/company/getLogo.puzzle" />
				</div></li>
			<c:if test="${sessionScope.authority=='1'}">
				<li id="dropMenu1" class="menu"><a href="#"><span
						class="glyphicon glyphicon-cog">&nbsp;������</span></a>
					<ul class="nav nav-pills nav-stacked hide">
						<li><a href="/Puzzle/admin/company/company.puzzle"><span
								class="glyphicon glyphicon-wrench">&nbsp;��������</span></a></li>
						<li><a href="/Puzzle/admin/position/positionList.puzzle"><span
								class="glyphicon glyphicon-tasks">&nbsp;���ް���</span></a></li>
						<li><a href="/Puzzle/department/departmentList.puzzle"><span
								class="glyphicon glyphicon-credit-card">&nbsp;������/����������</span></a></li>
						<li><a href="/Puzzle/docubox/DocuBoxAll.puzzle"><span
								class="glyphicon glyphicon-inbox">&nbsp;��ü������</span></a></li>
						<li><a href="#"><span class="glyphicon glyphicon-pencil">&nbsp;�������</span></a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-list-alt">&nbsp;�Խ��ǰ���</span></a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-calendar">&nbsp;���°���</span></a></li>
					</ul></li>
			</c:if>
			<li class="menu"><a href="/Puzzle/document/lately.puzzle"><span
					class="glyphicon glyphicon-edit">&nbsp;��ȹ����ۼ�</span></a></li>
			<li class="menu"><a href="#"><span
					class="glyphicon glyphicon-duplicate">&nbsp;�����ҹ���</span></a></li>
			<li id="dropMenu2" class="menu"><a href="#"><span
					class="glyphicon glyphicon-blackboard">&nbsp;�Խ���</span></a>
				<ul class="nav nav-pills nav-stacked hide">
					<li><a href="/Puzzle/notify/notifyList.puzzle"><span
							class="glyphicon glyphicon-bullhorn">&nbsp;��������</span></a></li>
					<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=1">������</a></li>
					<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=2">������</a></li>
					<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=3">�λ���</a></li>
				</ul></li>
			<li class="menu"><a href="#"><span
					class="glyphicon glyphicon-user">&nbsp;����������</span></a></li>
			<li id="dropMenu3" class="menu last"><a href="#"><span
					class="glyphicon glyphicon-calendar">&nbsp;��������</span></a>
				<ul class="nav nav-pills nav-stacked hide">
					<li><a href="/Puzzle/calendar/calendarList.puzzle">��������</a></li>
					<li><a href="/Puzzle/work/workListNormal.puzzle">������Ȳ</a></li>
					<li><a href="/Puzzle/work/vacation.puzzle">�ް����</a></li>
				</ul></li>
		</ul>
	</div>
</body>
</html>