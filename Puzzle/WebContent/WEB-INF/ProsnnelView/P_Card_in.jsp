<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<title>Puzzle</title>
<script type="text/javascript">
function check(){
	if(document.addPs.Name == ""){
		alert("이름을 입력해주세요");
		document.addPs.Name.focus();
		return;
	}
	if(document.addPs.email == ""){
		alert("E-mail을 입력해주세요");
		document.addPs.email.focus();
		return;
	}
	
	doucment.addPs.submit();
}


</script>
</head>
<body>
<div align="center">
	<div><h4>조직원</h4></div>
	<form name="addPS">
	<table border="1">
	<tr>
	<th>이름:</th>
	<td><input type="text" name="Name"></td>
	</tr>
	<tr>
	<th>나이:</th>
	<td><input type="text" name="Age"></td>
	</tr>
	<tr>
	<th>E-mail:</th>
	<td><input type="text" name="email"></td>
	</tr>
	<tr>
	<th>핸드폰:</th>
	<td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<th>입사일:</th>
	<td><input type="text" name="HireDate"></td>
	</tr>
	<tr>
	<th>퇴사일:</th>
	<td><input type="text" name="RetireDate"></td>
	</tr>
	<tr>
	<th>직급/직책:</th>
	<td><select name="PS_N">
	<option value="">직급/직책 선택</option>
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
	<td><select name="Work_Type">
	<option value="1">재직</option>
	<option value="2">휴직</option>
	<option value="3">휴가</option>
	<option value="4">퇴사</option>
	</select></td>
	</tr>
	<tr>
	<th>권한:</th>
	<td><select name="">
	<option value="1">관리자</option>
	<option value="2">일반사용자</option>
	</select></td>
	</tr>
	<tr>
	<th>부서:</th>
	<td><select name="Dept_Type">
	<option value="1">인사팀</option>
	<option value="2">개발팀</option>
	<option value="3">영업팀</option>
	</select></td>
	</tr>
	</table>	
	<div>
	<button type="button" onclick="return Check();">전송</button>
	</div>
	</form>
	</div>
</body>
</html>