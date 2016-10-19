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

<head>
<style>

img{

	margin-left: 5%;
	margin-right: 5%;
}
#formleft {
	border: 1px solid;
	border-color: #8EA7EB;
	width: 18%;
	height: 18%;
	color: #3163C9;
	font-size: medium;
	text-align: left;
	padding-left: 2%;
	width: 18%;
	float: left;
}


#formright{
	border : 1px solid;
	border-color : #8EA7EB;
	float : right;
	width : 70%;
	font-size: medium;
	margin-right: 10%;
}
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
<%
	DriveQuickstart dqs = new DriveQuickstart();
	Drive service = dqs.getDriveService();
	// Print the names and IDs for up to 10 files.
	FileList result = service.files().list().setPageSize(20)
			.setFields("nextPageToken, files(id, name,webViewLink,owners,shared,permissions)").execute();
	List<File> files = result.getFiles();
%>
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

	<div id="formright"><h2>&nbsp;공동 양식 리스트</h2><hr>
		<div id="sheet">
			<table>
				<%
					if (files == null || files.size() == 0) {
					} else {
						for (File file : files) {
							if (file.getName().substring(0, 6).equals("Puzzle")) {
								if (file.getWebViewLink().substring(24, 36).equals("spreadsheets")) {
				%><tr>
					<td><img src="/Puzzle/img/app-vnd-oasis-opendocument-spreadsheet-icon.png" width="18%" height="18%"><a
						href="https://docs.google.com/spreadsheets/d/<%=file.getId()%>/edit"><%=file.getName()%></a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>


			</table>
		</div><hr>
		<div id="word">
			<table>
				<%
					if (files == null || files.size() == 0) {
					} else {
						for (File file : files) {
							if (file.getName().substring(0, 6).equals("Puzzle")) {
								if (file.getWebViewLink().substring(24, 32).equals("document")) {
				%><tr>
					<td><img src="/Puzzle/img/app-vnd-oasis-opendocument-text-icon.png" width="24%" height="18%"><a
						href="https://docs.google.com/document/d/<%=file.getId()%>/edit"><%=file.getName()%></a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>
			</table>
		</div><hr>
		<div id="ppt">
			<table>	
				<%
					if (files == null || files.size() == 0) {
					} else {
						for (File file : files) {
							if (file.getName().substring(0, 6).equals("Puzzle")) {
								if (file.getWebViewLink().substring(24, 36).equals("presentation")) {
				%>

				<tr>
					<td><img src="/Puzzle/img/app-vnd-oasis-opendocument-presentation-icon.png" width="24%" height="18%"><a
						href="https://docs.google.com/presentation/d/<%=file.getId()%>/edit"><%=file.getName()%></a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>
			</table><hr>
		</div>
	</div>
</body>
</html>