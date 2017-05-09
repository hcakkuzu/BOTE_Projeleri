<?php
/**
 * Projeler ile ilgili işlemleri yapıldığı sınıf
 *
 * Date: 01.02.2017
 *
 * @author      Halil Çağrı AKKUZU (hcakkuzu)
 * @git         https://github.com/hcakkuzu
 * @version     0.1_alpha
 *
 */


# Veritabanı işlemleri için kullanılacak sınıf çağırılıyor.
require("kullanici.php");

class proje extends kullanici
{

    /**
     * @void    Verilen isim ve ogrenciID'si ile yeni bir proje oluşturur.
     *
     * @param   string $ProjeAdi
     * @param   int $OgrenciID
     * @param   string $ProjeTuru
     *
     * @return  mixed
     */
    public function ProjeOlustur($OgrenciID,$ProjeAdi,$ProjeTuru,$Baslangic,$Bitis)
    {
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $dersID=$this->db->single("SELECT DersID FROM abonelikler WHERE OgrenciID=:P_ogrenciID LIMIT 1");

        $this->db->bind("P_projeAdi",(string)$ProjeAdi);
        $this->db->bind("P_projeTuru",(string)$ProjeTuru);
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $this->db->bind("P_dersID",(int)$dersID);
        $this->db->bind("P_baslangic",$Baslangic);
        $this->db->bind("P_bitis",$Bitis);

        if($this->db->query("INSERT INTO projeler(ProjeYoneticisiID,ProjeAdi,DersID,ProjeTuru,Baslangic,Bitis) VALUES(:P_ogrenciID,:P_projeAdi,:P_dersID,:P_projeTuru,:P_baslangic,:P_bitis);")==1){
            return true;
        }else{ return false;}
    }

    
    /**
     * @void    Verilen parametrelere göre dersimi değil mi
     *
     * @param   int $ogretmenID
     * @param   int $projeID
     *
     * @return  mixed
     */
    public function DersiMi($ogretmenID,$projeID)
    {
        $this->db->bind("P_ogretmenID",(int)$ogretmenID);
        $this->db->bind("P_projeID",(int)$projeID);

       if($this->db->single("SELECT DersID FROM dersler WHERE OgretmenID=:P_ogretmenID AND DersID=(SELECT DersID FROM projeler WHERE ProjeID=:P_projeID) LIMIT 1;")>0){
        return true;
       }else{
        return false;
       }
    }
    

    /**
     * @void    verilen kişinin bir projesi var mı kontrol eder. Varsa projeID yoksa false.
     *
     * @param   int $OgrenciID
     *
     * @return  mixed
     */
    public function ProjesiVarMi($OgrenciID)
    {
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $ProjeID_Yonetici = $this->db->single("SELECT ProjeID FROM projeler WHERE ProjeYoneticisiID=:P_ogrenciID LIMIT 1;");

        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $ProjeID_Uye = $this->db->single("SELECT ProjeID FROM davetler WHERE DavetEdilenID=:P_ogrenciID AND Onay=1 LIMIT 1;");

        if($ProjeID_Yonetici>0){
            return $ProjeID_Yonetici;
        }
        else if($ProjeID_Uye>0){
            return $ProjeID_Uye;
        }else{
            return false;
        }



    }


    /**
     * @void    verilen kişi bir projeyer üye mı kontrol eder. Varsa true yoksa false.
     *
     * @param   int $OgrenciID
     *
     * @return  mixed
     */
    public function ProjeUyesiMi($OgrenciID)
    {
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);

        $ProjeID = $this->db->single("SELECT ProjeID FROM davetler WHERE DavetEdilenID=:P_ogrenciID AND Onay=1 LIMIT 1;");

        if($ProjeID>0){return $ProjeID;}else{return false;}

    }


/**
     * @void    verilen kişi bir projeyer üye mı kontrol eder. Varsa true yoksa false.
     *
     * @param   int $OgrenciID
     * @param   int $ProjeID
     *
     * @return  mixed
     */
