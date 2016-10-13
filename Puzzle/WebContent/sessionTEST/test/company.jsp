<%@ page contentType="text/html; charset=utf-8"%>
<%
session.removeAttribute("compNum");
session.setAttribute("id", "comp2");
session.setAttribute("grade", "2");
session.setAttribute("schul_num", "13800558");
session.setAttribute("name", "com");
%>
<script>
	alert('세션: 유치원 로그인 정보 생성');
	location.href="/FORKI/viewSession.jsp";
</script>
