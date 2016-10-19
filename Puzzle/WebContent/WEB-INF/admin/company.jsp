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
<style>
	.border{
		border: solid 1px #BDBDBD;
		padding: 30px;
	}
</style>
<script>
	function submit(){
		document.form.submit();
	}
</script>
</head>
<body>
<div>
<h3>조직관리</h3>
<h5>조직에 대한 정보를 관리할 수 있습니다.</h5>
</div>
<div class="border">
	<form name="form" action="setLogo.puzzle" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="comName">조직명</label>
		<input type="text" class="form-control" id="com_name" name="com_name" value="${company.com_name}">
	</div>
	<div class="form-group">
		    <input name="no" id="no" type="hidden" value="${company.no}"/>
		    <label for="exampleInputFile">조직로고</label>
		    <input type="text" name="com_logo_subject" value="${company.com_logo_subject}" class="form-control"/>
		    <input type="file" id="com_logo" name="com_logo"/>
		    <input type="button" onclick="submit()" value="저장"/>
	</div>
	</form>
	<div id="image">
<!-- 		<img alt="조직로고" src="/Puzzle/admin/company/getLogo.puzzle" width="250px"/> -->
	</div>
</div>
</body>
</html>