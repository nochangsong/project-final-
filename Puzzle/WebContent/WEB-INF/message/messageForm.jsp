<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>메시지 보내기</h2>
	<form:form commandName="MessageCommand">
		<form:errors element="div" /> <!-- 글로벌 에러 -->
		받는 사람: <form:input path="receiver" />
		<form:errors path="receiver" element="div"/> <!-- userId에 대한 에러 -->
		<br />
		내용 : <form:password path="content"/>
		<form:errors path="content" element="div"/>
		<br />
		<input type="submit" value="보내기"/>
	</form:form>
</body>
</html>