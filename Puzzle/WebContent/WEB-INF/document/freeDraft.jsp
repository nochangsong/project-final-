<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="977592781685-ap644q9liv0bomoj8omiu152lvd5ru2l.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="/Puzzle/WEB-INF/document/filepicker.js"></script>
<script>
	$(document).ready(function() {
		var FilePicker = window.FilePicker = function(options) {
			// Config
			this.apiKey = options.apiKey;
			this.clientId = options.clientId;

			// Elements
			this.buttonEl = options.buttonEl;

			// Events
			this.onSelect = options.onSelect;
			this.buttonEl.addEventListener('click', this.open.bind(this));

			// Disable the button until the API loads, as it won't work properly
			// until then.
			this.buttonEl.disabled = true;

			// Load the drive API
			gapi.client.setApiKey(this.apiKey);
			gapi.client.load('drive', 'v2', this._driveApiLoaded.bind(this));
			google.load('picker', '1', {
				callback : this._pickerApiLoaded.bind(this)
			});
		}

		FilePicker.prototype = {
			/**
			 * Open the file picker.
			 */
			open : function() {
				// Check if the user has already authenticated
				var token = gapi.auth.getToken();
				if (token) {
					this._showPicker();
				} else {
					// The user has not yet authenticated with Google
					// We need to do the authentication before displaying the Drive
					// picker.
					this._doAuth(false, function() {
						this._showPicker();
					}.bind(this));
				}
			},

			/**
			 * Show the file picker once authentication has been done.
			 * 
			 * @private
			 */
			_showPicker : function() {
				var accessToken = gapi.auth.getToken().access_token;
				this.picker = new google.picker.PickerBuilder().addView(
						google.picker.ViewId.DOCS).setAppId(this.clientId)
						.setOAuthToken(accessToken).setCallback(
								this._pickerCallback.bind(this)).build()
						.setVisible(true);
			},

			/**
			 * Called when a file has been selected in the Google Drive file picker.
			 * 
			 * @private
			 */
			_pickerCallback : function(data) {
				if (data[google.picker.Response.ACTION] == google.picker.Action.PICKED) {
					var file = data[google.picker.Response.DOCUMENTS][0], 
					id = file[google.picker.Document.ID], 
					request = gapi.client.drive.files.get({fileId : id});

					request.execute(this._fileGetCallback.bind(this));
				}
			},
			/**
			 * Called when file details have been retrieved from Google Drive.
			 * 
			 * @private
			 */
			_fileGetCallback : function(file) {
				if (this.onSelect) {
					this.onSelect(file);
				}
			},

			/**
			 * Called when the Google Drive file picker API has finished loading.
			 * 
			 * @private
			 */
			_pickerApiLoaded : function() {
				this.buttonEl.disabled = false;
			},

			/**
			 * Called when the Google Drive API has finished loading.
			 * 
			 * @private
			 */
			_driveApiLoaded : function() {
				this._doAuth(true);
			},

			/**
			 * Authenticate with Google Drive via the Google JavaScript API.
			 * 
			 * @private
			 */
			_doAuth : function(immediate, callback) {
				gapi.auth.authorize({
					client_id : this.clientId + '.apps.googleusercontent.com',
					scope : 'https://www.googleapis.com/auth/drive.file',
					immediate : immediate
				}, callback);
			}
		};
		
	});
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
	width: 32%;
	height: 38%;
	text-align: center;
	float: left;
	margin-left: 8%;
}

.choise {
	width: 13%;
}

div#loadGoogleDrive {
	border: 1px solid;
	border-color: #8EA7EB;
	width: 32%;
	height: 38%;
	text-align: center;
	float: right;
	margin-right: 26%;
}

div#workimage {
	float: left;
	width: 40%;
	height: 65%;
	margin-left: 7%;
	top: 5%;
}

div#selectType {
	width: 40%;
	height: 60%;
	float: right;
	margin-right: 7%;
	top: 5%;
}
</style>
<title>Free Draft</title>
</head>
<body>
	<div id="check">
		직접 작성하기
		<hr>
		<div id="workimage">
			<img src="/Puzzle/img/freeDraft/office_work-512.png"
				style="width: 100%; height: 100%">
		</div>
		<div id="selectType">
			<br>
			<form method="post" action="checkDoc.puzzle" name="check"
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
		<img src="/Puzzle/img/freeDraft/logo_lockup_drive_icon_horizontal.png"
			style="width: 90%; height: 50%"><br>
		<button type="button" id="pick">불러오기</button>
	</div>
</body>
</html>