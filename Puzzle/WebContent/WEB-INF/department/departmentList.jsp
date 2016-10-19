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
						
						$("#d_type").html(dept_Type);
						
						
						$("#info2").append(
								"<div class='memAll'>"+
								"<div class='col-sm-6'>"+
								"<div class='panel-body detailMemberBtn' style='cursor:pointer; margin-top:0px;'>"+
								"<div class='panel-img'>"+
								"<div class='default-img' style='background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);' onclick='chk("+idx+");'>"+
								"<label for='"+idx+"'><span id='"+idx+"'>"+name+"</span><input type='radio' value='"+idx+"' name='check_email'/></label>"+
								"</div>"+
								"</div>"+
								"<div class='panel-content'>"+
								"<div class='member_isAdmin'>"+
								"<span class='label label-orange'>"+authority+"</span>"+
								"</div>"+
								"<div class='infinite_name panel-workflow'>"+name+"</div>"+
								"<div class='"+idx+"'>"+email+"</div>"+
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
		var dept_Type = $("#newdeptType").val();
// 		alert(dept_Type);
		if(dept_Type==''){
			alert("부서명을 입력해주세요.");
			return false;
		}
		$.ajax({
			type:"post"		// 포스트방식
			,data: {
				dept_Type: dept_Type
			}
			,url: "/Puzzle/department/checkType.puzzle"	// url 주소	
			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			,dataType: "json"
			,success:function(args){
				var check = decodeURIComponent(args.check);
				if(check==0){
					getList("insert", "", dept_Type);
				}else{
					alert("이미 존재하는 부서입니다.");
				}
			}
		})

		$("#newdeptType").val("");
	}
	
	function del(){
		if(selected_deptType==null){
			alert("부서를 선택해주세요.");			
			return false;
		}
		
		getList("delete", selected_deptType);
		
		
	}

	function edit(){
		var dept_Type = $("#"+selected_deptType).val();
		getList("update", selected_deptType, dept_Type);
	}

	function cancel(){
		getList();
	}
	
	function edit_cancle(){
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
				
				if(args.msg!=null){
					var msg = args.msg;
					alert(msg);
				}
				
			}
		    ,error:function(e) {	
		    	Console.log(e.responseText);
		    }
		});
	}

	function search(){
		var search = $("input#search").val();
		$.ajax({
			type:"post"		// 포스트방식
			,data: {
				search: search
			}
			,url: "/Puzzle/department/departmemList.puzzle"	// url 주소	
			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			,dataType: "json"
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
								"<div class='default-img' style='background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);' onclick='chk("+idx+");'>"+
								"<label for='"+idx+"'><span id='"+idx+"'>"+name+"</span><input type='radio' value='"+idx+"' id='check_email' name='check_email'/></label>"+
								"</div>"+
								"</div>"+
								"<div class='panel-content'>"+
								"<div class='member_isAdmin'>"+
								"<span class='label label-orange'>"+authority+"</span>"+
								"</div>"+
								"<div class='infinite_name panel-workflow'>"+name+"</div>"+
								"<div class='"+idx+"'>"+email+"</div>"+
								"<div class='infinite_name panel-workflow'>"+dept_Type+"</div>"+
								"</div>"+
								"</div>"+
								"</div>"+
								"</div>");	
						
					}
					
				$("input#search").val("");
				
			}
		})
		
	}
	
	function chk(abc){
		var a = abc; 
		$(":radio[value='"+a+"']").prop( "checked", true );
	
		var chkemail = $("."+a).html();
		alert(chkemail);
		sessionStorage.setItem('chkemail',chkemail);
		var a = sessionStorage.getItem('chkemail');
		alert(a);
		
		//$.session.set("email", email);
	}
	
	function memedit(){
		var email = sessionStorage.getItem('chkemail');
		alert(email);
		if(email==''){
			alert("편집할 조직원을 선택하세요.");
		}
		
		var link = "/Puzzle/PersonnelView/P_Modify.puzzle?chkemail"+email;
		location.replace(link);
		
	}
	
	
	$(function(){	

		(".paging .pagination li#"+${pageNum1}).addClass("active");


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
					<c:if test="${sessionScope.authority=='1'}">
					<input type="button" id="insert" class="btn btn-default" value="+" title="추가하기" onclick="return add();">
					<input type="button" class="btn btn-default" onclick="return editCheck();" value="수정">
					<input type="button" class="btn btn-default" onclick="return del();" value="삭제">
					</c:if>
				</div>
				<div class="panel">
					<input type="button" class="btn btn-default" id="searchButton" value="puzzle">
				</div>
				<c:if test="${sessionScope.authority=='1'}">
				<div class="panel-body">
					<input type="text" id="newdeptType" class="form-control" placeholder="부서추가">
				</div>
				</c:if>
				<div class="deptlist">
				</div>
				</div>
			</div>
		</div>
		
		<div class="col-sm-8">
 			<div class="panel-grop">
				<div class="panel panel-default">
					<div class="panel-heading">조직원
						<input id="search" name="search" size="25" placeholder="사원명을 입력해주세요."/>
						<input type="button" value="검색" onclick="search()"/>
					</div>
					<c:if test="${sessionScope.authority=='1'}">
					<div class="panel-body">
						<div class="bodyOne">
						<a href="#">*혹시 동료가 Gmail 이용자가 아니신가요?</a><button id="memedit" onclick="return memedit();">조직원 편집</button>
						<button id="memadd" onclick="location.href='/Puzzle/PersonnelView/P_Card_in.puzzle'">조직원 추가</button>
						</div>
					</div>
					</c:if>

					<div class="panel-body" id="tabmenu">
						<ul id="memberStatusTab" class="nav nav-pills padding-left-15">
							<li><a href="/Puzzle/department/departmentList.puzzle" id="all" >전체</a></li>
							<li><a href="#" id="d_type"></a></li>
						</ul>
						
						<!-- 시작하자마자 전체조직원 정보 표시 -->						
						<div id="info">
						<div id="info2">
						<div  id="memAll"> 
						<c:if test="${mem != null}">
							<c:forEach var="list" items="${mem}" varStatus="abc">
							<div class="col-sm-6">
							<table class="table table-bordered">
							<thead>
							<div class="default-img" style="background-color: rgb(170, 235, 170); color: rgb(255, 255, 255);"  onclick="chk(${abc.count});">
							<label for="${list }"><input type="radio" value="${abc.count }" name="check_email"/></label>
							</div>
							</thead>
							<tbody>
							<tr>
							<td>
							<span class="authority">${list.authority}</span>
							</td>
							</tr>
							<tr>
							<td>
							<div class="name">${list.name}</div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="${abc.count }">${list.email}</div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="positiontype">${list.positiontype}</div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="dept_type">${list.dept_Type}</div>								
							</td>
							</tr>
							</tbody>
							</table>
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
