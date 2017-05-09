<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="BÖTE Projeleri, proje geliştirme ve BÖTE projeleri için bir web sitesidir. Bu site ile Proje Geliştirme'yi görüntüleyebilir, yönetebilir ve öğrenebilirsiniz." />	
	<meta name="keywords" content="böte projeleri,proje,böte" />
	<meta name="author" content="hcakkuzu" />

	<title>{block name="title"}{/block}</title>
	<!-- Bootstrap -->
	<link href="../_Vendors/Proje/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="../_Vendors/Proje/css/font-awesome.css" rel="stylesheet">
	<!-- jQuery custom content scroller -->
    <link href="../_Vendors/Proje/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	{block name="head"}{/block}

	<!-- Custom Theme Style -->
	<link href="../_Vendors/Proje/css/custom.css" rel="stylesheet">
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col menu_fixed">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.php" class="site_title"><i class="fa fa-cogs"></i> <span>{$BRAND_NAME}</span></a>
					</div>

					<div class="clearfix"></div>
					<div class="text-center" style="margin-bottom: -20px !important;">
						<a href="#" id="lang_button_tr"><img src="../_Vendors/tr.png" width="20"></a>
						<a href="#" id="lang_button_en"><img src="../_Vendors/en.png" width="20"></a>
					</div>
					
					<!-- menu profile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img src="../_Vendors/Proje/images/{$KullaniciProfilFoto}?{php}echo time();{/php}" alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>{$WELCOME},</span>
							<h2>{$Name}</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>{$MENU_1}</h3>
							<ul class="nav side-menu">
								<li><a href="Dashboard.php"><i class="fa fa-home"></i> {$MENU_HOME}</a></li>
								{if $KullaniciTuru=="Student"}
								<li><a href="ProjectProposal.php"><i class="fa fa-cog"></i> {$MENU_MYPROJECT}</a></li>
								<!--<li><a href="ProjectDetails.php"><i class="fa fa-cog"></i> {$MENU_MYPROJECT}</a></li>-->

								<li><a href="MyLectures.php"><i class="fa fa-book"></i> {$MENU_MYLECTURES}</a></li>
								{/if}
								{if $KullaniciTuru=="Teacher"}
								<li><a href="Projects.php"><i class="fa fa-cogs"></i> {$MENU_PROJECTS}</a></li>
								<li><a href="Lectures.php"><i class="fa fa-book"></i> {$MENU_LECTURES}</a></li>
								{/if}
								
								<li><a href="Contacts.php"><i class="fa fa-address-book"></i> {$MENU_CONTACTS}</a></li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>{$MENU_2}</h3>
							<ul class="nav side-menu">
								<li><a href="ProjectDatabase.php"><i class="fa fa-database"></i> {$MENU_DATABASE}</a></li>
								<li><a href="Instructions.php"><i class="fa fa-file"></i> {$MENU_INSTRUCTION}</a></li>              
								</ul>
							</div>

						</div>
						<!-- /sidebar menu -->

						<!-- /menu footer buttons -->
						<div class="sidebar-footer hidden-small">
							<a href="MyProfile.php" data-toggle="tooltip" data-placement="top" title="{$MENU_SETTINGS}">
								<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
							</a>
							<a data-toggle="tooltip" data-placement="top" title="{$MENU_FULLSCREEN}" onclick="toggleFullScreen(document.body)" href="#">
								<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
							</a>
							<a href="#" onclick="window.open('/Proje/Faq.php', 'newwindow', 'width=600, height=750'); return false;" data-toggle="tooltip" data-placement="top" title="{$MENU_FAQ}">
								<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
							</a>
							<a href="Logout.php" data-toggle="tooltip" data-placement="top" title="{$MENU_LOGOUT}">
								<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
							</a>
						</div>
						<!-- /menu footer buttons -->
					</div>
				</div>

				<!-- top navigation -->
				<div class="top_nav">
					<div class="nav_menu">
						<nav>
							<div class="nav toggle">
								<a id="menu_toggle"><i class="fa fa-bars"></i></a>
							</div>

							<ul class="nav navbar-nav navbar-right">
								<li class="">
									<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										<img src="../_Vendors/Proje/images/{$KullaniciProfilFoto}?{php}echo time();{/php}" alt="">{$Name}
										<span class=" fa fa-angle-down"></span>
									</a>
									<ul class="dropdown-menu dropdown-usermenu pull-right">
										<li><a href="MyProfile.php"> {$MENU_PROFILE}</a></li>
										<li><a href="#" onclick="window.open('/Proje/Faq.php', 'newwindow', 'width=600, height=750'); return false;">{$MENU_HELP}</a></li>
										<li><a href="ChangePass.php"> Parola Değiştir</a></li>
										<li><a href="Logout.php"><i class="fa fa-sign-out pull-right"></i> {$MENU_LOGOUT}</a></li>
									</ul>
								</li>

							</ul>
						</nav>
					</div>
				</div>
				<!-- /top navigation -->
				

				<!-- page content -->
				{block name="body"}{/block}
				<!-- /page content -->


				<!-- footer content -->
				<footer>
					<div class="pull-right">
						<small style="font-size:8px;">{$DEVELOPED_BY}</small>
					</div>
					<div class="clearfix"></div>
				</footer>
				<!-- /footer content -->
			</div>
		</div>

		<!-- jQuery -->
		<script src="../_Vendors/Proje/js/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="../_Vendors/Proje/js/bootstrap.min.js"></script>
		<script src="../_Vendors/Proje/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

		{block name="footer"}{/block}

		<!-- Custom Theme Scripts -->
		<script src="../_Vendors/Proje/js/custom.js"></script>

		
		{block name="customJs"}{/block}

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

		</script>

		<script type="text/javascript">
			function toggleFullScreen(elem) {
    // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
    if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
        if (elem.requestFullScreen) {
            elem.requestFullScreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.webkitRequestFullScreen) {
            elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        } else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        } else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
    }
}
		</script>

</body>
</html>