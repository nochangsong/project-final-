<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	var tag = "<form id='add'><input type='text' id='a' size='20'/><input type='button' onclick='add()' value='�߰�'/><input type='button' onclick='cancel()' value='���'/></form>";

// 	ī�װ� �߰��ϴ� �Է��� ����
	function insert(){
		$("#category").append(tag);		
	}
	
// 	�߰��� �Է��� ���
	function cancel(){
		$("#add").on('click',function(){
			$(this).remove();
		});
	}
	
// 	�Է����� ���� ������ li�±� �߰�
	function add(){
		var addli = $("#a").val();
		$("#category").append('<li>&nbsp;'+addli+'</li>');
		$("#add").on('click',function(){
			$(this).remove();
		});
	}
	
	function delete(){
		
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
						<div class="panel-heading">������<button id="insert" onclick="insert()">+</button><button id="delete" onclick="delete()">����</button></div>
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