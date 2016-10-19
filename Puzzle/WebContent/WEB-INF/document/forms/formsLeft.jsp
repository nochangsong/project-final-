<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%
	System.out.println(request.getRequestURL());
%>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
#formleft {
	border: 1px solid;
	border-color: #8EA7EB; width : 18%;
	height: 18%;
	color: #3163C9;
	font-size: medium;
	text-align: left;
	padding-left: 2%;
	width: 18%;
	float : left;
}

#formright{

	height : 70%;
}

#contentg {
	border: 1px solid;
	border-color: gray;
	width: 80%;
	height: 5%;
	overflow: hidden;
	height: 70%;
	float: right;
}

div#inner {
	width: 70%;
	float: left;
}

div#modify {
	width: 30%;
	float: right;
}
</style>
<script>
	var CLIENT_ID = '977592781685-ck9dc9ep6pov4e1if5o2srnpsv6bjuh6.apps.googleusercontent.com';
	var API_KEY = 'AIzaSyB3SCbRSvfBipNMkmMGnTq8lTkaczvSmXU';
	var SCOPES = 'https://www.googleapis.com/auth/drive';

	function handleClientLoad() {
		gapi.client.setApiKey(API_KEY);
		window.setTimeout(checkAuth, 1);
	}

	function checkAuth() {
		var options = {
			client_id : CLIENT_ID,
			scope : SCOPES,
			immediate : true
		};
		gapi.auth.authorize(options, handleAuthResult);
	}

	function handleAuthResult(authResult) {
		var authorizeButton = document.getElementById('authorize-button');

		if (authResult && !authResult.error) {
			authorizeButton.style.visibility = 'hidden';
			makeApiCall();
		} else {
			authorizeButton.style.visibility = '';
			authorizeButton.onclick = handleAuthClick;
		}
	}

	function handleAuthClick(event) {
		var options = {
			client_id : CLIENT_ID,
			scope : SCOPES,
			immediate : false
		};
		gapi.auth.authorize(options, handleAuthResult);
		return false;
	}

	function makeApiCall() {
		gapi.client.load('drive', 'v2', makeRequest);
	}

	function makeRequest() {
		var request = gapi.client.drive.files.list({
			'maxResults' : 30
		});
		request
				.execute(function(resp) {
					for (i = 0; i < 3; i++) {
						var titulo = resp.items[i].title;
						var fechaUpd = resp.items[i].modifiedDate;
						var userUpd = resp.items[i].lastModifyingUserName;/* 
																																		var userEmbed = resp.items[i].embedLink; */
						var userAltLink = resp.items[i].alternateLink;
						var date = new Date(fechaUpd);
						var month = date.getMonth() + 1;

						var bdate = date.getFullYear() + '-' + month + '-'
								+ date.getDate() + ' ' + date.getHours() + ':'
								+ date.getMinutes() + ':' + date.getSeconds();

						if (userAltLink.substring(24, 36) == 'spreadsheets'
								|| userAltLink.substring(24, 32) == 'document'
								|| userAltLink.substring(24, 36) == 'presentation') {
							var fileInfo = document.createElement('a');
							var fileInfo2 = document.createElement('a');
							var hr = document.createElement('hr');
							var hr2 = document.createElement('hr');
							var img = document.createElement('img');

							if (userAltLink.substring(24, 36) == 'spreadsheets') {
								img
										.setAttribute("src",
												"/Puzzle/img/app-vnd-oasis-opendocument-spreadsheet-icon.png");
								img.setAttribute("width", "5%");
								img.setAttribute("height", "5%");
							}

							else if (userAltLink.substring(24, 32) == 'document') {
								img
										.setAttribute("src",
												"/Puzzle/img/app-vnd-oasis-opendocument-text-icon.png");
								img.setAttribute("width", "5%");
								img.setAttribute("height", "5%");
							}

							else if (userAltLink.substring(24, 36) == 'presentation') {
								img
										.setAttribute("src",
												"/Puzzle/img/app-vnd-oasis-opendocument-presentation-icon.png");
								img.setAttribute("width", "5%");
								img.setAttribute("height", "5%");
							}

							fileInfo.appendChild(img);
							fileInfo.setAttribute("href", "/Puzzle/document/mydocument.puzzle?url="+userAltLink);
							fileInfo.appendChild(document
									.createTextNode(titulo));
							fileInfo.appendChild(hr);
							fileInfo2.appendChild(document
									.createTextNode(bdate))
							fileInfo2.appendChild(hr2);
							document.getElementById('inner').appendChild(
									fileInfo);
							document.getElementById('modify').appendChild(
									fileInfo2);
						}

					}
				});
	}

	$(document).ready(function() {
		$('#authorize-button').on('click', handleAuthClick);
		$.getScript('//apis.google.com/js/api.js', function() {
			gapi.load('auth:client', handleClientLoad);
		});
	});
</script>
<title></title>
</head>
<body>
	<br>
	<br>
	<div id="formleft">
		<br>
		<ul>
			<li><a href="/Puzzle/document/lately.puzzle">최근 사용 문서</a></li>
			<li><a href="/Puzzle/document/shareForm.puzzle">공동 양식</a></li>
			<li><a href="/Puzzle/document/freeDraft.puzzle">자유 기안</a></li>
			<li><a href="/Puzzle/document/myWriteForm.puzzle">나의 양식</a></li>

		</ul>
	</div>

	<div id="formright">

		<div id="contentg">
			<h2>&nbsp;최근 사용 문서</h2><hr>
			<div id="inner">
				&nbsp;&nbsp;&nbsp;제목
				<hr>
			</div>
			<div id="modify">
				작성일(생성일)
				<hr>
			</div>

		</div>
	</div>


	<button id="authorize-button">Login</button>
</body>
</html>