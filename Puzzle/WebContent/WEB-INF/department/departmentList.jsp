<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%

	request.setCharacterEncoding("UTF-8");    

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-2.2.4.js"></script>
<style>
	.bodyOne{
		font-size: small;
	}

	.bodyOne>a{
		font-size: small;
	}
	
	.bodyOne>button{
		text-align: right;
	}
	
	.panel-heading>span{
		font-size: small;
	}
	
	.panel-body{
		padding-top: 5px;
		padding-bottom: 5px;
	}
</style>
<script>


	var selected_deptType;
	
	function sel(dept_Num){
		selected_deptType = dept_Num;
	}

	
	function add(){
		var deptType = $("#newdeptType").val();
		
		if(deptType==''){
			alert("부서명을 입력해주세요.");
			return false;
		}
		getList("insert", "", deptType);
		
		$("#newdeptType").val("부서추가");
	}
	
	function del(){
		if(selected_deptType==null){
			alert("부서를 선택해주세요.");			
			return false;
		}
		getList("delete", selected_deptType);
	}
	
// 	추가한 입력폼 취소
	function cancel(){
		$("#add").on('click',function(){
			$(this).remove();
		});
		return false;
	}

	function edit(){
		var dept_Type = $("#"+selected_deptType).val();
		getList("update", selected_deptType, dept_Type);
	}


	
	function cancel(){
		getList();
	}
	
// 	수정하는 부분
	function editCheck() {
		if(selected_deptType == null){
			alert("수정할 부서를 선택해주세요.");
			return false;
		}
		
		$("#"+selected_deptType).removeAttr("readonly").focus().after("<input type='button' class='btn btn-default temp' onclick='return edit()' value='수정'/>"
				+"<input type='button' class='btn btn-default temp' id='cancle' onclick='edit_cancle()' value='취소'/>");
	}
		
		
	function getList(type, dept_Num, dept_Type){
		var url = "/Puzzle/admin/department/departmentList.puzzle";
		$.ajax({
			type:"post"		// 포스트방식
			,data: {
				type: type,
				dept_Num: dept_Num,
				dept_Type: dept_Type
			}
			,url: url	// url 주소	
			,dataType:"json"
			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			,success:function(args){	
				$(".deptlist").html("");
				if(args.list.length==0){
					$(".deptlist").append("<div class='panel-body'>직급/직책을 추가해주세요.</div>");
				} else {
					for(var idx=0; idx<args.list.length; idx++){
						var dept_Type = decodeURIComponent(args.list[idx].dept_Type);
						var dept_Num = args.list[idx].dept_Num;
						$(".deptlist").append(
								"<div class='panel-body'><input id='"+dept_Num+"' class='form-control' " +
								"value='"+dept_Type+"' onclick='sel("+dept_Num+")' readonly/></div>");
					}
				}
			}
		    ,error:function(e) {	
		    	Console.log(e.responseText);
		    }
		});
	}
	
	$(function(){	
		
		getList();
		
	});

// 	function getpersonList(type, Name, Email, Position_Num, ){
// 		var url = "/Puzzle/admin/department/departmentList.puzzle";
// 		$.ajax({
// 			type:"post"		// 포스트방식
// 			,data: {
// 				type: type,
// 				dept_Num: dept_Num,
// 				dept_Type: dept_Type
// 			}
// 			,url: url	// url 주소	
// 			,dataType:"json"
// 			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
// 			,success:function(args){	
// 				$(".deptlist").html("");
// 				if(args.list.length==0){
// 					$(".deptlist").append("<div class='panel-body'>직급/직책을 추가해주세요.</div>");
// 				} else {
// 					for(var idx=0; idx<args.list.length; idx++){
// 						var dept_Type = decodeURIComponent(args.list[idx].dept_Type);
// 						var dept_Num = args.list[idx].dept_Num;
// 						$(".deptlist").append(
// 								"<div class='panel-body'><input id='"+dept_Num+"' class='form-control' " +
// 								"value='"+dept_Type+"' onclick='sel("+dept_Num+")' readonly/></div>");
// 					}
// 				}
// 			}
// 		    ,error:function(e) {	
// 		    	Console.log(e.responseText);
// 		    }
// 		});
// 	}

	


