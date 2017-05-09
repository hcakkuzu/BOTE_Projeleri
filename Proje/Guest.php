<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();




//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/guest.tpl');
 ?>