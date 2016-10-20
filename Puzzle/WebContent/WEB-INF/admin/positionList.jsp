<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<script src=”http://code.jquery.com/jquery-2.2.4.js”></script>
</head>
<style>
	#add {
		align: right;
	}
</style>
<script>

	var selected_position;
	
	function sel(position_num){
		selected_position = position_num;
	}
	
	function add(){
		var positionType = $("#newPositionType").val();
// 		alert(positionType);
		if(positionType==''){
			alert("직급/직책을 입력해주세요.");
			return false;
		}
		getList("insert", "", positionType);
		$("#newPositionType").val("");
	}
	
	function del(){
		if(selected_position==null){
			alert("직급/직책을 선택해주세요.");			
			return false;
		}
		getList("delete", selected_position);
	}
	
	function editCheck(){
		if(selected_position==null){
			alert("직급/직책을 선택해주세요.");			
			return false;
		}
		$("#"+selected_position).removeAttr("readonly").focus().after("<input type='button' class='btn btn-default temp' value='수정' "
			+ "onclick='edit()'/> "
			+ "<input type='button' class='btn btn-default temp' value='취소' onclick='cancel()'/>");
	}
	
	function edit(){
		var positionType = $("#"+selected_position).val();
		getList("update", selected_position, positionType);
	}
	
	function cancel(){
		getList();
	}
	
	function getList(type, position_num, positionType){
		var url = "/Puzzle/admin/position/positionList.puzzle";
		$.ajax({
			type:"post"		// 포스트방식
			,data: {
				type: type,
				position_num: position_num,
				positionType: positionType
			}
			,url: url	// url 주소	
			,dataType:"json"
			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			,success:function(args){	
				$(".list").html("");
				if(args.list.length==0){
					$(".list").append("<div class='panel-body'>직급/직책을 추가해주세요.</div>");
				} else {
					for(var idx=0; idx<args.list.length; idx++){
						var positionType = args.list[idx].positionType;
						var position_num = args.list[idx].position_num;
						$(".list").append(
							"<div class='panel-body'><input id='"+position_num+"' class='form-control' " +
							"value='"+positionType+"' onclick='sel("+position_num+")' readonly/></div>");
					}
				}
			}
		    ,error:function(e) {	
		    	Console.log(e.responseText);
		    }
		});
	}

</script>
<body onload="getList()">
<div class="title">
	<h3>직급/직책관리</h3>
	<h5>조직의 직급/직책을 관리 할 수 있습니다.</h5>
</div>
<div class="panel-group" style="width: 1100px;height: auto;margin: 15px 25px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<input type="button" class="btn btn-default" onclick="return del();" value="삭제"/>
	    	<input type="button" class="btn btn-default" onclick="return editCheck();" value="수정"/>
	    	<br><br><br>
			<input id="newPositionType" type="text" class="form-control" placeholder="직급/직책"/>
			<input type="button" class="btn btn-default" value="+" title="추가하기" onclick="return add()"/>
    	</div>
    	<div class="list"></div>
    </div>
</div>
</body>
</html>