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
		width: 1100px;
		height: auto;
		margin: 15px 25px;
	}
	.border label{
		font-size: 18px;
		margin-bottom: 15px;
		display: block;
	}
	.border input{
		margin-bottom: 30px;
	}
 	.file_input_div { 
 	    position: relative; 
	    overflow: hidden; 
 	    margin: 10px; 
 	} 
 	#com_logo_subject{
 		width: 990px;
 		display: inline;
 	}
 	span#logoSel{
 	    padding: 10px; 
		border: solid 1px #BDBDBD;
 	}
 	.btndiv{
 		margin-top: 70px;
 		text-align: right;
 		height:30px;
 	}
 	#btn{
 		padding: 10px 30px;
 	}


</style>
<script>

	function submit(){
		document.form.submit();
	}

	function selectImage(){
		var fileValue = $("#com_logo").val();
		var fileName = fileValue.substring(fileValue.lastIndexOf("\\")+1); // 파일명
		var fileKind = fileName.split(".")[1]; //확장자
		if(fileKind != "jpg" && fileKind != "gif" && fileKind != "png"){
			alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
			$("#com_logo").val("");
			$("#com_logo").select();
		    document.selection.clear();
		    $("#com_logo_subject").val("");
		} else {
			$("#check").val("change");
			$("#com_logo_subject").val(fileName);
		}
	}
	
		
</script>
</head>
<body>
<div class="title">
	<h3>조직관리</h3>
	<h5>조직에 대한 정보를 관리할 수 있습니다.</h5>
</div>
<div class="border">
	<form name="form" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="comName">조직명</label>
		<input type="text" class="form-control" id="com_name" name="com_name" value="${company.com_name}">
		
		<label for="comName">대표계정</label>
		<input type="text" class="form-control" id="com_ceo" name="com_ceo" value="${company.com_ceo}">
	</div>
	<div class="form-group">
		    <input name="no" id="no" type="hidden" value="${company.no}"/>
		    <input name="check" id="check" type="hidden"/>
		    <label for="exampleInputFile">조직로고</label>
		    <input type="text" id="com_logo_subject" name="com_logo_subject" value="${company.com_logo_subject}" 
		    	class="form-control" placeholder="이미지를 선택해주세요." readonly/>
		    <span id="logoSel" class="glyphicon glyphicon-open" onclick="javascript: document.getElementById('com_logo').click();"></span>
		    <input type="file" id="com_logo" name="com_logo" onchange="selectImage()" class="fileUpload" style="display:none;"/>
	</div>
	<div id="image" style="text-align: center;">
<!-- 		<img alt="조직로고" src="/Puzzle/admin/company/getLogo.puzzle" width="250px"/> -->
	</div>
	<div class="btndiv">
		<input id="btn" type="button" class="btn btn-default" onclick="submit()" value="저장"/>
	</div>
	</form>
</div>
</body>
</html>