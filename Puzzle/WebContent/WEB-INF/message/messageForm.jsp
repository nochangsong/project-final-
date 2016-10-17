<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src=”http://code.jquery.com/jquery-2.2.4.js”></script>
<style>
/* 	#content { */
/* 		height:300px; */
/* 		width:500px; */
/* 	} */
/* 	table tr { */
/* 		width: 700px; */
/* 	} */
</style>
<script>
	
	$(function(){
		
		function set(){
			alert("set()");
			$("#receiver").val(email);
			$("#content").focus();
		}
		
		$("#receiver").keyup(function(){
// 			alert("keyup()");
	 		var url = "/Puzzle/message/searchEmail.puzzle";
	 		var search = $("#receiver").val();
	 		$.ajax({
	 			type:"post"		// 포스트방식
	 			,data: {
	 				search: search
	 			}
	 			,url: url	// url 주소	
	 			,dataType:"json"
	 			,success:function(args){	
// 	 				alert(args.list.length);
					$("#result").html("");
					for(var idx=0; idx<args.list.length; idx++){
						var name = decodeURIComponent(args.list[idx].name);
						var email = args.list[idx].sender;
						var dept_type = decodeURIComponent(args.list[idx].dept_type);
						$("#result").append("<a href='#'>"+name+"("+email+", "+dept_type+")"+"</a><br>");
					}
	 			}
	 		    ,error:function(e) {	
	 		    	Console.log(e.responseText);
	 		    }
	 		});
		});
		$("#receiver").blur(function(){
			$("#result").html("");
		})
	})
	
	
</script>
</head>
<body>
	<h3>쪽지보내기</h3>
	<br>
	<form:form commandName="messageCommand">
		<form:errors element="div" /> <!-- 글로벌 에러 -->
		
		<div class="form-group">
    		<label for="receiver">받는 사람:</label>
    		<form:input path="receiver" value="${sender}" class="form-control" id="receiver"/><form:errors path="receiver" element="div"/>
  		</div>
  		<div id="result"></div>
  		<div class="form-group">
    		<label for="content">내용:</label>
    		<form:textarea id="content" path="content" class="form-control"/><form:errors path="content" element="div"/>
  		</div>
<%-- 		받는사람 : <form:input path="receiver" /><form:errors path="receiver" element="div"/><br> --%>
<%-- 		내용 : <form:textarea path="content"/><form:errors path="content" element="div"/><br> --%>
		<input type="submit" value="보내기" class="btn btn-default"/>
		<input type="button" value="취소" class="btn btn-default" onclick="location.href='messageList.puzzle'"/>
	</form:form>
</body>
</html>