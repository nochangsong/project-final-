<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE>
<html>
<head>
<title>로그인</title>
</head>
<body>
<div>
<form:form commandName="logincommand">
Email:<input type="text" name="Email" id="Email">
Password:<input type="password" name="password" id="password">
<div>
<input type="submit" name="lgoin" id="login" value="로그인">
</div>
</form:form>
</div>



</body>
</html>