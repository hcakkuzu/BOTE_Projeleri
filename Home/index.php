<?php 

require '../_Smarty/libs/smartyHeader.php';

if(!isset($_COOKIE["Lang"])){
setcookie("Lang", "tr", time() + (86400 * 30), "/"); // 86400 = 1 day
$dil="tr";
}else{
	$dil=$_COOKIE["Lang"];
}


if(isset($dil)){
	if($dil=="tr"){
		$smarty->display('Home/index_tr.tpl');
	}
	else{
		$smarty->display('Home/index_en.tpl');
	}
}else{
	$smarty->display('Home/index_tr.tpl');
}

 ?>