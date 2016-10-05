<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
// 	var tag='<form:form commandName='com' id='add'><form:input path='Dept_Type' size='20'/><form:button id='add' value='추가'/><form:button id='cancel' value='취소'/></form:form>';
	var tag = '<form:form commandName='com' id='add'><form:input type='text' path='Dept_Type' size='20'/><form:button onclick='return add()'>추가</form:button><form:button onclick='return cancel()'>취소</form:button></form:form>';

// 	카테고리 추가하는 입력폼 삽입
	function insert(){
		$("#category").append(tag);		
	}
	
// 	추가한 입력폼 취소
	function cancel(){
		$("#add").on('click',function(){
			$(this).remove();
		});
		return false;
	}
	
// 	입력폼에 넣은 값으로 li태그 추가
	function add(){
		var addli = $("#Dept_Type").val();
		$("#category").append('<li>&nbsp;'+addli+'</li>');
		$("#add").on('click',function(){
			$(this).remove();
		});
		
		return false;
		
	}
	

	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-4">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">조직도<button id="insert" onclick="insert()">+</button><button id="delete">삭제</button></div>
							<ul class="nav nav-stacked">
								<li id="menu"><a href="#">puzzle</a>
									<ul class="hide" id="category">
										<li>&nbsp;카테고리1</li>
										<li>&nbsp;카테고리2</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
		<div class="col-sm-8">
			오른쪽 문서함
		</div>
	</div>
</div>
</body>
</html>