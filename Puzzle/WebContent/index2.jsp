<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Puzzle</title>

    <!-- Bootstrap Core CSS -->
    <link href="template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="template/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="template/css/agency.min.css" rel="stylesheet">


	<script type="text/javascript">
		function logout() {

			location.replace('https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8088/Puzzle/login.jsp');
		}
		function login() {
			var myParams = {
				'clientid' : '977592781685-ap644q9liv0bomoj8omiu152lvd5ru2l.apps.googleusercontent.com',
				'cookiepolicy' : 'single_host_origin',
				'callback' : 'loginCallback',
				'approvalprompt' : 'force',
				'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
			};
			gapi.auth.signIn(myParams);

		}

		function loginCallback(result) {
			if (result['status']['signed_in']) {
				var request = gapi.client.plus.people.get({
					'userId' : 'me'
				});
				request.execute(function(resp) {
						var email = '';
						if (resp['emails']) {
							for (i = 0; i < resp['emails'].length; i++) {
								if (resp['emails'][i]['type'] == 'account') {
									email = resp['emails'][i]['value'];
								}
							}
						}

						var str =  email ;
						var link = "LoginView.puzzle"+"?email="+str;
						location.replace(link);
					}); 

			}
			
		}
		function onLoadCallback() {
			gapi.client.setApiKey('AIzaSyAeyWt8Ccq6I-xRk78IZvFFMAVz2UMzRYw');
			gapi.client.load('plus', 'v1', function() {
			});
		}
	</script>

	<script type="text/javascript">
		(function() {
			var po = document.createElement('script');
			po.type = 'text/javascript';
			po.async = true;
			po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(po, s);
		})();
	</script>
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"><img style="margin-top:-17px" width="150px" src="template/img/puzzle_logo_white.png"/></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#client">Client</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-heading">MAKE SMART DECISIONS WITH PUZZLE!</div>
                <div class="intro-lead-in">Puzzle은 Google 계정만 있으면 누구나 무료로 이용할 수 있습니다.</div>
                <a href="#" class="page-scroll btn btn-xl" onclick="login()">puzzle 시작하기</a>
            </div>
        </div>
    </header>
    
    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">About</h2>
                    <h3 class="section-subheading text-muted">Puzzle에 대한 설명 및 이용방법을 소개합니다.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="template/img/logos/logo.png" style="width: 140px; padding-left: 15px; padding-top:17px;">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">Our Company Beginnings</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Puzzle은  Google 계정을 이용하여 기업 내 문서결재<br>시스템을 보다 간편하고 효율적으로 사용할 수 있도록 <br>서비스를 제공합니다. </p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="template/img/about/file-document.png" style="width: 156px;" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">기안문서 작성</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">사용자는 Google Docs 문서로 <br>간편하게 기안문서를 작성할 수 있습니다.<br>또한 원하는 대로 프로세스를 지정하고,<br>드래그앤드롭으로 순서를 변경할 수 있습니다.</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="template/img/about/file-contacts.png" style="width: 156px;" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">결재와 의견 작성</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">결재자는 결재요청에 대한 알림메일을 받을 수 있고<br> 메일에서 바로 결재가 가능합니다.<br>또한 해당 문서에 의견을 작성하여 <br>조직원들과 소통할 수 있습니다.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="template/img/about/google-drive.png" style="width: 157px; padding-top:21px;" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="subheading">Google Drive에 자동 저장</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">작성한 문서와 첨부파일은 <br>대표계정의 Google Drive에 자동으로 저장됩니다.<br>Puzzle에서 사용된 모든 기안문서, 첨부파일, 게시물은 대표계정의 Google Drive에 자동으로<br> 정리되어 저장됩니다.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>About<br>Puzzle</h4>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    <h3 class="section-subheading text-muted">Puzzle에서는 아래의 기능들을 모두 동시에 제공합니다.</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                    	<img src="template/img/group.png"/>
                    </span>
                    <h4 class="service-heading">효율적인 조직관리</h4>
                    <p class="text-muted">조직의 직급/직책 관리, 조직도/조직원 관리를 할 수 있습니다. 조직도는 트리구조로 편리하게 구성할 수 있습니다.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img src="template/img/docu_admin.png"/>
                    </span>
                    <h4 class="service-heading">문서함 관리</h4>
                    <p class="text-muted">자신이 기안하거나 결재한 문서들을 자신만의 카테고리로 분류하여 편리하게 관리할 수 있습니다.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img src="template/img/document.png"/>
                    </span>
                    <h4 class="service-heading">문서양식 관리</h4>
                    <p class="text-muted">Puzzle에서는 수많은 문서양식을 무료로 제공하고 있으며 조직의 공동양식으로 사용할 수 있습니다.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img src="template/img/schedule.png"/>
                    </span>
                    <h4 class="service-heading">일정관리</h4>
                    <p class="text-muted">캘린더를 연동하여 일정을 등록하고 각 부서 직원들과 공유할 수 있습니다.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img src="template/img/holiday_admin.png"/>
                    </span>
                    <h4 class="service-heading">휴가신청 관리</h4>
                    <p class="text-muted">기본적인 휴가 신청 양식을 제공하며, 휴가 신청 및 승인을 편리하게 이용할 수 있습니다.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <img src="template/img/board.png"/>
                    </span>
                    <h4 class="service-heading">협업게시판</h4>
                    <p class="text-muted">공지사항 및 자유게시판이 기본으로 제공되며 추가로 3개의 게시판을 더 생성할 수 있습니다.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- client Section -->
    <section id="client">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Clients</h2>
                    <h3 class="section-subheading text-muted">Puzzle과 함께하는 대표적인 기업들입니다.</h3>
                </div>
            </div>
            <div class="row">
				<div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <img src="template/img/logos/chachacha.png" class="img-responsive" width="360px" height="260px">
                    </a>
                    <div class="portfolio-caption" style="text-align: center">
                        <h4>chachacha</h4>
                        <p class="text-muted">다함께 차차차</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <img src="template/img/logos/pis.png" class="img-responsive" width="360px" height="260px">
                    </a>
                    <div class="portfolio-caption" style="text-align: center">
                        <h4>Parking Info System</h4>
                        <p class="text-muted">PIS</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <img src="template/img/logos/forki.png" class="img-responsive" width="360px" height="260px">
                    </a>
                    <div class="portfolio-caption" style="text-align: center">
                        <h4>forki</h4>
                        <p class="text-muted">Forki</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <img src="template/img/logos/gaebals.png" class="img-responsive" width="360px" height="260px">
                    </a>
                    <div class="portfolio-caption" style="text-align: center">
                        <h4>gaebals</h4>
                        <p class="text-muted">Gaebals</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <img src="template/img/logos/honeycomb.png" class="img-responsive" width="360px" height="260px">
                    </a>
                    <div class="portfolio-caption" style="text-align: center">
                        <h4>honeycomb</h4>
                        <p class="text-muted">Honeycomb</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <img src="template/img/logos/interhash.png" class="img-responsive" width="360px" height="260px">
                    </a>
                    <div class="portfolio-caption" style="text-align: center">
                        <h4>interhash</h4>
                        <p class="text-muted">코딩네이터</p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted">궁금한 사항이나 의견이 있으면 문의해주세요.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-xl conbtn">문의하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Puzzle<br>
                    </span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="template/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="template/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="template/js/jqBootstrapValidation.js"></script>
    <script src="template/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="template/js/agency.min.js"></script>

</body>

</html> 
