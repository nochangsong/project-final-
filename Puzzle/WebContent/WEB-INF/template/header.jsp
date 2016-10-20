<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<nav class="navbar-inverse">
	<div class="container-fluid">
		<div class="col-sm-11" id="logo">
			<a href="/Puzzle/main/main.puzzle"><img
				src="/Puzzle/img/logo.png" width="180px"></a>
		</div>
		<div class="col" id="message">
			<a href="/Puzzle/message/messageList.puzzle"> <img
				src="/Puzzle/img/message.png"><span class="badge"></span><br>
				<label>message</label></a>
		</div>
		<div class="col" id="main">
			<a href="#"><img src="/Puzzle/img/user.png"><br> <label>user</label></a>
		</div>
	</div>
</nav>
