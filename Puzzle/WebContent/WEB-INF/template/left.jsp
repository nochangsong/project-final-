<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
   $(document).ready(function(){
        // memu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $("#menu>a").click(function(){
            // ���� Ŭ���� �±װ� a �̱� ������
            // a ���� �±��� ul �±׿� hide Ŭ���� �±׸� �ִ��� ������ �Ѵ�.
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
</style>
    
  
 <div class="container">
	<ul class="nav nav-stacked">
		<c:if test="${sessionScope.authority=='1'}">
		<li class="col-sm-2" id="menu"><a href="#"><img src="/Puzzle/img/docuwrite.png" width="25px;">&nbsp;������</a>
			<ul class="hide">
				<li><a href="#"><span class="glyphicon glyphicon-user"> ��������</span></a></li>
				<li><a href="/Puzzle/admin/position/positionList.puzzle">���ް���</a></li> 
				<li><a href="/Puzzle/PersonnelView/P_Card_in.puzzle">������/����������</a></li>
				<li><a href="/Puzzle/admin/department/departmentList.puzzle">������/����������</a></li>
				<li><a href="#">��ü������</a></li>
				<li><a href="#">�������</a></li>
				<li><a href="#">�Խ��ǰ���</a></li>
				<li><a href="#">���°���</a></li>   
			</ul>
		</li>
		</c:if>
     	<li class="col-sm-2"><a href="#"><img src="/Puzzle/img/docuwrite.png" width="25px;">&nbsp;��ȹ����ۼ�</a></li>
     	<li class="col-sm-2"><a href="#"><img src="/Puzzle/img/docusuc.png" width="25px;">&nbsp;�����ҹ���</a></li>
    	<li class="col-sm-2"><a href="/Puzzle/board/boardList.puzzle"><img src="/Puzzle/img/board.png" width="25px;">&nbsp;�Խ���</a></li>
   	 	<li class="col-sm-2"><a href="#"><img src="/Puzzle/img/userinfo.png" width="25px;">&nbsp;����������</a></li>
     	<li class="col-sm-2"><a href="/Puzzle/calendar/calendarList.puzzle"><img src="/Puzzle/img/a.png" width="25px;">&nbsp;��������</a></li>
	</ul>
</div>

</body>
</html>