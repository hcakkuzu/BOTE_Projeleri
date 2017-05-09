<?php

//Photo resize
function resize_image($file, $w, $h,$tip, $crop=FALSE) {
    list($width, $height) = getimagesize($file);
    $r = $width / $height;
    if ($crop) {
        if ($width > $height) {
            $width = ceil($width-($width*abs($r-$w/$h)));
        } else {
            $height = ceil($height-($height*abs($r-$w/$h)));
        }
        $newwidth = $w;
        $newheight = $h;
    } else {
       /* if ($w/$h > $r) {
            $newwidth = $h*$r;
            $newheight = $h;
        } else {
            $newheight = $w/$r;
            $newwidth = $w;
        }*/
        $newwidth=$w;
        $newheight=$h;
    }
    switch($tip){

        case "png":{
            $src = imagecreatefrompng($file);
            $dst = imagecreatetruecolor($newwidth, $newheight);
            imagecopyresampled($dst, $src, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
            imagepng($dst,$file);
            break;
        }
        case "jpg":{
            $src = imagecreatefromjpeg($file);
            $dst = imagecreatetruecolor($newwidth, $newheight);
            imagecopyresampled($dst, $src, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
            imagejpeg($dst,$file);
            break;
        }
        case "jpeg":{
            $src = imagecreatefromjpeg($file);
            $dst = imagecreatetruecolor($newwidth, $newheight);
            imagecopyresampled($dst, $src, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
            imagejpeg($dst,$file);
            break;
        }
        case "gif":{
            $src = imagecreatefromgif($file);
            $dst = imagecreatetruecolor($newwidth, $newheight);
            imagecopyresampled($dst, $src, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
            imagegif($dst,$file);
            break;
        }
    }
    imagedestroy($dst);
    
}
//photo resize


require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

if(isset($_POST['submit'])){

    if($_FILES["profilFoto"]["error"] > 0){
    echo "Error: " . $_FILES["profilFoto"]["error"] . "<br>";
} else{
    
    $target_dir = "../_Vendors/Proje/images/";
    $target_file = $target_dir . basename($_FILES["profilFoto"]["name"]);
    $uploadOk = 1;
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
    $target_file = $target_dir . $kullanici->GecerliKullaniciID().".$imageFileType";

    $check = getimagesize($_FILES["profilFoto"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }

// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["profilFoto"]["tmp_name"], $target_file)) {
        resize_image($target_file, 200, 200,$imageFileType);
        //echo "The file ". basename( $_FILES["profilFoto"]["name"]). " has been uploaded.";

        $kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());
        $kullanici->db->bind("P_foto",$kullanici->GecerliKullaniciID().".$imageFileType");
	    $kullanici->db->query("UPDATE kullanicilar SET ProfilFoto=:P_foto WHERE KullaniciID=:P_kullaniciID");
	
        $kullanici->Yonlendir('Profile.php?id='.$kullanici->GecerliKullaniciID());
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

}

}
?>