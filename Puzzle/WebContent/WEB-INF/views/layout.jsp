<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

  #content{
  	margin-top: 10px;
  	padding-top: 10px;
  	height: 80%;
  }

  </style>
</head>

<tiles:insertAttribute name="header" />


 
<div class="row" id="content">
	<div class="col-sm-2"><tiles:insertAttribute name="left"/></div>
	<div class="col-sm-10"><tiles:insertAttribute name="content"/></div>
</div>


<div class="footer">
<tiles:insertAttribute name="footer" />
</div>