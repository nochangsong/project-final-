<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 게시판</title>
<link rel="stylesheet" href="../css/board.css" type="text/css">
</head>
<body>
<form:form action="delete.puzzle" commandName="command">
 
   <fieldset>
      <legend align="center">글을 삭제 하시겠습니까?</legend>
      <form:hidden path="BNO"/>
      <form:errors element="div" />
      <ul>         
         <li class="align-center">
            <input type="submit" value="삭제" class="inputb2">
            <input type="button" value="취소" class="inputb2" onclick="location.href='boardList.puzzle'">
         </li>
      </ul>
   </fieldset>
</form:form>
</body>
</html>