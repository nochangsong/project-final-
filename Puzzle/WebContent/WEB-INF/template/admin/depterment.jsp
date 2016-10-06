<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
// 	var tag='<form:form commandName='com' id='add'><form:input path='Dept_Type' size='20'/><form:button id='add' value='추가'/><form:button id='cancel' value='취소'/></form:form>';
	var tag = '<form:form commandName='com' id='add'><form:input type='text' path='Dept_Type' size='20'/><form:button onclick='add()'>추가</form:button><form:button onclick='return cancel()'>취소</form:button></form:form>';

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
		
		$.ajax({
			type:"post"		// 	포스트방식
	 			,url:url		// 	url 주소
	 			,data:model.DeptCommand	//  요청에 전달되는 프로퍼티를 가진 객체
	 			,dataType:"json"
	 			,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
	 				 alert("a");
	 			}
	 		    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
	 		    	alert(e.responseText);
	 		    }
	 		});

	}
	
	
// 	$(function(){
// 		// dept_type list 가져오기
<%-- 		var url="<%=cp%>/depterment/deptermentList.puzzle"; --%>
// 		$("#menu").click(function(){
// 		$.ajax({
// 			type:"post"		// 	포스트방식
// 			,url:url		// 	url 주소
// 			,data:params	//  요청에 전달되는 프로퍼티를 가진 객체
// 			,dataType:"json"
// 			,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
// 				 for(var idx=0; idx<args.data.length; idx++) {
// 					 $("#category").append("<li>&nbsp;"+args.data[idx]+"</li>");
// 					 //id가 category인 요소선택
// 					 //append로 기존 셀렉터로 선택된 요소 다음에 다음내용이 들어감
// 					 //<li>&nbsp;인사팀</li> 이런식으로 category의 요소안에 자식으로 들어감
// 				 }
// 			}
// 		    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
// 		    	alert(e.responseText);
// 		    }
// 		});
// 	});
// });

	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
									<c:forEach var="dept_type" items="${dept_type}">
										<li>&nbsp;${dept_type.dept_Type }</li>
									</c:forEach>
<!-- 										<li>&nbsp;카테고리1</li> -->
<!-- 										<li>&nbsp;카테고리2</li> -->
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
