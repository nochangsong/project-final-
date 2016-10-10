<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>Google Drive File Picker Example </title>
</head>
<body>
	<button type="button" id="pick">불러오기</button>
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

	<script src="https://www.google.com/jsapi?key=AIzaSyAeyWt8Ccq6I-xRk78IZvFFMAVz2UMzRYw"></script>
	<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
</body>
</html>