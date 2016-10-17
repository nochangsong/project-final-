<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

    <title>puzzle</title>
    

    <!-- style -->
    <link href="Startr - Free Startup Landing page Template/css/style.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap -->
    <link href="Startr - Free Startup Landing page Template/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- carousel -->
    <link href="Startr - Free Startup Landing page Template/css/owl.carousel.css" rel="stylesheet" type="text/css">

    <!-- responsive -->
    <link href="Startr - Free Startup Landing page Template/css/responsive.css" rel="stylesheet" type="text/css">

    <!-- font-awesome -->
    <link href="Startr - Free Startup Landing page Template/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- font-awesome -->
    <link href="Startr - Free Startup Landing page Template/css/animate.min.css" rel="stylesheet" type="text/css">
    <link href="Startr - Free Startup Landing page Template/css/popup.css" rel="stylesheet" type="text/css">

	
</head>

<body class="module-home" data-spy="scroll" data-target=".navbar">
	<!-- header -->
	<header role="header" class="header-top" id="headere-top">
 		<div class="header-fixed-wrapper" role="header-fixed">
			<div class="container">

			<!-- hgroup -->
            <hgroup class="row">

            <!-- logo -->
			<div class="col-xs-5 col-sm-2 col-md-2 col-lg-2">
				<h1><a href="#headere-top" title="PUZZLE"><img src="" alt="PUZZLE"/></a></h1>
			</div>
			<!-- logo -->
			
			<!-- nav -->
			<nav role="navigation" class="col-xs-12 col-sm-10 col-md-10 col-lg-10 navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">            
					<ul class="nav navbar-nav">			          
						<li class="active"><a href="#headere-top" title="Home">Home</a></li>
						<li><a href="#section-one" title="Overview">Overview</a></li>
						<li><a href="#section-two" title="Features">Features</a></li>
						<li><a href="#section-three" title="Pricing">Pricing</a></li>
						<li><a href="#section-four" title="Team">Team</a></li>
						<li><a href="#section-five" title="Contact">Contact</a></li>
						<li><a href="#section-six" title="Join Us">Join Us</a></li>            
					</ul>
				</div>
			</nav>
			<!-- nav -->

            </hgroup>
            <!-- hgroup -->
		
			</div>
		</div>

			<!-- banner Text --> 
			<section class="text-center">
				<h2>PUZZLE</h2>
				<p>MAKE SMART DECISIONS WITH PUZZLE!</p>	
							
				<a href="#" class="button-header" onclick="login()">Get Strated</a>
				
			</section>
			<!-- banner Text -->   

            <!-- banner image -->
        	<figure>
				<div class="parallax-window item tp-banner-container" data-parallax="scroll" data-image-src="Startr - Free Startup Landing page Template/images/bg-index.jpg"></div>
            </figure>
			<!-- banner image -->
			
	</header>
<!-- header -->

