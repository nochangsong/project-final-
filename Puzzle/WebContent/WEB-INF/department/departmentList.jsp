<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	
	.pasing{
		padding-top: 10px;
	}
	
	#memadd>a{
		font-size: small;
	}
</style>
<script>

	var selected_deptType;
	
	
	function sel(dept_Num){
		selected_deptType = dept_Num;
		
		var dept_Type = $("#"+dept_Num).val();
		var url = "/Puzzle/department/departmemList.puzzle";
		$.ajax({
			type:"post"		// 포스트방식
			,data: {
				dept_Type: dept_Type
			}
			,url: url	// url 주소	
			,dataType:"json"
			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			,success:function(args){
				$("#memAll").remove();
				$(".memAll").remove();
				$("#paging").remove();
				for(var idx=0; idx<args.list.length; idx++){
						var name = decodeURIComponent(args.list[idx].name);
						var email = decodeURIComponent(args.list[idx].email);
						var authority = decodeURIComponent(args.list[idx].authority);
						var dept_Type = decodeURIComponent(args.list[idx].dept_Type);
						var positiontype = decodeURIComponent(args.list[idx].positiontype);
						
						$("#info2").append(
								"<div class='memAll'>"+
								"<div class='col-sm-6'>"+
								"<div class='panel-body detailMemberBtn' style='cursor:pointer; margin-top:0px;'>"+
								"<div class='panel-img'>"+
								"<div class='default-img' style='background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);'>"+
								"<span>"+name+"</span>"+
								"</div>"+
								"</div>"+
								"<div class='panel-content'>"+
								"<div class='member_isAdmin'>"+
								"<span class='label label-orange'>"+authority+"</span>"+
								"</div>"+
								"<div class='infinite_name panel-workflow'>"+name+"</div>"+
								"<div class='infinite_name panel-workflow'>"+email+"</div>"+
								"<div class='infinite_name panel-workflow'>"+dept_Type+"</div>"+
								"</div>"+
								"</div>"+
								"</div>"+
								"</div>");	
						
					}
				var startPage = args.startPage;
				// alert(startPage);
				
				$(".paging").append(
					"<div id='paging'>"+
					"<c:if test='${startPage>5}'>"+
					"<ul class='pager'>"+
					"<li><a href='departmentList.puzzle?pageNum=${startPage-1}'>Previous</a></li>"+
					"</ul>"+
					"</c:if>"+
					"<ul class='pagination'>"+
					"<c:forEach var='i' begin='${startPage}' end='${endPage}'>"+
					"<li id='${i}'><a href='departmentList.puzzle?pageNum=${i}'>${i}</a></li>"+
					"</c:forEach>"+
					"</ul>"+
					"<c:if test='${pageCount>endPage}'>"+
					"<ul class='pager'>"+
					"<li><a href='departmentList.puzzle?pageNum=${startPage+5}'>Next</a></li>"+
					"</ul>"+
					"</c:if>"+
					"</div>"
				);

			}
		    ,error:function(e) {	
		    	Console.log(e.responseText);
		    }
		});
		
	}

	
	function add(){
		var dept_Type = $("#newdeptType").val;
		alert(dept_Type);
		if(dept_Type==''){
			alert("부서명을 입력해주세요.");
			return false;
		}
		getList("insert", "", dept_Type);
		
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
		
	/* function search(){
		$("#search").append(
				"<input type='text' id='sarch' size='15' placeholder='사원명 입력'/>");
		
	} */
	
	function getList(type, dept_Num, dept_Type){
		
		var url = "/Puzzle/department/departmentList.puzzle";
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

		$(".paging .pagination li#"+${pageNum1}).addClass("active");


	});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body onload="getList()">
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
					<input type="button" class="btn btn-default" id="searchButton" value="puzzle">
				</div>
				<div class="panel-body">
					<input type="text" id="newdeptType" class="form-control" placeholder="부서추가">
				</div>
				<div class="deptlist">
				</div>
				</div>
			</div>
		</div>
		
		<div class="col-sm-8">
 			<div class="panel-grop">
				<div class="panel panel-default">
					<div class="panel-heading">조직원<span id="search"> [전체 : 8 재직 : 8 휴직 : 0 퇴직 : 0] </span>
						<input type="button" id="select" data-toggle="modal" data-target="#myModal" value="검색"/>
					</div>
					<div class="panel-body">
						<div class="bodyOne">
						<a href="#">*혹시 동료가 Gmail 이용자가 아니신가요?</a><button id="memedit">조직원 편집</button>
						<button id="memadd" onclick="location.href='/Puzzle/PersonnelView/P_Card_in.puzzle'">조직원 추가</a></button>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
						<!-- Modal content-->
						<div class="modal-content">
				      
						<div class="modal-body">
							<div id="search">
							<form:form name="searchform" method="post" action="/Puzzle/department/searchList.puzzle">
							조직원 이름 : <input type="text" size="20" id="search" name="search" placeholder="사원명으로 검색"/><input type="submit" value="검색" /><br/>
							조직원 직급 : <input type="text" size="20" id="search" placeholder="직급명으로 검색"/><input type="submit" value="검색"/>
							</form:form>
							</div>
				<!--           <input type="button" value="클릭" onclick="modal()" data-dismiss="modal"/> -->
						</div>
				        
				        <div class="modal-footer">
				        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      	</div>
				    </div>
				    </div>
				    
					<div class="panel-body" id="tabmenu">
						<ul id="memberStatusTab" class="nav nav-pills padding-left-15">
							<li><a href="#" data-toggle="tab" data-id="1" class="statusBtn">전체</a></li>
								<c:forEach var="memberStatusTab" items="${memberStatusTab}">
									<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
								</c:forEach>
							<li><a href="#" data-toggle="tab" data-id="2" class="">재직</a></li>
								<c:forEach var="memberStatusTab" items="${memberStatusTab}">
									<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
								</c:forEach>
							<li><a href="#" data-toggle="tab" data-id="2" class="">휴직</a></li>
								<c:forEach var="memberStatusTab" items="${memberStatusTab}">
									<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
								</c:forEach>
							<li><a href="#" data-toggle="tab" data-id="2" class="">퇴직</a></li>
								<c:forEach var="memberStatusTab" items="${memberStatusTab}">
									<li><a>${memberStatusTab.value }[${memberStatusTab.num}]</a></li>
								</c:forEach>
						</ul>
						
						<!-- 시작하자마자 전체조직원 정보 표시 -->						
						<div id="info">
						<div id="info2">
						<div  id="memAll"> 
						<c:if test="${mem != null}">
							<c:forEach var="list" items="${mem}">
							<div class="col-sm-6">
							<div class="panel-body detailMemberBtn" style="cursor:pointer; margin-top:0px;">
							<div class="panel-img">
							<div class="default-img" style="background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);">
							<span>${list.name }</span>
							</div>
							</div>
							<div class="panel-content">
							<div class="member_isAdmin">
							<span class="label label-orange">${list.authority}</span>
							</div>
							<div class="infinite_name panel-workflow">${list.name}</div>
							<div class="infinite_name panel-workflow">${list.email}</div>
							<div class="infinite_name panel-workflow">${list.positiontype}</div>
							<div class="infinite_name panel-workflow">${list.dept_Type}</div>								
							</div>
							</div>	
							</div>							
							</c:forEach>
						</c:if>
					</div>
					</div>
					
					<!-- paging -->
					<div class="panel-body">
					<div class="paging">
						<div id="paging">
						<c:if test="${startPage1>5}">
							<ul class="pager">
								<li><a href="departmentList.puzzle?pageNum=${startPage1-1}">Previous</a></li>
							</ul>
						</c:if>
						<ul class="pagination">
							<c:forEach var="i" begin="${startPage1}" end="${endPage1}">
								<li id="${i}"><a href="departmentList.puzzle?pageNum=${i}">${i}</a></li>
							</c:forEach>
						</ul>
						<c:if test="${pageCount1>endPage1}">
						<ul class="pager">
							<li><a href="departmentList.puzzle?pageNum=${startPage1+5}">Next</a></li>
						</ul>
						</c:if>
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