</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<h3>조직도/조직원 관리</h3>
<h5>조직의 조직도/조직원을 관리 할 수 있습니다.</h5>
<br>
<div>
	<div class="row">
		<div class="col-sm-4">
			<div class="panel-group">
				<div class="panel panel-default">
				<div class="panel-heading">
					조직도
					<input type="button" id="insert" class="btn btn-default" value="+" title="추가하기" onclick="return add()">
					<input type="button" class="btn btn-default" onclick="return editCheck();" value="수정">
					<input type="button" class="btn btn-default" onclick="return del();" value="삭제">
				</div>
				<div class="panel">
					<input type="button" class="btn btn-default" value="puzzle">
				</div>
				<div class='panel-body'>
					<input  id="newdeptType" type="text" class="form-control" placeholder="부서추가"/>
				</div>
				<div class="deptlist">
				</div>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
 			<div class="panel-grop">
				<div class="panel panel-default">
					<div class="panel-heading">조직원<span> [전체 : 2 재직 : 2 휴직 : 0 퇴직 : 0] </span> <button id="select">검색</button>
					
					</div>
						<div class="panel-body">
							<div class="bodyOne">
							<a href="#">*혹시 동료가 Gmail 이용자가 아니신가요?</a><button id="memlist">조직원 리스트 설정</button><button id="memedit">조직원 편집</button><button id="memadd">조직원 추가</button>
							</div>
						</div>
						<div class="panel-body">
							<ul id="memberStatusTab" class="nav nav-pills padding-left-15">
								<li><a href="#" data-toggle="tab" data-id="1" class="statusBtn">전체</a></li>
									<c:forEach var="memberStatusTab" items="${memberStatusTab}">
										<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
									</c:forEach>
								<li><a href="#" data-toggle="tab" data-id="2" class="">재직</a></li>
									<c:forEach var="memberStatusTab" items="${memberStatusTab}">
										<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
									</c:forEach>
								
							</ul>	   
						</div>
						<div class="panel-body">
						<div class="col-sm-6">
						<div class="tab-content">
							<div class="panel-body detailMemberBtn" data-id="29243" style="cursor:pointer; margin-top:0px;">
								<div class="panel-img ">					
									<div class="default-img " data-code="12609" style="background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);">
										<span>ㅁ</span>
									</div>				
								</div>
								<div class="panel-content">
									<div class="member_isAdmin ">			
										<span data-id="29243" class="label label-orange">문서관리자</span>
							        </div>
								<div class="infinite_name panel-workflow">
									ㅁ
								</div>
								<div class="infinite_name panel-workflow">
									CEO
								</div>
								<div class="infinite_name panel-workflow">
									인사팀,홍보팀
								</div>
								</div>
								<div class="panel-email infinite_name">
									<i class="ti ti-email"></i>
									<a href="https://mail.google.com/mail/u/0/?view=cm&amp;fs=1&amp;to=joobk1225@naver.com" target="_blank">
										joobk1225@naver.com
									</a>
									<input type="text" pa ></input>
								</div>
							</div>
						</div>
						</div>
						<div class="col-sm-6">
						<div class="tab-content">
							<div class="panel-body detailMemberBtn" data-id="29243" style="cursor:pointer; margin-top:0px;">
								<div class="panel-img ">					
									<div class="default-img " data-code="12609" style="background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);">
										<span>ㅁ</span>
									</div>				
								</div>
								<div class="panel-content">
									<div class="member_isAdmin ">			
										<span data-id="29243" class="label label-orange">문서관리자</span>
							        </div>
								<div class="infinite_name panel-workflow">
									ㅁ
								</div>
								<div class="infinite_name panel-workflow">
									CEO
								</div>
								<div class="infinite_name panel-workflow">
									인사팀,홍보팀
								</div>
								</div>
								<div class="panel-email infinite_name">
									<i class="ti ti-email"></i>
									<a href="https://mail.google.com/mail/u/0/?view=cm&amp;fs=1&amp;to=joobk1225@naver.com" target="_blank">
										joobk1225@naver.com
									</a>
									<input type="text" pa ></input>
								</div>
							</div>
						</div>
					</div>	
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
