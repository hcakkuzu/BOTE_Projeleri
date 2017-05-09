<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
<style type="text/css">
	
	.to-animate,
	.to-animate-2,
	.single-animate{
			opacity:0;
		}

</style>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>{block name=PAGE_TITLE}Başlıksız{/block}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="BÖTE Projeleri, proje geliştirme ve BÖTE projeleri için bir web sitesidir. Bu site ile Proje Geliştirme'yi görüntüleyebilir, yönetebilir ve öğrenebilirsiniz." />	
	<meta name="keywords" content="böte projeleri,proje,böte" />
	<meta name="author" content="hcakkuzu" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="../_Vendors/Home/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../_Vendors/Home/css/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="../_Vendors/Home/css/simple-line-icons.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="../_Vendors/Home/css/owl.carousel.min.css">
	<link rel="stylesheet" href="../_Vendors/Home/css/owl.theme.default.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../_Vendors/Home/css/bootstrap.css">

	<link rel="stylesheet" href="../_Vendors/Home/css/blue.css?v3">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<!-- Modernizr JS -->
	<script src="../_Vendors/Home/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body lang="tr">
		<header role="banner" id="fh5co-header">
		<div class="container">
			<!-- <div class="row"> -->
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<!-- Mobile Toggle Menu Button -->
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
					<a class="navbar-brand" href="index.php"><span class="icon-cogs">
						
					</span>
					{block name=PAGE_TITLE}{/block}</a> 
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="#" data-nav-section="home"><span>{block name=HOME_LINK}{/block}</span></a></li>
						<li><a href="#" data-nav-section="about"><span>{block name=ABOUT_LINK}{/block}</span></a></li>
						<li><a href="#" data-nav-section="features"><span>{block name=FEATURES_LINK}{/block}</span></a></li>
						<li><a href="#" data-nav-section="services"><span>{block name=SERVICES_LINK}{/block}</span></a></li>
						<li><a href="#" id="lang_button_tr"><span><img src="../_Vendors/tr.png" width="25" alt="TR"></span></a></li>
						<li><a href="#" id="lang_button_en"><span><img src="../_Vendors/en.png" width="25" alt="EN"></span></a></li>
					</ul>
				</div>
			</nav>
			<!-- </div> -->
		</div>
	</header>

	<div id="slider" data-section="home">
		<div class="owl-carousel owl-carousel-fullwidth">
			<!-- You may change the background color here. -->
			<div class="item" style="background: #352f44;">
				<div class="container" style="position: relative;">
					<div class="row">
						<div class="col-md-7 col-sm-7">
							<div class="fh5co-owl-text-wrap">
								<div class="fh5co-owl-text">
									<h1 class="fh5co-lead to-animate">{block name=PROJECT_DATABASE}{/block}</h1>
									<h2 class="fh5co-sub-lead to-animate">{block name=PROJECT_DATABASE_DESC}{/block}</h2>
									<p class="to-animate-2"><a href="../Proje" class="btn btn-primary btn-lg">{block name=PROJECT_DATABASE_BUTTON}{/block}</a></p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-md-push-1 col-sm-4 col-sm-push-1 iphone-image">
							<div class="iphone to-animate-2"><img src="../_Vendors/Home/images/iphone-3.png" alt="Veritabanı"></div>
						</div>

					</div>
				</div>
			</div>
			<!-- You may change the background color here.  -->
			<div class="item" style="background: #38569f;">
				<div class="container" style="position: relative;">
					<div class="row">
						<div class="col-md-7 col-md-push-1 col-md-push-5 col-sm-7 col-sm-push-1 col-sm-push-5">
							<div class="fh5co-owl-text-wrap">
								<div class="fh5co-owl-text">
									<h1 class="fh5co-lead to-animate">{block name=PROJECT_INSTRUCTION}{/block}</h1>
									<h2 class="fh5co-sub-lead to-animate">{block name=PROJECT_INSTRUCTION_DESC}{/block}</h2>
									<p class="to-animate-2"><a href="../Proje" class="btn btn-primary btn-lg" style="white-space:normal !important;word-wrap:break-word; ">{block name=PROJECT_INSTRUCTION_BUTTON}{/block}</a></p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-md-pull-7 col-sm-4 col-sm-pull-7 iphone-image">
							<div class="iphone to-animate-2"><img class="img-responsive" src="../_Vendors/Home/images/iphone-4.png" alt="Eğitim"></div>
						</div>

					</div>
				</div>
			</div>

			<div class="item" style="background-image:url(../_Vendors/Home/images/slide_5.jpg)">
				<div class="overlay"></div>
				<div class="container" style="position: relative;">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="fh5co-owl-text-wrap">
								<div class="fh5co-owl-text">
									<h1 class="fh5co-lead to-animate">{block name=PROJECT_MANAGEMENT}{/block}</h1>
									<h2 class="fh5co-sub-lead to-animate">{block name=PROJECT_MANAGEMENT_DESC}{/block}</h2>
									<p class="to-animate-2"><a href="../Proje" target="_blank" class="btn btn-primary btn-lg">{block name=PROJECT_MANAGEMENT_BUTTON}{/block}</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<div id="fh5co-about-us" data-section="about">
		<div class="container">
			<div class="row row-bottom-padded-lg" id="about-us">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">{block name=WHAT_IS_THIS}{/block}</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>{block name=WHAT_IS_THIS_DESC}{/block}</h3>
						</div>
					</div>
				</div>
				<div class="col-md-8 to-animate">
					<video width="100%" controls>
  <source src="video.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>
				</div>
				<div class="col-md-4 to-animate">
					<h2>{block name=WHAT_DOES_IT_DO}{/block}</h2>
					<p>{block name=WHAT_DOES_IT_DO_DATABASE}{/block}</p>
					<p>{block name=WHAT_DOES_IT_DO_INSTRUCTION}{/block}</p>
					<p>{block name=WHAT_DOES_IT_DO_MANAGEMENT}{/block}</p>
				</div>
			</div>
			<div class="row" id="team">
				<div class="col-md-12 section-heading text-center to-animate">
					<h2>{block name=TEAM}{/block}</h2>
				</div>
				<div class="col-md-12">
					<div class="row row-bottom-padded-lg">
						<div class="col-md-3 text-center to-animate">
							<div class="person">
								<img src="../_Vendors/Home/images/{block name=TEAM1_IMAGE}{/block}?{$smarty.now|date_format:'%H%M%S'}" class="img-responsive img-rounded" alt="Person">
								<h3 class="name">{block name=TEAM1_NAME}{/block}</h3>
								<div class="position">{block name=TEAM1_PROFESSION}{/block}</div>
								<p>{block name=TEAM1_PROFESSION_DESC}{/block}</p>
								<ul class="social social-circle">
									<li><a href="{block name=TEAM1_TWITTER}{/block}"><i class="fa fa-twitter"></i></a></li>
									<li><a href="{block name=TEAM1_LINKEDIN}{/block}"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="{block name=TEAM1_INSTAGRAM}{/block}"><i class="fa fa-instagram"></i></a></li>
									<li><a href="{block name=TEAM1_GITHUB}{/block}"><i class="fa fa-github"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-3 text-center to-animate">
							<div class="person">
								<img src="../_Vendors/Home/images/{block name=TEAM2_IMAGE}{/block}?{$smarty.now|date_format:'%H%M%S'}" class="img-responsive img-rounded" alt="Person">
								<h3 class="name">{block name=TEAM2_NAME}{/block}</h3>
								<div class="position">{block name=TEAM2_PROFESSION}{/block}</div>
								<p>{block name=TEAM2_PROFESSION_DESC}{/block}</p>
								<ul class="social social-circle">
									<li><a href="{block name=TEAM2_TWITTER}{/block}"><i class="fa fa-twitter"></i></a></li>
									<li><a href="{block name=TEAM2_LINKEDIN}{/block}"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="{block name=TEAM2_INSTAGRAM}{/block}"><i class="fa fa-instagram"></i></a></li>
									<li><a href="{block name=TEAM2_GITHUB}{/block}"><i class="fa fa-github"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-3 text-center to-animate">
							<div class="person">
								<img src="../_Vendors/Home/images/{block name=TEAM3_IMAGE}{/block}?{$smarty.now|date_format:'%H%M%S'}" class="img-responsive img-rounded" alt="Person">
								<h3 class="name">{block name=TEAM3_NAME}{/block}</h3>
								<div class="position">{block name=TEAM3_PROFESSION}{/block}</div>
								<p>{block name=TEAM3_PROFESSION_DESC}{/block}</p>
								<ul class="social social-circle">
									<li><a href="{block name=TEAM3_TWITTER}{/block}"><i class="fa fa-twitter"></i></a></li>
									<li><a href="{block name=TEAM3_LINKEDIN}{/block}"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="{block name=TEAM3_INSTAGRAM}{/block}"><i class="fa fa-instagram"></i></a></li>
									<li><a href="{block name=TEAM3_GITHUB}{/block}"><i class="fa fa-github"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-3 text-center to-animate">
							<div class="person">
								<img src="../_Vendors/Home/images/{block name=TEAM4_IMAGE}{/block}?{$smarty.now|date_format:'%H%M%S'}" class="img-responsive img-rounded" alt="Person">
								<h3 class="name">{block name=TEAM4_NAME}{/block}</h3>
								<div class="position">{block name=TEAM4_PROFESSION}{/block}</div>
								<p>{block name=TEAM4_PROFESSION_DESC}{/block}</p>
								<ul class="social social-circle">
									<li><a href="{block name=TEAM4_TWITTER}{/block}"><i class="fa fa-twitter"></i></a></li>
									<li><a href="{block name=TEAM4_LINKEDIN}{/block}"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="{block name=TEAM4_INSTAGRAM}{/block}"><i class="fa fa-instagram"></i></a></li>
									<li><a href="{block name=TEAM4_GITHUB}{/block}"><i class="fa fa-github"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="fh5co-our-services" data-section="features">
		<div class="container">
			<div class="row row-bottom-padded-sm">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">{block name=FEATURES}{/block}</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>{block name=FEATURES_DESC}{/block}</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="box to-animate">
						<div class="icon colored-1"><span><i class="fa fa-money" aria-hidden="true"></i>
