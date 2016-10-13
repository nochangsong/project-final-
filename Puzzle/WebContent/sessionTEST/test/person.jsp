<%@ page contentType="text/html; charset=utf-8"%>
<%
	session.removeAttribute("compNum");
	session.setAttribute("id", "abcd@naver.com");
	session.setAttribute("dept_num", "1");
	session.setAttribute("name", "abcd");
%>
<script>
	alert('세션: 개인 로그인 정보 생성');
	location.href="/Puzzle/viewSession.jsp";
</script>
