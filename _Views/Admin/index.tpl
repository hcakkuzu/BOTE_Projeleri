
{assign var='title' value='Admin Paneli'}


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

					

					<h1>Admin Girişi</h1>


						<form action="" method="POST">
						<div>

							<input type="email" class="form-control" placeholder="Admin Mail" required="" name="emailTxt"/>

						</div>

						<div>

							<input type="password" class="form-control" placeholder="Admin Parola" required="" name="passTxt"/>

						</div>

						<div>

							<button class="btn btn-default submit" type="submit" name="submitLogin">Giriş Yap</button>


						</div>
						</form>

						



							<div>


								<h1><i class="fa fa-cog"></i> BÖTE Projeleri</h1>



								<p>©2017 Tüm Hakları Saklıdır.<br />Halil Çağrı AKKUZU Tarafından geliştirilmiştir.</p>

							</div>

						</div>

					

				</section>

			</div>



			

		</div>

	</div>

	<!-- jQuery -->

	<script src="../_Vendors/Proje/js/jquery.min.js"></script>


</body>

</html>

