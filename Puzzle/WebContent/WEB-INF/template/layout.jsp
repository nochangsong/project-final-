<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="/webSocket.jspf"%>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
@font-face {
	font-family: 'NanumSquareR';
	src: url('/Puzzle/themes/font/NanumSquareR.ttf');
}

@font-face {
	font-family: 'NanumSquareB';
	src: url('/Puzzle/themes/font/NanumSquareB.ttf');
}

body {
	font-family: 'NanumSquareR' !important;
}
.title{
	margin: 35px 25px;
}
nav.navbar-inverse{
	background-color: white;
	border: 0px;
	border-bottom: solid 1px lightgray;
	height: 85px;
	padding: 10px;
}
.col-sm-1 {
	text-align: center;
}
.col-sm-1 img {
	width: 45px;
}
.col {
	text-align: center;
	display: inline-table;
}
#message{
	padding-right: 30px;
}
.col img {
	width: 45px;
}
.row {
	height: 100%;
}

.sidenav {
	height: 100%;
	border-right: solid 1px lightgray;
	float: left;
	width: 15%;
}

.text-left {
	height: 100%;
	width: 85%;
	float: right;
}

footer {
	background-color: #555;
	color: white;
	padding: 10px;
}

.img {
	height: auto;
	width: 100%;
	text-align: center;
}

.img img {
	width: 90%;
}

.nav-stacked li.menu {
	border-top: solid 1px lightgray;
	margin-top: 0px;
	font-size: 17px;
}

.nav-stacked li.menu a {
	padding: 15px 20px;
	color: #747474;	
}

.nav-stacked li.last {
	border-bottom: solid 1px lightgray;
}

.nav-stacked li.menu li {
	font-size: 14px;
}

.nav-stacked li.menu li a {
	padding: 10px 20px;
}

#message img {
	position: relative;
}

#message span {
	position: absolute;
	margin-left: -15px;

}


</style>
<script>
	$(function() {
		$("#dropMenu1").click(function() {
			$("#dropMenu1>ul").toggleClass("hide");
		})
		$("#dropMenu2").click(function() {
			$("#dropMenu2>ul").toggleClass("hide");
		})
		$("#dropMenu3").click(function() {
			$("#dropMenu3>ul").toggleClass("hide");
		})
		
		$(".menu").click(function(){
// 			$(".active>ul").hide();
			$(".active").removeClass("active");
			$(this).addClass("active");
		})
	})
	
	function logout(){
		location.href='/Puzzle/index2.jsp';
	}
</script>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<nav class="navbar-inverse">
		<div class="container-fluid">
			<div class="col-sm-11" id="logo">
				<a href="/Puzzle/main/main.puzzle"><img
					src="/Puzzle/img/logo.png" width="180px"></a>
			</div>
			<div class="col" id="message">
				<a href="/Puzzle/message/messageList.puzzle"> <img src="/Puzzle/img/message.png"><span class="badge"></span><br>
				<label>message</label></a>
			</div>
			<div class="col dropdown" id="main">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/Puzzle/img/user.png"><br>
				<label>user</label></a>
				<ul class="dropdown-menu dropdown-menu-right" style="text-align: center; width: 200px;">
					<li><label>${sessionScope.email}</label></li>
					<li class="divider"></li>
					<li><input type="button" class="btn btn-default" value="Logout" style="width: 90%" onclick="logout()"/></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row">
			<div>
				<tiles:insertAttribute name="left" />
			</div>
			<div class="text-left">
				<tiles:insertAttribute name="content" />
			</div>

		</div>
	</div>

	<footer class="container-fluid text-center">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
