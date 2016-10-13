<%@ page contentType="text/html; charset=utf-8"%>
<%
	session.removeAttribute("compNum");
	session.setAttribute("id", "efgh@naver.com");
	session.setAttribute("dept_num", "2");
	session.setAttribute("name", "efgh");
%>
<script>
	alert('세션: 개인 로그인 정보 생성');
	location.href="/Puzzle/viewSession.jsp";
</script>
