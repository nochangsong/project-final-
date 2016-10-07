<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src=”http://code.jquery.com/jquery-2.2.4.js”></script>
</head>
<style>
	#add {
		align: right;
	}
</style>
<script>
	$(function(){
		position_num = "";
		
		$(".sel").click(function(){
			position_num = $(this).attr("id");
		});
	});
	
	function del(){
		if(position_num==""){
			alert("직급/직책을 선택해주세요.");			
			return false;
		}
		location.href="delete.puzzle?num="+position_num;
	}
	
	function edit(){
		if(position_num==""){
			alert("직급/직책을 선택해주세요.");			
			return false;
		}
		$("#"+position_num).removeAttr("readonly").focus().after("<input type='button' class='btn btn-default temp' value='수정' "
			+ "onclick='editOk()'/> "
			+ "<input type='button' class='btn btn-default temp' value='취소' onclick='can()'/>");
	}
	
	function editOk(){
		var positionType = $("#"+position_num).val();
		location.href="update.puzzle?num="+position_num+"&type="+positionType;
	}
	
	function can(){
		location.href="positionList.puzzle";
	}

</script>
<body>
<h3>직급/직책관리</h3>
<h5>조직의 직급/직책을 관리 할 수 있습니다.</h5>
<br>
<div class="panel-group">
	<div class="panel panel-default">
		<div class="panel-heading">
			<input type="button" class="btn btn-default" onclick="return del();" value="삭제"/>
	    	<input type="button" class="btn btn-default" onclick="return edit();" value="수정"/>
	    	<br><br><br>
			<form:form commandName="positionCommand">
				<form:input class="form-control" placeholder="직급/직책" path="positionType"/>
    			<input type="submit" title="추가하기" class="btn btn-default" value="+"/>
    		</form:form>
    	</div>
    	<div class="list">
    		<c:if test="${fn:length(positionList)==0}">
	    		<div class="panel-body">직급/직책을 추가해주세요.</div>
	    	</c:if>
	    	<c:if test="${fn:length(positionList)!=0}">
	    		<c:forEach var="position" items="${positionList}">
	    			<div class="panel-body"><input id="${position.position_num}" class="form-control sel" 
	    				value="${position.positionType}" readonly/></div>
	    		</c:forEach>
	    	</c:if>
    	</div>
    </div>
</div>
</body>
</html>