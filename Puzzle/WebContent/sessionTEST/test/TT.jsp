<html>
<head>
<style>
	.box{ width:150px; height:50px; position:absolute; }
	#box1{ z-index:30; background-color:cyan; left:0px; top:0px; }
	#box2{  }
	#box3{ z-index:10; background-color:magenta; left:100px; top:60px; }
</style>
</head>

<body>
	<div id="box1" class="box"></div>
	<div id="box2" class="box"><img src="../img/logo.jpg" width="415" height="150"></div>
	<div id="box3" class="box"></div>
</body>
</html>