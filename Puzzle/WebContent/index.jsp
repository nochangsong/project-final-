<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>

	body {
		margin : 0;
		padding : 0;
		background : url (img.jpg) center center fixed no-repeat;
	}
	
	video {
		position : fixed;
		top : 0; 
		left : 0;
		min-width : 100 %;
		min-height : 100 %;
		width : auto;
		height : auto;
		z-index : -1;
	}	
	
	#background{
		opacity: 0.6;
	}
		
	#login{
		margin-top: 200px;
		text-align: center;
		font-weight: bold;
	}	
	
</style>
</head>
<body>
<div class="container">

<div class="col-sm-12" id="content" style="text-align: center">
	<video id="background" preload="auto" autoplay="autoplay"> 
		<source src="3145.mp4" type="video/mp4">
	</video>
	<div class="col-md-4" id="login">
		<div>
		<a href="main/admin.puzzle">admin</a><br>
		<a href="main/user.puzzle">user</a><br>
		<a href="user/document.puzzle">board/docuform</a><br>
		<a href="user/document/docuWrite.puzzle">board/docuwrite</a>
		</div>
	</div>
</div>

</div>
<%-- <% response.sendRedirect("main/main.puzzle"); %> --%>
</body>
</html>