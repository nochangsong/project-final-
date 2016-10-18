<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src=”http://code.jquery.com/jquery-2.2.4.js”></script>
<title>Puzzle</title>
<script>

	function Check() {
		if (document.addPS.Name.value == "") {
			alert("이름을 입력하세요");
			document.addPS.Name.focus();
			return false;
		}
		if (document.addPS.Age.value == "") {
			alert("나이를 입력하세요");
			document.addPS.Age.focus();
			return false;
		}
		if (document.addPS.Email.value == "") {
			alert("Email를 입력하세요");
			document.addPS.Email.focus();
			return false;
		}
		if (document.addPS.PhoneNum.value == "") {
			alert("폰번호를 입력하세요");
			document.addPS.PhoneNum.focus();
			return false;
		}
		if (document.addPS.HireDate.value == "") {
			alert("입사일을 입력하세요");
			document.addPS.HireDate.focus();
			return false;
		}
		if (document.addPS.Position_Name.value == "") {
			alert("직급을 선택하세요");
			document.addPS.Position_Name.focus();
			return false;
		}
		if (document.addPS.Work_Name.value == "") {
			alert("근무상태를 선택하세요");
			document.addPS.Work_Name.focus();
			return false;
		}
		if (document.addPS.right.value == "") {
			alert("권한을 선택하세요");
			document.addPS.right.focus();
			return false;
		}
		if (document.addPS.Dept_Num.value == "") {
			alert("부서를 선택하세요");
			document.addPS.Dept_Num.focus();
			return false;
		}
	}
</script>

</head>
<body>
	<div align="center">
		<div>
			<h4>조직원</h4>
		</div>
		<form:form commandName="command" method="post" name="addPS">
			<table border="1" width="350">
				<p>
					<label>※ 필수 항목 미 등록시 저장되지 않습니다.</label>
				</p>
				<tr>
				 	<th>E-mail:</th>
					<td><input type="text" name="Email" id="Email" placeholder="! 필수 항목 입니다."/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="Name" id="Name" placeholder="! 필수 항목 입니다."/></td>
				</tr>
				<tr>
					<th>나이:</th>
					<td><input type="text" name="Age" id="Age" placeholder="! 필수 항목 입니다."/></td>
				</tr>
				<tr>
					<th>입사일:</th>
					<td><input type="date" name="HireDate" id="HireDate"
						placeholder="! 필수 항목 입니다. (날짜를 선택)" /></td>
				</tr>
				 <tr>
					<th>퇴사일:</th>
					<td><input type="date" name="RetireDate" id="RetireDate"/></td>
				</tr>
				<tr>
					<th>핸드폰:</th>
					<td><input type="text" name="PhoneNum" id="PhoneNum" 
						placeholder="! 필수 항목 입니다. - 없이 입력하세요" maxlength="11" /></td>
				</tr>
				 <tr>
					<th>퇴사사유:</th>
					<td><input type="text" name="RetireType" id="RetireType"/></td>
				</tr>
				<tr>
					<th>부서:</th>
					<td><select name="Dept_Num" id="Dept_Num">
							<option value="">팀선택</option>
							<option value="1">인사팀</option>
							<option value="2">개발팀</option>
							<option value="3">영업팀</option>
					</select></td>
				</tr> 
				<tr>
					<th>직급/직책:</th>
					<td><select name="Position_Num" id="Position_Num">
							<option>직급선택</option>
							<option value="1">CEO</option>
							<option value="2">팀장</option>
							<option value="3">차장</option>
							<option value="4">과장</option>
							<option value="5">대리</option>
							<option value="6">사원</option>
							<option value="7">인턴</option>
					</select></td>
				</tr>
				<tr>
					<th>상태:</th>
					<td><select name="Work_Num" id="Work_Num">
							<option value="1">재직</option>
							<option value="2">휴직</option>
							<option value="3">휴가</option>
							<option value="4">퇴사</option>
					</select></td>
				</tr>
				<tr>
					<th>권한:</th>
					<td><select name="authority" id="authority">
							<option value="1">관리자</option>
							<option value="2">일반사용자</option>
					</select></td>
				</tr>
			</table>
				<input type="hidden" name="RANDOMCODE" id="RANDOMCODE">
				<input type="hidden" value="N" name="certify" id="certify">
			<br>
			<div align="center">
					<input class="CheckButton" type="submit" value="저장"/>
					<input type="button" value="취소"/>
			</div>
		</form:form>
	</div>
</body>
</html>