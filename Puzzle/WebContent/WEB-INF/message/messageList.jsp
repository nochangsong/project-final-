<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false" %>
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

<!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script> -->

<!-- Magnific Popup core CSS file -->
<link rel="stylesheet" href="/Puzzle/themes/magnific-popup.css">

<!-- jQuery 1.7.2+ or Zepto.js 1.0+ -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- Magnific Popup core JS file -->
<script src="/Puzzle/themes/jquery.magnific-popup.js"></script>
<script>
	$(function(){
		$('.open-popup-link').magnificPopup({
			type:'inline',
			midClick: true,
			callbacks: {
				close: function(){
					location.href="messageList.puzzle"
				}
			}
		});
	});
	
	function showMessage(no){
// 		alert(no);
		var url = "/Puzzle/message/showMessage.puzzle";
		$.ajax({
			type:"post"		// 포스트방식
			,data: {
				no: no
			}
			,url: url	// url 주소	
			,dataType:"json"
			,success:function(args){	
				$("#sender").html(args.sender);
				$("#content").html(args.content);
			}
		    ,error:function(e) {	
		    	Console.log(e.responseText);
		    }
		});
	}
	
	function deleteMessage(){
		var checkList = $(":checked");
		if(checkList.length<1){
			alert("삭제할 쪽지를 선택해주세요.");
			return false;
		}
		alert(checkList.length);
	}
</script>
<style>
	.white-popup {
		position: relative;
		background: #FFF;
		padding: 20px;
		width: auto;
		max-width: 500px;
		margin: 20px auto;
	}
	#content{
		height: 50px;
	}
</style>
</head>
<body>
<h2>쪽지함</h2>
<br>
<div class="container">
<form:form>
<table class="table">
	<tr>
		<th>선택</th>
		<th>보낸사람</th>
		<th>내용</th>
		<th>날짜</th>
	</tr>
	<c:if test="${msg==null}">
		<tr>
			<td colspan="2">쪽지가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${msg!=null}">
		<c:forEach var="msg" items="${msg}">
		<tr>
			<td><input type="checkbox" name="msg_no" value="${msg.no}"/></td>
			<c:if test="${msg.checked=='new'}">
				<td><b>${msg.sender}</b></td>
				<td><a href="#messageBox" class="open-popup-link" onclick="showMessage('${msg.no}')"><b>${msg.content}</b></a></td>
				<td><b>${msg.reg_date}</b></td>
			</c:if>
			<c:if test="${msg.checked=='read'}">
				<td>${msg.sender}</td>
				<td><a href="#messageBox" class="open-popup-link" onclick="showMessage('${msg.no}')">${msg.content}</a></td>
				<td>${msg.reg_date}</td>
			</c:if>
		</tr>
		</c:forEach>
	</c:if>
</table>
</form:form>
</div>
<div>
	<button type="button" class="btn btn-default" onclick="location.href='messageForm.puzzle'">쪽지보내기</button>
	<button type="button" class="btn btn-default" onclick="return deleteMessage()">삭제</button><br>
	<div id="messageBox" class="white-popup mfp-hide">
		<div class="form-group">
			<label>보낸 사람: </label>
			<span id="sender"></span>
		</div>
		<div class="form-group">
			<label>내용: </label><br>
			<span id="content"></span>
		</div>
	</div>
</div>
</body>
</html>