<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src=”http://code.jquery.com/jquery-2.2.4.js”></script>

<link href="/Puzzle/themes/fullcalendar.css" rel="stylesheet"/>
<link href="/Puzzle/themes/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="/Puzzle/themes/moment.min.js"></script>
<script type="text/javascript" src="/Puzzle/themes/jquery.min.js"></script>
<script type="text/javascript" src="/Puzzle/themes/fullcalendar.js" charset="euc-kr"></script>
<script type="text/javascript" src="/Puzzle/themes/ko.js"></script>

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

<script type='text/javascript'>
	$(function() {
		
		var schedule = "";
		
		$.ajax({
			type:"post"		// 포스트방식
			,url: "/Puzzle/calendar/getSchedules.puzzle"	// url 주소	
			,dataType:"json"
			,success:function(args){	
				setSchedule(args.list);
			}
		    ,error:function(e) {	
		    	Console.log(e.responseText);
		    }
		});
		
	});
	
	function setSchedule(list){
// 		alert("setSchedule()");
		var modal = document.getElementById('myModal');
		var modal2 = document.getElementById('myModal2');
        var span = document.getElementsByClassName("close")[0];
        var span2 = document.getElementsByClassName("close")[1];
        var add = document.getElementById('add');
        
// 		var jsonList = JSON.stringify(list);
		$('#calendar').fullCalendar({
			fixedWeekCount: false,
			dayClick: function(date, jsEvent, view) {
// 		        alert(date.format());
				$("#start").val(date.format());
		        modal.style.display = "block";
		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        }
	        
		        //추가
		        add.onclick = function() {
		        	modal.style.display = "none";
		        }
	        
		    },
		    eventClick: function(calEvent, jsEvent, view){
		    	modal2.style.display = "block";
		    	span2.onclick = function() {
		            modal2.style.display = "none";
		        }
		        window.onclick = function(event) {
		            if (event.target == modal2) {
		                modal2.style.display = "none";
		            }
		        }
		        $("#"+calEvent.type).attr("checked","checked");
		        $("#title").html(calEvent.title);
		        $("#no").val(calEvent.no);
		        $("#_start").val(calEvent.start.format());
		        $("#_end").val(calEvent.end.format());
		        $("#_content").html(calEvent.title);
		    },
			events : eval(list)
			
		});
		
	}
	function del(){
		var no = $("#no").val();
		location.href="deleteSchedule.puzzle?no="+no;
	}
</script>
<style>
	div {
		width:auto;
	}
	
	/* The Modal (background) */
	.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 200px;
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}

	/* Modal Header */
	.modal-header {
	    padding: 10px 16px;
	    background-color: white;
	}
	
	/* Modal Body */
	.modal-body {padding: 2px 16px;}
	
	/* Modal Footer */
	.modal-footer {
	    padding: 10px 16px;
	    background-color: white;
	}
	
	/* Modal Content */
	.modal-content {
	    position: relative;
	    background-color: white;
	    margin: auto;
	    padding: 0;
 	    border: 1px solid #888; 
	    width: 600px;
 	    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19); 
	    -webkit-animation-name: animatetop;
	    -webkit-animation-duration: 0.4s;
	    animation-name: animatetop;
	    animation-duration: 0.4s;
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	    from {top: -300px; opacity: 0} 
	    to {top: 0; opacity: 1}
	}
	
	@keyframes animatetop {
	    from {top: -300px; opacity: 0}
	    to {top: 0; opacity: 1}
	}
	
	/* The Close Button */
	.close {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: black;
	    text-decoration: none;
	    cursor: pointer;
	}
	
</style>
</head>
<body style="background-color:white;">
	<div id='calendar' style='width: 60%; margin: 3em 0; font-size: 13px'></div>
	
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
			    <span class="close">×</span>
			    <h3>일정추가</h3>
		  	</div>
			<form:form commandName="calendarCommand" action="insertSchedule.puzzle">
			<div class="modal-body">
				<table>
					<tr><td>일정 종류: </td>
						<td>
							<label class="radio-inline"><form:radiobutton path="type" value="p"/>개인</label>
							<label class="radio-inline"><form:radiobutton path="type" value="s"/>공유</label>
						</td>
					</tr>
					<tr><td>일정 시작일: </td><td><input type="date" class="form-control" name="startDate" id="start"/></td></tr>
					<tr><td>일정 종료일: </td><td><input type="date" class="form-control" name="endDate"/></td></tr>
					<tr><td>일정 내용: </td><td><form:textarea class="form-control" path="content"/></td></tr>
				</table>
			</div>
			<div class="modal-footer">
			    <input id="add" type="submit" class="btn btn-default" value="추가"/>
			</div>
			</form:form>
		</div>
	</div>
	
	<div id="myModal2" class="modal">
		<div class="modal-content">
			<form:form commandName="calendarCommand" action="modifySchedule.puzzle">
			<div class="modal-header">
			    <span class="close">×</span>
			    <h3 id="title"></h3>
			    <form:input type="hidden" id="no" path="no"/>
			</div>	
			<div class="modal-body">
				<table>
					<tr><td>일정 종류: </td>
						<td>
							<label class="radio-inline"><form:radiobutton path="type" value="p" id="p"/>개인</label>
							<label class="radio-inline"><form:radiobutton path="type" value="s" id="s"/>공유</label>
						</td>
					</tr>
					<tr><td>일정 시작일: </td><td><input type="date" class="form-control" name="startDate" id="_start"/></td></tr>
					<tr><td>일정 종료일: </td><td><input type="date" class="form-control" name="endDate" id="_end"/></td></tr>
					<tr><td>일정 내용: </td><td><form:textarea class="form-control" path="content" id="_content"/></td></tr>
				</table>
			</div>
			<div class="modal-footer">
			    <input id="modify" type="submit" class="btn btn-default" value="수정"/>
			    <input id="delete" type="button" class="btn btn-default" value="삭제" onclick="del()"/>
			</div>
			</form:form>
		</div>
	</div>

</body>
</html>