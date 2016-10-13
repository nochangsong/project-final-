<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>글쓰기 페이지</title>
<link rel="stylesheet" href="../css/board.css" type="text/css">
<script>
    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.SUBJECT.value) {
            alert("제목을 입력하세요");
            return false;
        }
        if(!userinput.B_CONTENT.value) {
            alert("내용을 입력하세요");
            return false;
        }
        
        return true;
    }
</script>
</head>
<body>
	<form method="post" action="write.puzzle" name="userinput" onSubmit="return checkIt()">
	<h3 align="center">글수정</h3>
		<table id="writeForm" width="550" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td width="80" align="center">제목</td>
				<td><input type="text" name="SUBJECT" size="80" maxlength="100" value="${board.SUBJECT}"></td>
			</tr>
			<tr>
				<td width="80" align="center">작성자</td>
				<td><input type="text" name="WRITER" size="20" maxlength="50" value="${board.WRITER}" readonly="true"></td>
			</tr>
			<tr>
				<td width="80" align="center">공개여부</td>
				<td>
				<select name="WRITE_TYPE">
						<option value="공개">공개</option>
						<option value="비공개">비공개</option>
				</select>
				<font size="1" color="red">
      				<b>비공개시 같은 부서 사람들만 볼 수 있습니다.</b>
       			</font>
				</td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
			<td colspan="2">
			<textarea rows="20" cols="80" name="B_CONTENT"
					style="margin: 0px; width: 550px; height: 300px;" value="${B_CONTENT}"></textarea>
			</td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" value="확인">
			<input type="button" value="취소" onclick="location.href='boardList.puzzle'">
		</div>
	</form>
</body>
</html>