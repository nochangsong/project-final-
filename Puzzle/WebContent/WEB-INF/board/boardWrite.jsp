<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 게시판</title>
<link rel="stylesheet" href="../css/board.css" type="text/css">
</head>
<body>
<form:form enctype="multipart/form-data" action="write.puzzle" commandName="command">
 
    <fieldset>
        <legend>글쓰기</legend>
        <form:errors element="div" />
        <ul>
            <li>
                <label for="subject"><spring:message code="write.form.subject" /></label>
                <form:input path="SUBJECT"/><br>
                <form:errors path="SUBJECT"/>            
            </li>
            <li>
                <label for="writer"><spring:message code="write.form.writer" /></label>
                <form:input path="WRITER"/><br>
                <form:errors path="WRITER"/>            
            </li>
            <li>
                <label for="write_type"><spring:message code="write.form.write_type" /></label>
                <form:select path="WRITE_TYPE">
                	<form:option value="공개"/>
                	<form:option value="비공개"/>
                </form:select>  
            </li>
            <li>
                <label for="content"><spring:message code="write.form.content" /></label><br>
                <form:textarea path="B_CONTENT" cols="80" row="20" style="margin: 0px; width: 550px; height: 300px;"/><br>
                <form:errors path="B_CONTENT"/>            
            </li>
<%--             <li>
                <label for="upload"><spring:message code="write.form.upload" /></label>
                <input type="file" name="upload" id="upload">         
            </li> --%>
            <li class="align-center">
                <input type="submit" value="<spring:message code="write.form.submit"/>" class="inputb2">
                <input type="button" value="<spring:message code="list.content.title"/>" class="inputb2" onclick="location.href='boardList.puzzle'">
            </li>
        </ul>
    </fieldset>
</form:form>
</body>
</html>