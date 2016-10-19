<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.google.api.services.drive.*"%>
<%@ page import="com.google.api.services.drive.model.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.util.*"%>
<%@ page import="controller.forms.DriveQuickstart"%>

<html>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>


<script
	src="https://www.google.com/jsapi?key=AIzaSyAeyWt8Ccq6I-xRk78IZvFFMAVz2UMzRYw"></script>
<script>
	function checkValue() {
		if (document.check.checking.value == "0") {
			alert('선택해 주세요.');
			return false;
		}
	}
</script>
<style>
#sheet {
	position: relative;
	width: 20%;
}

#word {
	width: 20%;
	position: relative;
}

#ppt {
	width: 20%;
	position: relative;
}
</style>
<head>
<%
	DriveQuickstart dqs = new DriveQuickstart();
	Drive service = dqs.getDriveService();
	// Print the names and IDs for up to 10 files.
	FileList result = service.files().list().setPageSize(20)
			.setFields("nextPageToken, files(id, name,webViewLink,owners,shared,permissions)").execute();
	List<File> files = result.getFiles();
%>
<title>디스 이스 테스트</title>
</head>
<body>
	<div id="formright">
		<div id="sheet">
			<table border="1">
				<tr>엑셀임
				</tr>
				<%
					if (files == null || files.size() == 0) {
					} else {
						for (File file : files) {
							if (file.getName().substring(0, 6).equals("Puzzle")) {
								if (file.getWebViewLink().substring(24, 36).equals("spreadsheets")) {
				%><tr>
					<td><a
						href="https://docs.google.com/spreadsheets/d/<%=file.getId()%>/edit"><%=file.getName()%></a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>


			</table>
		</div>
		<div id="word">
			<table border="1">
				<tr>
					<h2>워드임</h2>
				</tr>
				<%
					if (files == null || files.size() == 0) {
					} else {
						for (File file : files) {
							if (file.getName().substring(0, 6).equals("Puzzle")) {
								if (file.getWebViewLink().substring(24, 32).equals("document")) {
				%><tr>
					<td><a
						href="https://docs.google.com/document/d/<%=file.getId()%>/edit"><%=file.getName()%></a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>
			</table>
		</div>
		<div id="ppt">
			<table border="1">
				<tr>
					<h2>PPT임</h2>
				</tr>
				<%
					if (files == null || files.size() == 0) {
					} else {
						for (File file : files) {
							if (file.getName().substring(0, 6).equals("Puzzle")) {
								if (file.getWebViewLink().substring(24, 36).equals("presentation")) {
				%>

				<tr>
					<td><a
						href="https://docs.google.com/presentation/d/<%=file.getId()%>/edit"><%=file.getName()%></a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>