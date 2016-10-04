<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<title></title>
<style>
#contentg {
	border: 1px solid;
	border-color: gray;
	width: 90%; height : 70%;
	overflow: scroll;
	height: 70%;
}

div#inner{
	width : 70%;
	float : left;

}

div#modify{
	width : 30%;
	float : right;
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
		request.execute(function(resp) {
					for (i = 0; i < resp.items.length; i++) {
						var titulo = resp.items[i].title;
						var fechaUpd = resp.items[i].modifiedDate;
						var userUpd = resp.items[i].lastModifyingUserName;/* 
																						var userEmbed = resp.items[i].embedLink; */
						var userAltLink = resp.items[i].alternateLink;

						if (userAltLink.substring(24, 36) == 'spreadsheets'
								|| userAltLink.substring(24, 32) == 'document'
								|| userAltLink.substring(24, 36) == 'presentation') {
							var fileInfo = document.createElement('a');
							var fileInfo2 = document.createElement('a');
							var hr = document.createElement('hr');
							var hr2 = document.createElement('hr');
							var img = document.createElement('img');

							if (userAltLink.substring(24, 36) == 'spreadsheets') {
								img.setAttribute("src","/Puzzle/img/app-vnd-oasis-opendocument-presentation-icon.png");
								img.setAttribute("width", "5%");
								img.setAttribute("height", "5%");
							}

							else if (userAltLink.substring(24, 32) == 'document') {
								img.setAttribute("src","/Puzzle/img/app-vnd-oasis-opendocument-presentation-icon.png");
								img.setAttribute("width", "5%");
								img.setAttribute("height", "5%");
							}

							else if (userAltLink.substring(24, 36) == 'presentation') {
								img.setAttribute("src","/Puzzle/img/app-vnd-oasis-opendocument-presentation-icon.png");
								img.setAttribute("width", "5%");
								img.setAttribute("height", "5%");
							}

							fileInfo.appendChild(img);
							fileInfo.setAttribute("href", userAltLink);
							fileInfo.appendChild(document.createTextNode(titulo));
							fileInfo.appendChild(hr);
							fileInfo2.appendChild(document.createTextNode(fechaUpd))
							fileInfo2.appendChild(hr2);
							document.getElementById('inner').appendChild(fileInfo);
							document.getElementById('modify').appendChild(fileInfo2);
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
</head>
<body>
	<h2>나의 양식 리스트</h2>
	<div id="contentg">
	<div id="inner"><center>제목</center><hr></div>
		<div id="modify"><center>작성일(생성일)</center><hr></div>

	</div>



	<button id="authorize-button">Login</button>
</body>
</html>