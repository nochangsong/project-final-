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
// 	var tag='<form:form commandName='com' id='add'><form:input path='Dept_Type' size='20'/><form:button id='add' value='�߰�'/><form:button id='cancel' value='���'/></form:form>';
	var tag = '<form:form commandName='com' id='add'><form:input type='text' path='Dept_Type' size='20'/><form:button onclick='return add()'>�߰�</form:button><form:button onclick='return cancel()'>���</form:button></form:form>';

// 	ī�װ� �߰��ϴ� �Է��� ����
	function insert(){
		$("#category").append(tag);		
	}
	
// 	�߰��� �Է��� ���
	function cancel(){
		$("#add").on('click',function(){
			$(this).remove();
		});
		return false;
	}
	
// 	�Է����� ���� ������ li�±� �߰�
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
						<div class="panel-heading">������<button id="insert" onclick="insert()">+</button><button id="delete">����</button></div>
							<ul class="nav nav-stacked">
								<li id="menu"><a href="#">puzzle</a>
									<ul class="hide" id="category">
										<li>&nbsp;ī�װ�1</li>
										<li>&nbsp;ī�װ�2</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
		<div class="col-sm-8">
			������ ������
		</div>
	</div>
</div>
</body>
</html>