<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

/* .container { */
/*   width: 970px; */
/*   max-width: none !important; */
/* } */
  
	#well{
		background-color: white;
		margin-bottom: 0px;
		margin-right: 0px;
		margin-left: 0px;
		padding-bottom: 0px;
		position: relative;
		width: 100%
	}
	
  	#message, #main {
  		border: 0px;
  		height: 79.79px;
  		width: 100px;
  		text-align: center;
  		padding-bottom: 0px;
  		margin-top: 12px;
  		right: 0px;
  	}
  	
  	#logo{
  		margin-bottom:  0px;
  		margin-left: 20px;
   	}
  	
  	#message{
  		padding-top: 12px;
  	}
  	

  </style>
<div class="well" id="well">
  <div class="row" style="width: 100%">
    <div class="col-sm-2" id="logo"><a href="/Puzzle/main/main.puzzle"><img src="/Puzzle/img/logo.png" width="200px"></a></div>
    
    <div class="col-sm-8"></div>
    
    <div class="col-sm-1" id="message"><a href="/Puzzle/message/messageList.puzzle"><img src="/Puzzle/img/message.png" width="40px"><span class="badge"></span><br>message</a></div>
    <div class="col-sm-1" id="main"><a href="#"><img src="/Puzzle/img/user.png" width="40px"><br>user</a></div>
	
  </div>
</div> 