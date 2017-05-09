<?php 

require '../_Smarty/libs/smartyHeader.php';

include_once '../_Classes/admin.php';

$admin = new Admin();


if(!$admin->GecerliOturum()){

	header("Location:index.php");

	exit();

}



$smarty->display('Admin/admin.tpl');

 ?>