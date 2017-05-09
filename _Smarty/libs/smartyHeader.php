<?php 


require 'SmartyBC.class.php';

$smarty = new SmartyBC;

$smarty->caching = true;
$smarty->cache_lifetime = 1;
$smarty->template_dir="../_Views";
$smarty->compile_dir="../_Views_c";


 ?>