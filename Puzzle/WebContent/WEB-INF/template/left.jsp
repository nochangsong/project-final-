<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
   $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#menu>a").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
            $(this).next("ul").toggleClass("hide");
        });
    });
   $(document).ready(function(){
       // board 클래스 바로 하위에 있는 a 태그를 클릭했을때
       $("#board>a").click(function(){
           // 현재 클릭한 태그가 a 이기 때문에
           // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
           $(this).next("ul").toggleClass("hide");
       });
   });
</script>
  
  <style>
  	a{
  	text-align: left;
  	font-size: medium;
  	vertical-align: bottom;
  	
  	}
  	
  	ul.nav li a:hover { 
        background-color: #fff; 
        font-weight: bold;   
        color: #3163C9;
     }

	.container .nav li a{
		background-color: #fff;
	}
	
	#menu a{cursor:pointer;}
    #menu .hide{display:none;}
    
    ul li ul li{
    	width: 140px;
    	list-style: none;
    }
    .hide li a span {
    	font-size: x-small;
    }
    .img {
    	height: auto;
    	width: 250px;
/*     	margin: auto; */
     	margin-left: 25px; 
    }
</style>
    
 <div class="img"><img alt="조직로고" src="/Puzzle/admin/company/getLogo.puzzle" width="100%"/></div>
 <div class="container">
	<ul class="nav nav-stacked">
		<c:if test="${sessionScope.authority=='1'}">
		<li class="col-sm-2" id="menu"><a href="#"><img src="/Puzzle/img/docuwrite.png" width="25px;">&nbsp;관리자</a>
			<ul class="hide">
				<li><a href="/Puzzle/admin/company/company.puzzle"><span class="glyphicon glyphicon-user">&nbsp;조직관리</span></a></li>
           		<li><a href="/Puzzle/admin/position/positionList.puzzle"><span class="glyphicon glyphicon-tasks">&nbsp;직급관리</span></a></li> 
            	<li><a href="/Puzzle/department/departmentList.puzzle"><span class="glyphicon glyphicon-credit-card">&nbsp;조직도/조직원관리</span></a></li>
            	<li><a href="/Puzzle/docubox/DocuBoxAll.puzzle"><span class="glyphicon glyphicon-inbox">&nbsp;전체문서함</span></a></li>
            	<li><a href="#"><span class="glyphicon glyphicon-pencil">&nbsp;문서양식</a></span></li>
            	<li><a href="#"><span class="glyphicon glyphicon-list-alt">&nbsp;게시판관리</a></span></li>
            	<li><a href="#"><span class="glyphicon glyphicon-calendar">&nbsp;근태관리</a></span></li>  
			</ul>
		</li>
		</c:if>
     	<li class="col-sm-2"><a href="/Puzzle/document/lately.puzzle"><img src="/Puzzle/img/docuwrite.png" width="25px;">&nbsp;기안문서작성</a></li>
     	<li class="col-sm-2"><a href="#"><img src="/Puzzle/img/docusuc.png" width="25px;">&nbsp;결제할문서</a></li>
    	<li class="col-sm-2" id="board"><a href="#"><img src="/Puzzle/img/board.png" width="25px;">&nbsp;게시판</a>
	    	<ul class="hide">
				<li><a href="/Puzzle/notify/notifyList.puzzle">공지사항</a></li>
				<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=1">영업팀</a></li>
				<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=2">개발팀</a></li>
				<li><a href="/Puzzle/board/boardList.puzzle?DEPT_NUM=3">인사팀</a></li>   
			</ul>
	    </li>
   	 	<li class="col-sm-2"><a href="#"><img src="/Puzzle/img/userinfo.png" width="25px;">&nbsp;조직원정보</a></li>
     	<li class="col-sm-2"><a href="/Puzzle/calendar/calendarList.puzzle"><img src="/Puzzle/img/a.png" width="25px;">&nbsp;일정관리</a></li>
	</ul>
</div>

</body>
</html>