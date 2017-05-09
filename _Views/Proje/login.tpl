<!-- Load Lang Files -->
{if $LANG == 'tr'}
{include file='Proje/_lang_TR.tpl' scope=parent}
{assign var='title' value='Giriş Yap | BÖTE Projeleri'}
{else}
{include file='Proje/_lang_EN.tpl' scope=parent}
{assign var='title' value='Login | CEIT Projects'}
{/if}


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>{$title}</title>

	<!-- Bootstrap -->
	<link href="../_Vendors/Proje/css/bootstrap.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="../_Vendors/Proje/css/font-awesome.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">
	<!-- Animate.css -->
	<link href="../_Vendors/Proje/animate.css/animate.min.css" rel="stylesheet">

	<!-- Custom Theme Style -->
	<link href="../_Vendors/Proje/css/custom.css" rel="stylesheet">

	<style type="text/css">

		button{
			font-size: 12px !important;
			margin: 10px 15px 0 0 !important;
		}
		.noShadow{
			text-shadow:none!important;
		}

	</style>
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a>
		<a class="hiddenanchor" id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form action="" method="POST">
					<h1>{$LOGIN_FORM_TITLE}</h1>
						{if $error == '1'}
						<p class="alert alert-danger noShadow">{$LOGIN_ERROR}</p>
						{/if}
						<div>
							<input type="email" class="form-control" placeholder="{$EMAIL_PLACEHOLDER}" required="" name="emailTxt"/>
						</div>
						<div>
							<input type="password" class="form-control" placeholder="{$PASS_PLACEHOLDER}" required="" name="passTxt"/>
						</div>
						<div>
							<button class="btn btn-default submit" type="submit" name="submitLogin">{$SUBMIT_PLACEHOLDER}</button>
							<a class="reset_pass" href="ResetPassword.php">{$LOST_PASSWORD}</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">{$R_U_NEW_USER}
								<a href="#signup" class="to_register"> {$CREATE_ACCOUNT} </a>
							</p>
							<p class="change_link well">{$GUEST_P} <br>
								<a href="Guest.php" class="btn btn-default"> {$GUEST_BTN} </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<div class="text-center">
									<a href="#signin" class="lang_button_tr"><img src="../_Vendors/tr.png" width="20"></a>
									<a href="#signin" class="lang_button_en"><img src="../_Vendors/en.png" width="20"></a>
								</div>
								<h1><i class="fa fa-cog"></i> {$BRAND_NAME}</h1>

								<p>©2017 {$RIGHTS}.<br />{$DEVELOPED_BY}.</p>
							</div>
						</div>
					</form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form action="" method="POST">
						<h1>{$REGISTER_FORM_TITLE}</h1>
						{if $error == '2'}
						<p class="alert alert-danger noShadow">{$REGISTER_ERROR}</p>
						{/if}
						{if $error == '3'}
						<p class="alert alert-danger noShadow">{$SAMEUSER_ERROR}</p>
						{/if}
						<div>
							<input type="text" class="form-control" placeholder="{$NAME_PLACEHOLDER}" required="" name="isimTxt" />
						</div>
						<div>
							<input type="email" class="form-control" placeholder="{$EMAIL_PLACEHOLDER}" required="" name="emailTxt" />
						</div>
						<div>
							<input type="password" class="form-control" placeholder="{$PASS_PLACEHOLDER}" required="" name="passTxt" />
						</div>
						<div>
							<input type="text" class="form-control" placeholder="{$SECURITY_Q_PLACEHOLDER}" required="" name="guvenlikSorusuTxt" />
						</div>
						<div>
							<input type="text" class="form-control" placeholder="{$SECURITY_A_PLACEHOLDER}" required="" name="guvenlikCevabiTxt" />
						</div>
						<div>
							<select class="form-control" placeholder="{$SELECT_TYPE_PLACEHOLDER}" required="" name="kullaniciTuruTxt">
								<option disabled="" selected="">{$SELECT_TYPE_PLACEHOLDER}</option>
								<option value="Teacher">{$TEACHER}</option>
								<option value="Student">{$STUDENT}</option>
							</select>
						</div>
						<div>
							<button type="submit" class="btn btn-default submit" type="submit" name="submitRegister">{$SUBMIT_PLACEHOLDER}</button>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">{$ALREADY_MEMBER}
								<a href="#signin" class="to_register"> {$LOGIN_FORM_TITLE} </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<div class="text-center">
									<a href="#signup" class="lang_button_tr"><img src="../_Vendors/tr.png" width="20"></a>
									<a href="#signup" class="lang_button_en"><img src="../_Vendors/en.png" width="20"></a>
								</div>
								<h1><i class="fa fa-cog"></i> {$BRAND_NAME}</h1>

								<p>©2017 {$RIGHTS}.<br />{$DEVELOPED_BY}.</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="../_Vendors/Proje/js/jquery.min.js"></script>

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


		$(".lang_button_en").click(function(){
			createCookie('Lang','en',365);
			location.reload(); 
		})

		$(".lang_button_tr").click(function(){
			createCookie('Lang','tr',365);
			location.reload(); 
		})

	</script>
</body>
</html>
