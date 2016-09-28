<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="977592781685-ap644q9liv0bomoj8omiu152lvd5ru2l.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="filepicker.js"></script>
<script>
	function initPicker() {
		var picker = new FilePicker({
			apiKey : 'AIzaSyAeyWt8Ccq6I-xRk78IZvFFMAVz2UMzRYw',
			clientId : '977592781685-ap644q9liv0bomoj8omiu152lvd5ru2l',
			buttonEl : document.getElementById('pick'),
			onSelect : function(file) {
				console.log(file);
				alert('Selected ' + file.title);
				location.replace(file.alternateLink);
			}
		});
	}
</script>

<script
	src="https://www.google.com/jsapi?key=AIzaSyAeyWt8Ccq6I-xRk78IZvFFMAVz2UMzRYw"></script>
<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
<script>
	function checkValue() {
		if (document.check.checking.value == "0") {
			alert('선택해 주세요.');
			return false;
		}
	}
</script>
<style>
div#check {
	border: 1px solid;
	border-color: #8EA7EB;
	width: 20%;
	height: 25%;
	text-align: center;
	float: left;
	margin-left: 28%;
}

.choise {
	width: 13%;
}

div#loadGoogleDrive {
	border: 1px solid;
	border-color: #8EA7EB;
	width: 20%;
	height: 25%;
	text-align: center;
	float: right;
	margin-right: 28%;
}

div#workimage {
	float : left;
	width: 40%;
	height: 65%;
	margin-left: 7%;
	top : 5%;
	
}

div#selectType {
	width : 40%;
	height : 60%;
	float : right;
	margin-right: 7%;
	top : 5%;
}
</style>
<title>Free Draft</title>
</head>
<body>
	<div id="check">
		직접 작성하기
		<hr>
		<div id="workimage">
			<img src="img/office_work-512.png" style="width: 100%; height: 100%">
		</div>
		<div id="selectType">
		<br>
			<form method="post" action="checkDoc.jsp" name="check"
				onsubmit="return checkValue()">
				<select name="checking" id="choise">
					<option value="0">선택</option>
					<option value="1">Google Sheets</option>
					<option value="2">Google Docs</option>
					<option value="3">Google Slides</option>
				</select> <br> <br> <input type="submit" value="새로 만들기">
			</form>
		</div>
	</div>

	<div id="loadGoogleDrive">
		Google Drive에서 불러오기
		<hr style="border-color: #8EA7EB">
		<img src="img/logo_lockup_drive_icon_horizontal.png"
			style="width: 90%; height: 50%"><br>
		<button type="button" id="pick">불러오기</button>
	</div>
</body>
</html>