<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script type="text/javascript">

	function delete(){
		window.open("", "", "width=600,height=150,menubar=no,status=no,toolbar=no");
	}

</script> -->

</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	  <div align="center">
      <form:form commandName="command">
      <table border = "1" width="600" height="150">
      	<tr>
      		<th>휴가 유형</th>
      		<td>
      			<select name="work_Type" id="work_Type">
      				<option value="정기휴가">정기휴가</option>
      				<option value="월차휴가">월차휴가</option>
      				<option value="연차휴가">연차휴가</option>
      				<option value="병가">병      가</option>      		
      			</select>
      		</td>
      	</tr>
      	<tr>
      		<th>기 간</th>
      		<th>시작 일자 </th>
      		<td>
      			<input type="date" name="startTime" id="startTime"> 
      		</td>
      		<th>종료 일자</th>
      		<td>
      		 <input type="date" name="endTime" id="endTime">
      		</td>
      	<td>
      	<input type="hidden" name="Email" id="Email">
      	</td>
      	</tr>
       </table>
      <br>
      <div>
      <p align="center">
      <input type="submit" class="btn btn-default" value="신청"/>
      <input type="reset" class="btn btn-default" value="다시입력"/>
      <input type="button" class="btn btn-default" value="신청취소" onClick="window.open('vacationDelete.puzzle', '_blank', 'width=850, height=550');">
      </p>
      <!-- onclick="delete()" -->
      </div>
      </form:form>
      </div>
</body>
</html>