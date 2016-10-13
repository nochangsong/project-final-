
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<script>
	setTimeout("location.reload()", 20000);
</script>
<title>로그인 세션 컨트롤 </title>
</head>
<body>
	<!-- TEST를 위한 문서, 세션의 저장상태 설정과 현상태를 보여준다. -->
	<table width="100%" border="1">
		세션ID :	<%=session.getId()%><br> <!-- 생성된 세션의 아이디값 -->
		ID : ${sessionScope.id }<br> <!-- ID세션이 가진 값 -->
		DEPT_NUM : ${sessionScope.dept_num }<br> <!-- KEY세션이 가진 값 -->
		NAME : ${sessionScope.name }<br> 
		SCHUL_NUM : ${sessionScope.schul_num } (사업자만 세션 생성)<br> <!-- 사업자번호 세션이 가진 값 -->
		<%	time.setTime(session.getCreationTime());%>
		세션생성시간 : <%=formatter.format(time)%><br>
		<%	time.setTime(session.getLastAccessedTime());%>
		최근접근시간 : <%=formatter.format(time)%>
		<hr />
		<input type="button" onclick="location.href='/Puzzle/sessionTEST/test/admin.jsp'" value="관리자 로그인">
		<input type="button" onclick="location.href='/Puzzle/sessionTEST/test/person.jsp'" value="개인 로그인">
		<input type="button" onclick="location.href='/Puzzle/sessionTEST/test/person2.jsp'" value="개인2 로그인">
		<input type="button" onclick="location.href='/Puzzle/sessionTEST/test/company.jsp'" value="유치원 로그인">
		<input type="button" onclick="location.href='/Puzzle/sessionTEST/test/logout.jsp'" value="로그아웃">
	</table>
	<hr />
</body>
</html>