<%@ page contentType="text/html; charset=utf-8"%>
<%
	session.removeAttribute("compNum");
	session.setAttribute("name", "admin");
	session.setAttribute("position_num", "0");
%>
<script>
	alert('세션: 관리자 로그인 정보 생성');
	location.href="/Puzzle/viewSession.jsp";
</script>