<!-- main -->
	<main role="main" id=" main-wrapper">

		<!-- section-one -->
		<section class="section-one text-center" id="section-one">
			<div class="container">
				<header role="title-page">
					<h4>What we do</h4>
					<h2>이제 더 이상 그룹웨어는 필요없습니다.</h2>
				</header>
				
				<article>
					<h3>아래 기능들도 모두 동시에 제공하기 때문입니다.</h3>
				</article>

				<!-- four boxes  -->
				<div class="row four-box-pan" role="four-box">
					<section class="col-xs-12 col-sm-6 col-md-3">
						<figure><img src="/img/board(1).png"></figure>
						<h5>문서양식 관리</h5>
						<p>Docswave에서는 수많은 문서양식을 무료로 제공하고 있으며 조직의 공동양식으로 사용할 수 있습니다. </p>
					</section>
					
					<section class="col-xs-12 col-sm-6 col-md-3">
						<figure><img src="/img/group.png"></i></figure>
						<h5>효율적인 조직관리</h5>
					</section>

					<section class="col-xs-12 col-sm-6 col-md-3">
					<figure><i class="fa fa-paper-plane" aria-hidden="true"></i></figure>
					<h5>협업게시판</h5>
					<p>공지사항 및 자유게시판이 기본으로 제공되며 추가로 3개의 게시판을 더 생성할 수 있습니다.</p>
					</section>

					<section class="col-xs-12 col-sm-6 col-md-3">
					<figure><i class="fa fa-television" aria-hidden="true"></i></figure>
					<h5>연락처 관리</h5>
					<p>조직원들은 거래처나 고객의 연락처 정보를 편리하게 관리할 수 있으며 이 정보를 조직원들과 공유할 수 있습니다.</p>
					</section>
				</div>
				<!-- four boxes -->
			
			</div>
		</section>
		<!-- section-one -->

		<!-- section-two -->
		<section class="section-two" id="section-two">

			<!-- image-content -->
			<section>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<article>
						<h2>a</h2>
						<p>b</p>
						<ul>
							<li>Docswave에서는 수많은 문서양식을 무료로 제공하고 있으며 조직의 공동양식으로 사용할 수 있습니다. </li>
							<li>조직의 직급/직책 관리, 조직도/조직원 관리를 할 수 있습니다. 조직도는 트리구조로 편리하게 구성할 수 있습니다.</li>
							<li>공지사항 및 자유게시판이 기본으로 제공되며 추가로 3개의 게시판을 더 생성할 수 있습니다.</li>
							<li>조직원들은 거래처나 고객의 연락처 정보를 편리하게 관리할 수 있으며 이 정보를 조직원들과 공유할 수 있습니다.</li>
						</ul>
					</article>
				</div>

 				<div class="col-xs-12 col-sm-6 col-md-6">
					<figure class="row" style="background-image:url('http://placehold.it/1600x800')"></figure>
				</div>
			</section>

			<!-- image-content -->
			<div class="clearfix"></div>

			<!-- image-content -->
			<section>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<figure class="row" style="background-image:url('http://placehold.it/1600x800')"></figure>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-6">
					<article>
						<h2>We even give you more than your expectation</h2>
						<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius blandit sit amet non magna. Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius blandit sit amet non magna. </p>
						<p>Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius blandit sit amet non magna. Morbi leo orta felis euismod semper.Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius.</p>
					</article>
				</div>
			</section>

			<!-- image-content -->
			<section>
			<div class="clearfix"></div>

			<!-- video -->
			<div class="video-pan text-center">
				<a id="video" class="player" data-property="{videoURL:'https://www.youtube.com/watch?v=0K-g84sK6R0',containment:'.bg-container-youtube', showControls:false,autoPlay:true, loop:true, startAt:0, opacity:1, addRaster:false, quality:'large'}"></a>

				<!-- 5.0 background container autoPlay:true,  -->
			<div class="bg-container-youtube"></div>
				<header><a class="popup-vimeo video-button" href="https://vimeo.com/45830194"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
				<h4>Video Preview Of Product</h4>
				</header>
			</div>

			<!-- video -->
			
			<!--slider pan -->
			<div class="slider-pan">
				<header role="title-page" class="text-center">
					<h4>Customer Voice</h4>
				</header>

			<!-- carousel -->
			<div id="owl-demo" class="owl-carousel text-center" role="slider">
				<section class="item">
					<article>
					Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius blandit sit <br/>
					amet non magna felis euismod leo orta felis semper.	
					</article>

					<header>
						<h5>Antony Casalena</h5>
						<h6>Vice president, IQTeam</h6>
					</header>
				</section>

				<section class="item">
					<article>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis tortor nec diam dapibus<br>efficitur in quis sem. Morbi tristique purus at vestibulum malesuada. 	
					</article>

 					<header>
						<h5>Brain Rice</h5>
						<h6>VP, Lexix Pvt Ltd</h6>
					</header>
				</section>

				<section class="item">
					<article>
					Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius blandit sit <br/>
					amet non magna felis euismod leo orta felis semper.	
					</article>
					
					<header>
						<h5>Antony Casalena</h5>
						<h6>Vice president, IQTeam</h6>
					</header>
				</section>

				<section class="item">
					<article>
					Morbi leo orta felis euismod semper.Maecenas sed diam eget risus varius blandit sit <br/>
					amet non magna felis euismod leo orta felis semper.	
					</article>

					<header>
						<h5>Antony Casalena</h5>
						<h6>Vice president, IQTeam</h6>
					</header>
				</section>

			</div>
			<!-- carousel -->
		
			</div>
			<!--slider pan -->
			</section>


            <!-- section-four -->
            <section class="section-four" id="section-four">
            	<div class="container">
            		<header role="title-page" class="text-center">
            			<h4>Meet The Team</h4>
            			<h2>Our team is passionate about bringing the <br/>best for our customers.</h2>
            		</header>

                    <!-- Team -->
                    <div class="team-pan row">
                    	<section class="col-xs-12 col-sm-6 col-md-3">
                    		<figure><img src="http://placehold.it/249x263" alt="" class=" img-responsive"/></figure>
                    		<header>
                    			<h5>Antony Casalena</h5>
                    			<h6>Vice president</h6>
                    			<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                    		 </header>
                    	</section>

                    	<section class="col-xs-12 col-sm-6 col-md-3">
                    		<figure><img src="http://placehold.it/249x263" alt="" class=" img-responsive"/></figure>
                    		<header>
                    			<h5>Anaia Doe</h5>
                    			<h6>Creative Head</h6>
                    			<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                    		</header>
                    	</section>

                        <section class="col-xs-12 col-sm-6 col-md-3">
                    		<figure><img src="http://placehold.it/249x263" alt="" class=" img-responsive"/></figure>
                    		<header>
                    			<h5>Johnathan Doe</h5>
                    			<h6>Development Lead</h6>
                    			<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    			<a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                            </header>
                        </section>

                        <section class="col-xs-12 col-sm-6 col-md-3">
                        	<figure><img src="http://placehold.it/249x263" alt="" class=" img-responsive"/></figure>
                        	<header>
                            	<h5>Julian Gulia</h5>
								<h6>Marketing Head</h6>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                            </header>
                        </section>
                    </div>
                    <!-- Team -->

            	</div>
            </section>
            <!-- section-fore -->

            <!-- section-five -->
            <section class="section-five" id="section-five">
            	<div class="container">
                	 <header role="title-page" class="text-center">
                        <h4>Newsletter Subscribe</h4>
                        <h2>Subscribe to get monthly products updates<br/>and exclusive offers</h2>
                    </header>

                    <!-- subscribe -->
                    <div class="subscribe-form">
                        <div class="ntify_form">
                            <form method="post" action="php/subscribe.php" name="subscribeform" id="subscribeform">
                                <input name="email" type="email" id="subemail" placeholder="Email Address">
                                <button type="submit" name="" value="Submit">
                                Subscribe <i class="fa fa-envelope" aria-hidden="true"></i></button>
                            </form>

                            <!-- subscribe message -->
                            <div id="mesaj"></div>
                            <!-- subscribe message --> 
                        </div>
                    </div>
                    <!-- subscribe -->

            	</div>
            </section>
            <!-- section-five -->

           <!-- footer -->
           <footer role="footer" class="footer text-center">
           		<div class="container">

                	<!-- socil-icons -->
                	<section role="socil-icons" class="socil-icons">
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                    </section>

                    <!-- socil-icons -->

                    <!-- nav -->
                    <nav role="footer-nav">
                        <a href="#">Terms of Use </a> 
                        <a href="#">Privacy Policy</a>
                    </nav>

                    <!-- nav -->
                    <p class="copy">&copy; 2016 Sartr. All rights reserved. Made with <i class="fa fa-heart pulse"></i> by <a href="http://www.designstub.com/">Designstub</a></p>
                </div>
           </footer>
           <!-- footer -->
            
        </main>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="Startr - Free Startup Landing page Template/js/jquery.min.js" type="text/javascript"></script>

	<script src="Startr - Free Startup Landing page Template/js/parallax.min.js" type="text/javascript"></script>

	<script type="text/javascript">

    	$('.parallax-window').parallax({});

    </script>

    <script src="Startr - Free Startup Landing page Template/js/main.js" type="text/javascript"></script>

	<script src="Startr - Free Startup Landing page Template/js/owl.carousel.js" type="text/javascript"></script>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script> 

	<script src="Startr - Free Startup Landing page Template/js/maps.js" type="text/javascript"></script>

    <script type="text/javascript" src="Startr - Free Startup Landing page Template/js/jquery.mb.YTPlayer.js"></script>

	<script type="text/javascript" src="Startr - Free Startup Landing page Template/js/video.js"></script>

    <script src="Startr - Free Startup Landing page Template/js/custom.js" type="text/javascript"></script>

	<script src="Startr - Free Startup Landing page Template/js/jquery.magnific-popup.min.js" type="text/javascript"></script>

	<script src="Startr - Free Startup Landing page Template/js/jquery.contact.js" type="text/javascript"></script>

    <script src="Startr - Free Startup Landing page Template/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="Startr - Free Startup Landing page Template/js/html5shiv.min.js" type="text/javascript"></script>

  </body>

</html>