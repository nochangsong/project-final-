<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
		$(".paging .pagination li#"+${pageNum}).addClass("active");
		
		$('.open-popup-link').magnificPopup({
			type:'inline',
			midClick: true,
			callbacks: {
				close: function(){
					location.href="messageList.puzzle?pageNum="+${pageNum};
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
// 				$("#messagebox").append(
// 						"<div class='form-group'><label>보낸 사람: </label>"+args.sender+"</div>" +
// 						"<div class='form-group'><label>내용: </label><br>"+args.content+"</div>" +
// 						"<div><input type='button' value='답장하기' class='btn btn-default' " +
// 						"onclick='reply('')'</div>");
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
	}
	
	function reply(){
		var sender = $("span#sender").html();
// 		alert(sender);
		location.href="messageForm.puzzle?sender="+sender;
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
<button type="button" class="btn btn-default" onclick="location.href='messageForm.puzzle'">쪽지보내기</button>
<input type="submit" class="btn btn-default" onclick="return deleteMessage()" value="삭제"/>
<table class="table">
	<tr>
		<th>선택</th>
		<th>보낸사람</th>
		<th>내용</th>
		<th>날짜</th>
	</tr>
	<c:if test="${fn:length(msg)==0}">
		<tr>
			<td colspan="2">쪽지가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${fn:length(msg)!=0}">
		<c:forEach var="msg" items="${msg}">
		<tr>
<%-- 			<form:checkbox path="checkList" value="${msg.no}"/> --%>
			<td><input type="checkbox" name="checkList" value="${msg.no}"></td>
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
<div class="paging">
	<c:if test="${startPage>5}">
		<ul class="pager">
			<li><a href="messageList.puzzle?pageNum=${startPage-1}">Previous</a></li>
		</ul>
	</c:if>
	<ul class="pagination">
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li id="${i}"><a href="messageList.puzzle?pageNum=${i}">${i}</a></li>
		</c:forEach>
<!-- 		<li class="active"><a href="#">2</a></li> -->
	</ul>
	
	<c:if test="${pageCount>endPage}">
	<ul class="pager">
		<li><a href="messageList.puzzle?pageNum=${startPage+5}">Next</a></li>
	</ul>
	</c:if>
</div>
<div>
	<div id="messageBox" class="white-popup mfp-hide">
		<div class="form-group">
			<label>보낸 사람: </label>
			<span id="sender"></span>
		</div>
		<div class="form-group">
			<label>내용: </label><br>
			<span id="content"></span>
		</div>
		<div><input type="button" class="btn btn-default" value="답장하기" onclick="reply()"/></div>
	</div>
</div>
</body>
</html>