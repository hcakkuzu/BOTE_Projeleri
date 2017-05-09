<?php 



require '../_Smarty/libs/smartyHeader.php';

include_once '../_Classes/admin.php';

$admin = new Admin();



if(isset($_POST['submitLogin'])){

	if($admin->GirisYap($_POST['emailTxt'],$_POST['passTxt'])==true){

		$admin->Yonlendir("Admin.php");

	}else{

		$smarty->assign("error", "1");

	}

}



$smarty->display('Admin/index.tpl');

 ?>