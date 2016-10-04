<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%
	System.out.println(request.getParameter("checking"));
	String check = request.getParameter("checking");
%>
<title></title>
</head>
<body>
	<%
		if (check.equals("1")) {
	%>
	<iframe width="100%" height="100%" 
		src="https://docs.google.com/spreadsheets/create?usp=drive_web&folder=0AMGaJxLiuXrrUk9PVA&authuser=0"></iframe>
	<%
		} else if (check.equals("2")) {
	%>
	<iframe width="100%" height="100%"
		src="https://docs.google.com/document/create?usp=drive_web&folder=0AMGaJxLiuXrrUk9PVA&authuser=0"></iframe>
	<%
		} else if (check.equals("3")) {
	%>
	<iframe width="100%" height="100%"
		src="https://docs.google.com/presentation/create?usp=drive_web&folder=0AMGaJxLiuXrrUk9PVA&authuser=0"></iframe>
	<%
		}
	%>


</body>
</html>