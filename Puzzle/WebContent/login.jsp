<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="977592781685-ap644q9liv0bomoj8omiu152lvd5ru2l.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<head>
<title>Insert title here</title>
<script>
	function onSignIn(googleUser) {
		var options = new gapi.auth2.SigninOptionsBuilder({
			'scope' : 'email https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.appdata'
		});
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());

		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
		/* location.replace('viewJsp.jsp'); */
// 		alert('Login Success');
// 		alert(profile.getEmail());
// 		location.href='/Puzzle/main/user.puzzle';
	};
	function signOut() {
// 		var auth2;
// 		gapi.load('auth2', function() {
// 			auth2 = gapi.auth2.getAuthInstance();
// 		});
// 		auth2.signOut().then(function() {
// 			gapi.auth.signOut();
// 			alert('User signed out.');
// 		});

		gapi.load('auth2', function() {
			var auth2 = gapi.auth2.getAuthInstance();
			gapi.auth.signOut();
			alert('User signed out.');
		});
	}
	
	function logout()
	{
	    alert('logging out');
	    var auth2 = gapi.auth2.getAuthInstance();
	        auth2.signOut().then(function () {
	        alert('User signed out.');
	        });
	        
	}
	
</script>

</head>
<body>

	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	<br>
	<a href="#" onclick="signOut();return false;">Sign out</a>
	<button onclick="signOut()">Sign Out</button>
	<div onmousedown="logout()">Logout</div>
	<div id="email"></div>
</body>
</html>