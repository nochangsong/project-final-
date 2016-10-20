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
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	.border{
		padding: 30px 0px;
		width: 800px;
		height: auto;
		margin: 15px 25px;
	}
	.border label{
		font-size: 15px;
		margin-bottom: 15px;
		display: block;
	}
	.border input{
		margin-bottom: 30px;
	}
	.btndiv{
 		margin-top: 50px;
 		text-align: right;
 		height:30px;
 	}
 	.b{
 		padding: 10px 30px;
 	}
</style>
<script>
	$(function(){
		function set(){
			alert("set()");
			$("#receiver").val(email);
			$("#content").focus();
		}

		$("#receiver").autocomplete({
			source: function(request, response) {
        	$.ajax({
				url : "/Puzzle/message/searchEmail.puzzle",
				type : "post",
				data : {
					search: request.term
				},
				dataType : "json",
				success : function(data) {
// 					alert(decodeURIComponent(data.list[0].name));
					response($.map(data.list, function(item){
						var label = decodeURIComponent(item.name) + " (" + item.sender + ", " + decodeURIComponent(item.dept_type) + ")";
						return {
							label: label,
							value: item.sender
						}
					}))
				}
			});
        	minLength: 2
			}
		})
	
	})
	
	
</script>
</head>
<body>
	<div class="title">
		<h3>쪽지보내기</h3>
	</div>
	<div class="border">
	<form:form commandName="messageCommand">
		<form:errors element="div" /> <!-- 글로벌 에러 -->
		<div class="form-group">
    		<label for="receiver">받는 사람 :</label>
    		<form:input path="receiver" value="${sender}" class="form-control" id="receiver"/><form:errors path="receiver" element="div"/>
  		</div>
  		<div id="result"></div>
  		<div class="form-group">
    		<label for="content">내용 :</label>
    		<form:textarea id="content" style="height: 300px" path="content" class="form-control"/><form:errors path="content" element="div"/>
  		</div>
<%-- 		받는사람 : <form:input path="receiver" /><form:errors path="receiver" element="div"/><br> --%>
<%-- 		내용 : <form:textarea path="content"/><form:errors path="content" element="div"/><br> --%>
		<div class="btndiv">
			<input type="submit" value="보내기" class="btn btn-default b"/>
			<input type="button" value="취소" class="btn btn-default b" onclick="location.href='messageList.puzzle'"/>
		</div>
	</form:form>
	</div>
</body>
</html>