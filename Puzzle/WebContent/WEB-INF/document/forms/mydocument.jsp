<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%
	String url = request.getParameter("url");
%>
<title></title>
</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
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
		var authorizeButton = document.getElementById('sendCheck');

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
			for (i = 0; i < 1; i++) {
				var titulo = resp.items[i].title;
				var fechaUpd = resp.items[i].modifiedDate;
				var userUpd = resp.items[i].lastModifyingUserName;
				
				resp.items[i].shared = true;
				var view = resp.items[i].id;
				/* 
				
																								var userEmbed = resp.items[i].embedLink; */
				var userAltLink = resp.items[i].alternateLink;
				var type = resp.items[i].mimeType;
				var date = new Date(fechaUpd);
				var month = date.getMonth() + 1;
				

				var bdate = date.getFullYear() + '-' + month + '-'
						+ date.getDate() + ' ' + date.getHours() + ':'
						+ date.getMinutes() + ':' + date.getSeconds();

				if (userAltLink.substring(24, 36) == 'spreadsheets'
						|| userAltLink.substring(24, 32) == 'document'
						|| userAltLink.substring(24, 36) == 'presentation') {
					/* 	var fileInfo = document.createElement('a');
						var hr = document.createElement('hr');

						fileInfo.setAttribute("href", userAltLink);
						fileInfo.appendChild(document.createTextNode(titulo));
						document.getElementById('content').value = titulo;
						document.getElementById('mylink').value = userAltLink;
						document.getElementById('filetime').value = bdate; */
					var checkin = confirm('기안을 하시겠습니까?');
					var fileId = view;
					if (checkin) {
						var body = {
							    'value': 'starkcb926@gmail.com',
							    'type': 'user',
							    'role': 'reader'
							  };
							  var request = gapi.client.drive.permissions.insert({
							    'fileId': fileId,
							    'resource': body
							  });
							  request.execute(function(resp) { });
							  
						var link = "/Puzzle/document/sendDraft.puzzle" + "?filename=" + titulo
								+ "&filelink=" + userAltLink + "&reg_date="
								+ bdate;
						location.replace(link);
					} else {

					}

				}

			}
		});
	}

	/* $(document).ready(function() {
		$('#authorize-button').on('click', handleAuthClick);
		$.getScript('//apis.google.com/js/api.js', function() {
			gapi.load('auth:client', handleClientLoad);
		});
	}); */

	function checkin() {
		$('#sendCheck').on('click', handleAuthClick);
		$.getScript('//apis.google.com/js/api.js', function() {
			gapi.load('auth:client', handleClientLoad);
		});

	}
</script>
<body>
	<br>
	<button id="sendCheck" onclick="checkin()">기안하기</button>
	&nbsp;
	<button id="backpage" onclick="checkout()">저장 후 나가기</button>
	<br>
	<br>


	<iframe width="100%" height="100%"
		src="<%=url%>"></iframe>
	


</body>
</html>