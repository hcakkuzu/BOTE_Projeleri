<?php
/**
 * Dersler ile ilgili işlemleri yapıldığı sınıf
 *
 * Date: 01.16.2017
 *
 * @author      Halil Çağrı AKKUZU (hcakkuzu)
 * @git         https://github.com/hcakkuzu
 * @version     0.1_alpha
 *
 */


# Veritabanı işlemleri için kullanılacak sınıf çağırılıyor.
require("kullanici.php");

class dersler extends kullanici
{
   
    /**
     * @void    Verilen isim ve ogretmenID'si ile yeni bir ders oluşturur.
     *
     * @param   string $DersAdi
     * @param   string $univ
     * @param   int $OgretmenID
     *
     * @return  mixed
     */
    public function DersOlustur($DersAdi,$univ,$OgretmenID)
    {
        $this->db->bind("P_dersAdi",(string)$DersAdi);
        $this->db->bind("P_univ",(string)$univ);
        $this->db->bind("P_ogretmenID",(int)$OgretmenID);
        $Kod=substr(uniqid('', true), -5);
        $this->db->bind("P_kod",(string)$Kod);
       if($this->db->query("INSERT INTO dersler(DersAdi,OgretmenID,Kod,DersUniversite) VALUES(:P_dersAdi,:P_ogretmenID,:P_kod,:P_univ);")==1){
                return $Kod;
        }else{ return false;}
    }

    /**
     * @void    Verilen isim ve ogretmenID'si ile yeni bir ders oluşturur.
     *
     * @param   int $OgretmenID
     *
     * @return  mixed
     */
    public function DersiVarMi($OgretmenID)
    {

        $this->db->bind("P_ogretmenID",(int)$OgretmenID);
        if($this->db->single("SELECT DersID From dersler WHERE OgretmenID=:P_ogretmenID LIMIT 1;")>0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * @void    Verilen ID'ye göre dersi siler
     *
     * @param   int $OgretmenID
     *
     * @return  mixed
     */
    public function DersSil($DersID)
    {
        $this->db->bind("P_dersID",(int)$DersID);
       if($this->db->query("DELETE FROM dersler WHERE DersID=:P_dersID;")==1){
                return true;
        }else{ return false;}
    }


    /**
     * @void    Verilen parametrelere göre dersi düzenler.
     *
     * @param   int $dersID
     * @param   string $dersAdi
     * @param   string $dersAciklama
     * @param   int $dersStatus
     *
     * @return  mixed
     */
    public function DersDuzenle($dersID,$dersAdi,$dersAciklama,$dersStatus)
    {
        $this->db->bind("P_dersID",(int)$dersID);
        $this->db->bind("P_dersAdi",(string)$dersAdi);
        $this->db->bind("P_dersAciklama",(string)$dersAciklama);
        $this->db->bind("P_dersStatus",(string)$dersStatus);
       if($this->db->query("UPDATE dersler SET DersAdi=:P_dersAdi,Aciklama=:P_dersAciklama,Aktif=:P_dersStatus WHERE DersID=:P_dersID;")==1){
                return true;
        }else{ return false;}
    }
    

    


    /**
     * @void    Verilen isim ve ogretmenID'si ile yeni bir ders oluşturur.
     *
     * @param   string $SubCode
     * @param   int $OgrenciID
     *
     * @return  mixed
     */
    public function DerseAboneOl($OgrenciID,$subCode)
    {
        $this->db->bind("P_subCode",(string)$subCode);

        //koda ait ve aktif olan ders varmı kontrol et
        //varsa o derse ait abonelik oluştur ve dersin adını döndür
        //yoksa false döndür

        $row = $this->db->row("SELECT * FROM dersler WHERE Kod=:P_subCode AND Aktif=1 LIMIT 1");
            
            if(empty($row)){
                return false;
            }else{
                $this->db->bind("P_ogrenciID",(int)$OgrenciID);
                $this->db->bind("P_dersID",(int)$row['DersID']);
                if($this->db->query("INSERT INTO abonelikler(DersID,OgrenciID) VALUES(:P_dersID,:P_ogrenciID);")==1){
                    return $row['DersAdi'];
                }else{ return false;}
            }
    }

    /**
     * @void    Verilen isim ve ogretmenID'si ile yeni bir ders oluşturur.
     *
     * @param   int $DersID
     * @param   int $OgrenciID
     *
     * @return  mixed
     */
    public function AboneliktenCik($OgrenciID,$DersID)
    {
        $this->db->bind("P_dersID",(int)$DersID);
        $this->db->bind("P_ogrenciID",(int)$OgrenciID);

        $row = $this->db->row("DELETE FROM abonelikler WHERE OgrenciID=:P_ogrenciID AND DersID=:P_dersID");
            
            if(empty($row)){
                return false;
            }else{
               return true;
            }
    }




    




}

?>