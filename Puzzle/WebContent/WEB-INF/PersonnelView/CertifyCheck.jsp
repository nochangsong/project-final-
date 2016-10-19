<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>

</head>
<body>
<div align="center">
<label><h3>인증화면</h3></label>
</div>
<div align="center">
<form:form commandName="command">
<table border="1">
<tr>
<th>E_mail :</th>
<td><input name="email" id="email" type="text"></td>
</tr>
<tr>
<th>인증번호 :</th>
<td><input name="certify" id="certify" type="text"></td>
</tr>
</table>
<br>
<input type="submit" value="인증"/>
</form:form>
</div>


</body>
</html>