</span></div>
						<h3>{block name=FEATURE1_TITLE}{/block}</h3>
						<p>{block name=FEATURE1_DESC}{/block}</p>
					</div>
					<div class="box to-animate">
						<div class="icon colored-4"><span><i class="icon-heart"></i></span></div>
						<h3>{block name=FEATURE2_TITLE}{/block}</h3>
						<p>{block name=FEATURE2_DESC}{/block}</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box to-animate">
						<div class="icon colored-2"><span><i class="fa fa-mobile" aria-hidden="true"></i>
</span></div>
						<h3>{block name=FEATURE3_TITLE}{/block}</h3>
						<p>{block name=FEATURE3_DESC}{/block}</p>
					</div>
					<div class="box to-animate">
						<div class="icon colored-5"><span><i class="icon-rocket"></i></span></div>
						<h3>{block name=FEATURE4_TITLE}{/block}</h3>
						<p>{block name=FEATURE4_DESC}{/block}</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box to-animate">
						<div class="icon colored-3"><span><i class="icon-eye"></i></span></div>
						<h3>{block name=FEATURE5_TITLE}{/block}</h3>
						<p>{block name=FEATURE5_DESC}{/block}</p>
					</div>
					<div class="box to-animate">
						<div class="icon colored-6"><span><i class="icon-user"></i></span></div>
						<h3>{block name=FEATURE6_TITLE}{/block}</h3>
						<p>{block name=FEATURE6_DESC}{/block}</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-press" data-section="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">{block name=SERVICES}{/block}</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
							<h3>{block name=SERVICES_DESC}{/block}</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- Press Item -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(../_Vendors/Home/images/service1.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">{block name=SERVICE1_TITLE}{/block} <span class="fh5co-border"></span></h3>
							<p>{block name=SERVICE1_DESC}{/block}</p>
							<p><a href="../Proje" class="btn btn-primary btn-sm">{block name=SERVICE_MORE}{/block}</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>

				<div class="col-md-12">
					<!-- Press Item -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(../_Vendors/Home/images/service2.png)">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">{block name=SERVICE2_TITLE}{/block} <span class="fh5co-border"></span></h3>
							<p>{block name=SERVICE2_DESC}{/block}</p>
							<p><a href="../Proje" class="btn btn-primary btn-sm">{block name=SERVICE_MORE}{/block}</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>
				
				<div class="col-md-12">
					<!-- Press Item -->
					<div class="fh5co-press-item to-animate">
						<div class="fh5co-press-img" style="background-image: url(../_Vendors/Home/images/service3.png);">
						</div>
						<div class="fh5co-press-text">
							<h3 class="h2 fh5co-press-title">{block name=SERVICE3_TITLE}{/block} <span class="fh5co-border"></span></h3>
							<p>{block name=SERVICE3_DESC}{/block}</p>
							<p><a href="../Proje" class="btn btn-primary btn-sm">{block name=SERVICE_MORE}{/block}</a></p>
						</div>
					</div>
					<!-- Press Item -->
				</div>


			</div>
		</div>
	</div>
<footer id="footer" role="contentinfo">
		<div class="container">
			<div class="row row-bottom-padded-sm">
				<div class="col-md-12">
					<p class="copyright text-center">&copy; 2017 <a href="index.php">{block name=PAGE_TITLE}{/block}</a>. {block name=RIGHTS}{/block} <br> Developed by Halil Çağrı AKKUZU</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<small><a href="../sitemap.html" target="_blank">Sitemap</a></small>
				</div>
			</div>
		</div>
	</footer>

	
	<!-- jQuery -->
	<script src="../_Vendors/Home/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../_Vendors/Home/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../_Vendors/Home/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../_Vendors/Home/js/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel -->
	<script src="../_Vendors/Home/js/owl.carousel.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="../_Vendors/Home/js/main.js"></script>

	<script type="text/javascript">
		function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        var expires = "; expires=" + date.toUTCString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}


	$("#lang_button_en").click(function(){
		createCookie('Lang','en',365);
		location.reload(); 
	})

	$("#lang_button_tr").click(function(){
		createCookie('Lang','tr',365);
		location.reload(); 
	})
	
	$(document).ready(function() {
            // Get media - with autoplay disabled (audio or video)
            var media = $('video').not("[autoplay='autoplay']");
            var tolerancePixel = 40;

            function checkMedia(){
                // Get current browser top and bottom
                var scrollTop = $(window).scrollTop() + tolerancePixel;
                var scrollBottom = $(window).scrollTop() + $(window).height() - tolerancePixel;

                media.each(function(index, el) {
                    var yTopMedia = $(this).offset().top;
                    var yBottomMedia = $(this).height() + yTopMedia;

                    if(scrollTop < yBottomMedia && scrollBottom > yTopMedia){ //view explaination in `In brief` section above
                        $(this).get(0).play();
                    } else {
                        $(this).get(0).pause();
                    }
                });

                //}
            }
            $(document).on('scroll', checkMedia);
        });

	</script>

</body>
</html>