public function BuProjeyeUyeMi($OgrenciID,$ProjeID)
{
    $this->db->bind("P_ogrenciID",(int)$OgrenciID);
    $this->db->bind("P_projeID",(int)$ProjeID);
    $ProjeYoneticisi = $this->db->single("SELECT ProjeID FROM projeler WHERE ProjeYoneticisiID=:P_ogrenciID AND ProjeID=:P_projeID LIMIT 1;");

    if($ProjeYoneticisi>0){return true;}else{
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $this->db->bind("P_projeID",(int)$ProjeID);
        $ProjeUyesi = $this->db->single("SELECT ProjeID FROM davetler WHERE DavetEdilenID=:P_ogrenciID AND ProjeID=:P_projeID AND Onay=1 LIMIT 1;");
        if($ProjeUyesi>0){return true;}else{ return false; }
    }
}


    /**
     * @void    verilen davet gecerli mı kontrol eder. Varsa true yoksa false.
     *
     * @param   int $OgrenciID
     * @param   int $DavetID
     *
     * @return  mixed
     */
    public function DavetVarMi($OgrenciID,$DavetID)
    {
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $this->db->bind("P_davetID",(int)$DavetID);

        $Davet = $this->db->single("SELECT DavetID FROM davetler WHERE DavetID=:P_davetID AND DavetEdilenID=:P_ogrenciID LIMIT 1;");

        if($Davet>0){return true;}else{return false;}

    }


    /**
     * @void    verilen davet gecerli mı kontrol eder. Varsa true yoksa false.
     *
     * @param   int $DavetID
     *
     * @return  mixed
     */
    public function DavetiKabulEt($DavetID)
    {
        $this->db->bind("P_davetID",(int)$DavetID);

        $Davet = $this->db->query("UPDATE davetler SET Onay=1 WHERE DavetID=:P_davetID;");

        if($Davet>0){return true;}else{return false;}

    }


    /**
     * @void    verilen davet gecerli mı kontrol eder. Varsa true yoksa false.
     *
     * @param   int $DavetID
     *
     * @return  mixed
     */
    public function ProjeDuzenle($projeID,$projeAdi,$projeTuru,$projeAciklama,$baslangic,$bitis)
    {
        $this->db->bind("P_projeID",(int)$projeID);
        $this->db->bind("P_projeAdi",(string)$projeAdi);
        $this->db->bind("P_projeTuru",(string)$projeTuru);
        $this->db->bind("P_projeAciklama",(string)$projeAciklama);
        $this->db->bind("P_baslangic",$baslangic);
        $this->db->bind("P_bitis",$bitis);


        $proje = $this->db->query("UPDATE projeler SET ProjeAdi=:P_projeAdi,ProjeTuru=:P_projeTuru,Aciklama=:P_projeAciklama,Baslangic=:P_baslangic,Bitis=:P_bitis WHERE ProjeID=:P_projeID;");

        if($proje>0){return true;}else{return false;}

    }


    /**
     * @void    verilen daveti siler.
     *
     * @param   int $DavetID
     *
     * @return  mixed
     */
    public function DavetSil($DavetID)
    {
        $this->db->bind("P_davetID",(int)$DavetID);

        $Davet = $this->db->query("DELETE FROM davetler WHERE DavetID=:P_davetID;");

        if($Davet>0){return true;}else{return false;}

    }


    /**
     * @void    verilen kişinin bir projesi var mı kontrol eder. Varsa projeID yoksa false.
     *
     * @param   int $OgrenciID
     *
     * @return  mixed
     */
    public function DavetGonder($OgrenciID,$ProjeID)
    {
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);
        $this->db->bind("P_projeID",(int)$ProjeID);

        $row=$this->db->row("SELECT * FROM davetler WHERE ProjeID=:P_projeID AND DavetEdilenID=:P_ogrenciID LIMIT 1;");

        if(empty($row)){
            $this->db->bind("P_ogrenciID",(int)$OgrenciID);
            $this->db->bind("P_projeID",(int)$ProjeID);
            if($this->db->query("INSERT INTO davetler(ProjeID,DavetEdilenID) VALUES(:P_projeID,:P_ogrenciID);")==1){
                return true;
            }else{ return false;}
        }else{
            return true;
        }

        

    }


    /**
     * @void    Verilen ogrenciID nin aboneliği varsa true dondurur
     *
     * @param   int $OgrenciID
     *
     * @return  mixed
     */
    public function AboneOlmusMu($OgrenciID)
    {
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);

        $row = $this->db->row("SELECT * FROM abonelikler WHERE OgrenciID=:P_ogrenciID LIMIT 1");

        if(empty($row)){
            return false;
        }else{
            return true;
        }
    }




    

}

?>