<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>

</head>
<body>
<div>
<form:form commandName="command">
E_mail :<input name="email" id="email" type="text">
인증번호 :<input name="certify" id="certify" type="text">
<input type="submit" value="인증"/>
</form:form>
</div>


</body>
</html>