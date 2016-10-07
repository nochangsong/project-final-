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
<style>
	.bodyOne{
		font-size: x-small;
	}

	.bodyOne>a{
		font-size: small;
	}
	
	.bodyOne>button{
		text-align: right;
	}
</style>
<script>
// 	var tag='<form:form commandName='com' id='add'><form:input path='Dept_Type' size='20'/><form:button id='add' value='추가'/><form:button id='cancel' value='취소'/></form:form>';
	var tag = '<form:form commandName='com' id='add'><form:input type='text' path='dept_Type' size='20'/><form:button onclick='add()'>추가</form:button><form:button onclick='return cancel()'>취소</form:button></form:form>';

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
	 	var dept_Type = $(this).val();
		$.ajax({
			type:"post"		// 포스트방식
			,url: "deptermentList.puzzle"		// url 주소
// 			,data:params	//  요청에 전달되는 프로퍼티를 가진 객체
			,dataType:"json"
			,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
				$("#category").append('<li>&nbsp;'+dept_Type+'</li>');
 				$("#add").on('click',function(){
 					$(this).remove();
 				});
			}
		,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
		    	alert(e.responseText);
		    }
		});
	}


// 	수정하는 부분
	function edit() {
		var dept_Type = $(this).val();
		$.ajax({
			type:"post"		// 포스트방식
			,url: "deptermentList.puzzle"		// url 주소
// 			,data:params	//  요청에 전달되는 프로퍼티를 가진 객체
			,dataType:"json"
			,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
				$("#category").append('<li>&nbsp;'+dept_Type+'</li>');
 				$("#add").on('click',function(){
 					$(this).remove();
 				});
			}
		,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
		    	alert(e.responseText);
		    }
		});
	}
	
// 	해결해야하는 부분
 	function editOk(){
		var dept_Type = $("#edit_dept").val();
		$.ajax({
			type:"post"		// 포스트방식
			,url: "update.puzzle"		// url 주소
// 			,data:params	//  요청에 전달되는 프로퍼티를 가진 객체
			,dataType:"json"
			,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
				$("#category").append('<li>&nbsp;'+edit_dept+'</li>');

			}
		,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
		    	alert("에러남");
		    }
		});
	} 

	

	function edit_cancle() {
		location.href="positionList.puzzle";
	}
	
	$(function(){			
		$("#category>li").one("click",function(){
			var dept_Type = $(this).text();
			$(this).replaceWith("<input type=text id='edit_dept' onclick='edit()' value='"+dept_Type+"'/><input type=button onclick='editOk()' value='수정'/><input type=button onclick='edit_cancle()' value='취소'/>");
		});
		
// 		$("#memberStatusTab")
		
	});

	
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
<!--										<li>&nbsp;카테고리1</li> -->
<!--										<li>&nbsp;카테고리2</li> -->
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		<div class="col-sm-8">
			<div class="panel-grop">
				<div class="panel panel-default">
					<div class="panel-heading">조직원<span style="text-align: right"> [전체 : 2 재직 : 2 휴직 : 0 퇴직 : 0] </span> <button id="select">검색</button>
					
					</div>
						<div class="panel-body">
							<div class="bodyOne">
							<a href="#">*혹시 동료가 Gmail 이용자가 아니신가요?</a><button id="memlist">조직원 리스트 설정</button><button id="memedit">조직원 편집</button><button id="memadd">조직원 추가</button>
							</div>
						</div>
						<div class="panel-body">
							<ul id="memberStatusTab" class="nav nav-pills padding-left-15 padding-20">
								<c:forEach var="memberStatusTab" items="${memberStatusTab}">
									<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
								</c:forEach>

							</ul>
						</div>
				</div>
			</div>	
		</div>
	</div>
</div>
</body>
</html>
