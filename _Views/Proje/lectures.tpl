{extends file='Proje/_layout.tpl'}
<!-- Index File -->

<!-- Load Lang Files -->
{if $LANG == 'tr'}
{include file='Proje/_lang_TR.tpl' scope=parent}
{block name="title"}Dersim | BÖTE Projeleri{/block}
{else}
{include file='Proje/_lang_EN.tpl' scope=parent}
{block name="title"}My Lecture | CEIT Projects{/block}
{/if}


{block name="head"}
<!-- NProgress -->
<link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet">
{/block}

{block name="body"}
<!-- page content -->

<div class="right_col" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>{$MENU_MYLECTURES}</h3>
      </div>
    </div>
    
    <div class="clearfix"></div>

    <div class="row">
      <div class="col-md-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>{$MENU_MYLECTURES}</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
              {if {$dersim.ders}=='var'}
                <li><a class="" data-toggle="modal" data-target=".editLecture" onclick="dersDuzenleGoster({$dersim.DersID})"><i class="fa fa-plus"></i> {$LECT_EDIT}</a></li>
                {else}
                <li><a class="" data-toggle="modal" data-target=".createLecture"><i class="fa fa-plus"></i> {$LECT_CREATE}</a></li>
                {/if}
              

            </ul>
            <div class="clearfix"></div>
          </div>
          <div class="x_content">

           <div class="modal fade createLecture" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">{$LECT_CREATE}</h4>
                </div>
                <div class="modal-body">



                  <p>{$LECT_CREATE_NEW}</p><p><i>
                  *{$LECT_CREATE_NEW_2}</i>
                </p>
                <form onsubmit="return false;" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                  <div class="form-group" id="giris">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$LECT_NAME}
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" id="dersAdiTxt" placeholder="{$LECT_NAME_PLCHOLDER}" required="required" class="form-control col-md-7 col-xs-12">
                    </div>
                  </div>
                  <div class="form-group" id="giris">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROF_UNIV}
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                      <select id="universiteTxt" class="form-control">      
                    <option value="" disabled>{$PROF_SELECT}</option>
                    <option value="Abant İzzet Baysal Üniversitesi">Abant İzzet Baysal Üniversitesi</option>
                    <option value="Abdullah Gül Üniversitesi">Abdullah Gül Üniversitesi</option>
                    <option value="Acıbadem Üniversitesi">Acıbadem Üniversitesi</option>
                    <option value="Adana Bilim ve Teknoloji Üniversitesi">Adana Bilim ve Teknoloji Üniversitesi</option>
                    <option value="Adnan Menderes Üniversitesi">Adnan Menderes Üniversitesi</option>
                    <option value="Adıyaman Üniversitesi">Adıyaman Üniversitesi</option>
                    <option value="Afyon Kocatepe Üniversitesi">Afyon Kocatepe Üniversitesi</option>
                    <option value="Ahi Evran Üniversitesi">Ahi Evran Üniversitesi</option>
                    <option value="Akdeniz Üniversitesi">Akdeniz Üniversitesi</option>
                    <option value="Akev Üniversitesi">Akev Üniversitesi</option>
                    <option value="Aksaray Üniversitesi">Aksaray Üniversitesi</option>
                    <option value="Alanya Alaaddin Keykubat Üniversitesi">Alanya Alaaddin Keykubat Üniversitesi</option>
                    <option value="Alanya Hamdullah Emin Paşa Üniversitesi">Alanya Hamdullah Emin Paşa Üniversitesi</option>
                    <option value="Amasya Üniversitesi">Amasya Üniversitesi</option>
                    <option value="Anadolu Üniversitesi">Anadolu Üniversitesi</option>
                    <option value="Anka Teknoloji Üniversitesi">Anka Teknoloji Üniversitesi</option>
                    <option value="Ankara Sosyal Bilimler Üniversitesi">Ankara Sosyal Bilimler Üniversitesi</option>
                    <option value="Ankara Üniversitesi">Ankara Üniversitesi</option>
                    <option value="Ardahan Üniversitesi">Ardahan Üniversitesi</option>
                    <option value="Artvin Çoruh Üniversitesi">Artvin Çoruh Üniversitesi</option>
                    <option value="Atatürk Üniversitesi">Atatürk Üniversitesi</option>
                    <option value="Atılım Üniversitesi">Atılım Üniversitesi</option>
                    <option value="Avrasya Üniversitesi">Avrasya Üniversitesi</option>
                    <option value="Ağrı İbrahim Çeçen Üniversitesi">Ağrı İbrahim Çeçen Üniversitesi</option>
                    <option value="Bahçeşehir Üniversitesi">Bahçeşehir Üniversitesi</option>
                    <option value="Balıkesir Üniversitesi">Balıkesir Üniversitesi</option>
                    <option value="Bandırma Onyedi Eylül Üniversitesi">Bandırma Onyedi Eylül Üniversitesi</option>
                    <option value="Bartın Üniversitesi">Bartın Üniversitesi</option>
                    <option value="Batman Üniversitesi">Batman Üniversitesi</option>
                    <option value="Bayburt Üniversitesi">Bayburt Üniversitesi</option>
                    <option value="Başkent Üniversitesi">Başkent Üniversitesi</option>
                    <option value="Beykent Üniversitesi">Beykent Üniversitesi</option>
                    <option value="Bezmiâlem Vakıf Üniversitesi">Bezmiâlem Vakıf Üniversitesi</option>
                    <option value="Bilecik Şeyh Edebali Üniversitesi">Bilecik Şeyh Edebali Üniversitesi</option>
                    <option value="Bilkent Üniversitesi">Bilkent Üniversitesi</option>
                    <option value="Bingöl Üniversitesi">Bingöl Üniversitesi</option>
                    <option value="Biruni Üniversitesi">Biruni Üniversitesi</option>
                    <option value="Bitlis Eren Üniversitesi">Bitlis Eren Üniversitesi</option>
                    <option value="Bozok Üniversitesi">Bozok Üniversitesi</option>
                    <option value="Boğaziçi Üniversitesi">Boğaziçi Üniversitesi</option>
                    <option value="Bursa Orhangazi Üniversitesi">Bursa Orhangazi Üniversitesi</option>
                    <option value="Bursa Teknik Üniversitesi">Bursa Teknik Üniversitesi</option>
                    <option value="Bülent Ecevit Üniversitesi">Bülent Ecevit Üniversitesi</option>
                    <option value="Canik Başarı Üniversitesi">Canik Başarı Üniversitesi</option>
                    <option value="Celal Bayar Üniversitesi">Celal Bayar Üniversitesi</option>
                    <option value="Cumhuriyet Üniversitesi">Cumhuriyet Üniversitesi</option>
                    <option value="Çanakkale Onsekiz Mart Üniversitesi">Çanakkale Onsekiz Mart Üniversitesi</option>
                    <option value="Çankaya Üniversitesi">Çankaya Üniversitesi</option>
                    <option value="Çankırı Karatekin Üniversitesi">Çankırı Karatekin Üniversitesi</option>
                    <option value="Çağ Üniversitesi">Çağ Üniversitesi</option>
                    <option value="Çukurova Üniversitesi">Çukurova Üniversitesi</option>
                    <option value="Deniz Harp Okulu">Deniz Harp Okulu</option>
                    <option value="Dicle Üniversitesi">Dicle Üniversitesi</option>
                    <option value="Dokuz Eylül Üniversitesi">Dokuz Eylül Üniversitesi</option>
                    <option value="Doğuş Üniversitesi">Doğuş Üniversitesi</option>
                    <option value="Dumlupınar Üniversitesi">Dumlupınar Üniversitesi</option>
                    <option value="Düzce Üniversitesi">Düzce Üniversitesi</option>
                    <option value="Ege Üniversitesi">Ege Üniversitesi</option>
                    <option value="Erciyes Üniversitesi">Erciyes Üniversitesi</option>
                    <option value="Erzincan Üniversitesi">Erzincan Üniversitesi</option>
                    <option value="Erzurum Teknik Üniversitesi">Erzurum Teknik Üniversitesi</option>
                    <option value="Eskişehir Osmangazi Üniversitesi">Eskişehir Osmangazi Üniversitesi</option>
                    <option value="Fatih Sultan Mehmet Üniversitesi">Fatih Sultan Mehmet Üniversitesi</option>
                    <option value="Fatih Üniversitesi">Fatih Üniversitesi</option>
                    <option value="Fırat Üniversitesi">Fırat Üniversitesi</option>
                    <option value="Galatasaray Üniversitesi">Galatasaray Üniversitesi</option>
                    <option value="Gazi Üniversitesi">Gazi Üniversitesi</option>
                    <option value="Gaziantep Üniversitesi">Gaziantep Üniversitesi</option>
                    <option value="Gaziosmanpaşa Üniversitesi">Gaziosmanpaşa Üniversitesi</option>
                    <option value="Gebze Teknik Üniversitesi">Gebze Teknik Üniversitesi</option>
                    <option value="Gedik Üniversitesi">Gedik Üniversitesi</option>
                    <option value="Gediz Üniversitesi">Gediz Üniversitesi</option>
                    <option value="Giresun Üniversitesi">Giresun Üniversitesi</option>
                    <option value="Gülhane Askeri Tıp Akademisi">Gülhane Askeri Tıp Akademisi</option>
                    <option value="Gümüşhane Üniversitesi">Gümüşhane Üniversitesi</option>
                    <option value="Hacettepe Üniversitesi">Hacettepe Üniversitesi</option>
                    <option value="Hakkari Üniversitesi">Hakkari Üniversitesi</option>
                    <option value="Haliç Üniversitesi">Haliç Üniversitesi</option>
                    <option value="Harran Üniversitesi">Harran Üniversitesi</option>
                    <option value="Hasan Kalyoncu Üniversitesi">Hasan Kalyoncu Üniversitesi</option>
                    <option value="Hava Harp Okulu">Hava Harp Okulu</option>
                    <option value="Hitit Üniversitesi">Hitit Üniversitesi</option>
                    <option value="Iğdır Üniversitesi">Iğdır Üniversitesi</option>
                    <option value="Işık Üniversitesi">Işık Üniversitesi</option>
                    <option value="Kadir Has Üniversitesi">Kadir Has Üniversitesi</option>
                    <option value="Kafkas Üniversitesi">Kafkas Üniversitesi</option>
                    <option value="Kahramanmaraş Sütçü İmam Üniversitesi">Kahramanmaraş Sütçü İmam Üniversitesi</option>
                    <option value="Kanuni Üniversitesi">Kanuni Üniversitesi</option>
                    <option value="Kara Harp Okulu">Kara Harp Okulu</option>
                    <option value="Karabük Üniversitesi">Karabük Üniversitesi</option>
                    <option value="Karadeniz Teknik Üniversitesi">Karadeniz Teknik Üniversitesi</option>
                    <option value="Karamanoğlu Mehmetbey Üniversitesi">Karamanoğlu Mehmetbey Üniversitesi</option>
                    <option value="Karatay Üniversitesi">Karatay Üniversitesi</option>
                    <option value="Kastamonu Üniversitesi">Kastamonu Üniversitesi</option>
                    <option value="Kilis 7 Aralık Üniversitesi">Kilis 7 Aralık Üniversitesi</option>
                    <option value="Kocaeli Üniversitesi">Kocaeli Üniversitesi</option>
                    <option value="Konya Gıda Tarım Üniversitesi">Konya Gıda Tarım Üniversitesi</option>
                    <option value="Koç Üniversitesi">Koç Üniversitesi</option>
                    <option value="Kırklareli Üniversitesi">Kırklareli Üniversitesi</option>
                    <option value="Kırıkkale Üniversitesi">Kırıkkale Üniversitesi</option>
                    <option value="MEF Üniversitesi">MEF Üniversitesi</option>
                    <option value="Maltepe Üniversitesi">Maltepe Üniversitesi</option>
                    <option value="Mardin Artuklu Üniversitesi">Mardin Artuklu Üniversitesi</option>
                    <option value="Marmara Üniversitesi">Marmara Üniversitesi</option>
                    <option value="Mehmet Akif Ersoy Üniversitesi">Mehmet Akif Ersoy Üniversitesi</option>
                    <option value="Melikşah Üniversitesi">Melikşah Üniversitesi</option>
                    <option value="Mersin Üniversitesi">Mersin Üniversitesi</option>
                    <option value="Mevlana Üniversitesi">Mevlana Üniversitesi</option>
                    <option value="Mimar Sinan Güzel Sanatlar Üniversitesi">Mimar Sinan Güzel Sanatlar Üniversitesi</option>
                    <option value="Murat Hüdavendigar Üniversitesi">Murat Hüdavendigar Üniversitesi</option>
                    <option value="Mustafa Kemal Üniversitesi">Mustafa Kemal Üniversitesi</option>
                    <option value="Muğla Sıtkı Koçman Üniversitesi">Muğla Sıtkı Koçman Üniversitesi</option>
                    <option value="Muş Alparslan Üniversitesi">Muş Alparslan Üniversitesi</option>
                    <option value="Namık Kemal Üniversitesi">Namık Kemal Üniversitesi</option>
                    <option value="Necmettin Erbakan Üniversitesi**">Necmettin Erbakan Üniversitesi**</option>
                    <option value="Nevşehir Hacı Bektaş Veli Üniversitesi">Nevşehir Hacı Bektaş Veli Üniversitesi</option>
                    <option value="Niğde Üniversitesi">Niğde Üniversitesi</option>
                    <option value="Nişantaşı Üniversitesi">Nişantaşı Üniversitesi</option>
                    <option value="Nuh Naci Yazgan Üniversitesi">Nuh Naci Yazgan Üniversitesi</option>
                    <option value="İbn-u Haldun Üniversitesi">İbn-u Haldun Üniversitesi</option>
                    <option value="İnönü Üniversitesi">İnönü Üniversitesi</option>
                    <option value="İpek Üniversitesi**">İpek Üniversitesi**</option>
                    <option value="İskenderun Teknik Üniversitesi">İskenderun Teknik Üniversitesi</option>
                    <option value="İstanbul 29 Mayıs Üniversitesi">İstanbul 29 Mayıs Üniversitesi</option>
                    <option value="İstanbul Arel Üniversitesi">İstanbul Arel Üniversitesi</option>
                    <option value="İstanbul Aydın Üniversitesi">İstanbul Aydın Üniversitesi</option>
                    <option value="İstanbul Bilgi Üniversitesi">İstanbul Bilgi Üniversitesi</option>
                    <option value="İstanbul Bilim Üniversitesi">İstanbul Bilim Üniversitesi</option>
                    <option value="İstanbul Esenyurt Üniversitesi">İstanbul Esenyurt Üniversitesi</option>
                    <option value="İstanbul Gelişim Üniversitesi">İstanbul Gelişim Üniversitesi</option>
                    <option value="İstanbul Kemerburgaz Üniversitesi">İstanbul Kemerburgaz Üniversitesi</option>
                    <option value="İstanbul Kültür Üniversitesi">İstanbul Kültür Üniversitesi</option>
                    <option value="İstanbul Medeniyet Üniversitesi">İstanbul Medeniyet Üniversitesi</option>
                    <option value="İstanbul Medipol Üniversitesi">İstanbul Medipol Üniversitesi</option>
                    <option value="İstanbul Rumeli Üniversitesi">İstanbul Rumeli Üniversitesi</option>
                    <option value="İstanbul Sabahattin Zaim Üniversitesi">İstanbul Sabahattin Zaim Üniversitesi</option>
                    <option value="İstanbul Teknik Üniversitesi">İstanbul Teknik Üniversitesi</option>
                    <option value="İstanbul Ticaret Üniversitesi">İstanbul Ticaret Üniversitesi</option>
                    <option value="İstanbul Üniversitesi">İstanbul Üniversitesi</option>
                    <option value="İstanbul Şehir Üniversitesi">İstanbul Şehir Üniversitesi</option>
                    <option value="İstinye Üniversitesi">İstinye Üniversitesi</option>
                    <option value="İzmir Ekonomi Üniversitesi">İzmir Ekonomi Üniversitesi</option>
                    <option value="İzmir Kâtip Çelebi Üniversitesi">İzmir Kâtip Çelebi Üniversitesi</option>
                    <option value="İzmir Yüksek Teknoloji Enstitüsü">İzmir Yüksek Teknoloji Enstitüsü</option>
                    <option value="İzmir Üniversitesi">İzmir Üniversitesi</option>
                    <option value="Okan Üniversitesi">Okan Üniversitesi</option>
                    <option value="Ondokuz Mayıs Üniversitesi">Ondokuz Mayıs Üniversitesi</option>
                    <option value="Ordu Üniversitesi">Ordu Üniversitesi</option>
                    <option value="Orta Doğu Teknik Üniversitesi">Orta Doğu Teknik Üniversitesi</option>
                    <option value="Osmaniye Korkut Ata Üniversitesi">Osmaniye Korkut Ata Üniversitesi</option>
                    <option value="Özyeğin Üniversitesi">Özyeğin Üniversitesi</option>
                    <option value="Pamukkale Üniversitesi">Pamukkale Üniversitesi</option>
                    <option value="Piri Reis Üniversitesi">Piri Reis Üniversitesi</option>
                    <option value="Polis Akademisi">Polis Akademisi</option>
                    <option value="Recep Tayyip Erdoğan Üniversitesi">Recep Tayyip Erdoğan Üniversitesi</option>
                    <option value="Sabancı Üniversitesi">Sabancı Üniversitesi</option>
                    <option value="Sakarya Üniversitesi">Sakarya Üniversitesi</option>
                    <option value="Sanko Üniversitesi">Sanko Üniversitesi</option>
                    <option value="Sağlık Bilimleri Üniversitesi">Sağlık Bilimleri Üniversitesi</option>
                    <option value="Selahattin Eyyubi Üniversitesi">Selahattin Eyyubi Üniversitesi</option>
                    <option value="Selçuk Üniversitesi">Selçuk Üniversitesi</option>
                    <option value="Siirt Üniversitesi">Siirt Üniversitesi</option>
                    <option value="Sinop Üniversitesi">Sinop Üniversitesi</option>
                    <option value="Süleyman Demirel Üniversitesi">Süleyman Demirel Üniversitesi</option>
                    <option value="Süleyman Şah Üniversitesi">Süleyman Şah Üniversitesi</option>
                    <option value="Şifa Üniversitesi">Şifa Üniversitesi</option>
                    <option value="Şırnak Üniversitesi">Şırnak Üniversitesi</option>
                    <option value="TED Üniversitesi">TED Üniversitesi</option>
                    <option value="TOBB Ekonomi ve Teknoloji Üniversitesi">TOBB Ekonomi ve Teknoloji Üniversitesi</option>
                    <option value="Toros Üniversitesi">Toros Üniversitesi</option>
                    <option value="Trakya Üniversitesi">Trakya Üniversitesi</option>
                    <option value="Tunceli Üniversitesi">Tunceli Üniversitesi</option>
                    <option value="Turgut Özal Üniversitesi">Turgut Özal Üniversitesi</option>
                    <option value="Türk Alman Üniversitesi">Türk Alman Üniversitesi</option>
                    <option value="Türk Hava Kurumu Üniversitesi">Türk Hava Kurumu Üniversitesi</option>
                    <option value="Türkiye Uluslararası İslam, Bilim ve Teknoloji Üniversitesi">Türkiye Uluslararası İslam, Bilim ve Teknoloji Üniversitesi</option>
                    <option value="Ufuk Üniversitesi">Ufuk Üniversitesi</option>
                    <option value="Uludağ Üniversitesi">Uludağ Üniversitesi</option>
                    <option value="Uluslararası Antalya Üniversitesi">Uluslararası Antalya Üniversitesi</option>
                    <option value="Uşak Üniversitesi">Uşak Üniversitesi</option>
                    <option value="Üsküdar Üniversitesi">Üsküdar Üniversitesi</option>
                    <option value="Yalova Üniversitesi">Yalova Üniversitesi</option>
                    <option value="Yaşar Üniversitesi">Yaşar Üniversitesi</option>
                    <option value="Yeditepe Üniversitesi">Yeditepe Üniversitesi</option>
                    <option value="Yeni Yüzyıl Üniversitesi">Yeni Yüzyıl Üniversitesi</option>
                    <option value="Yüksek İhtisas Üniversitesi**">Yüksek İhtisas Üniversitesi**</option>
                    <option value="Yüzüncü Yıl Üniversitesi">Yüzüncü Yıl Üniversitesi</option>
                    <option value="Yıldırım Beyazıt Üniversitesi">Yıldırım Beyazıt Üniversitesi</option>
                    <option value="Yıldız Teknik Üniversitesi">Yıldız Teknik Üniversitesi</option>
                    <option value="Zirve Üniversitesi">Zirve Üniversitesi</option>
	                </select>
                    </div>
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>
                <button id="dersOlustur" type="button" class="btn btn-primary">{$LECT_CREATE}</button>
              </div>

            </div>
          </div>
        </div>

        <div class="modal fade editLecture" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">

              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">{$LECT_EDIT}</h4>
              </div>
              <div class="modal-body">

                <div class="x_panel">
                  <div class="x_content">
                    <p class="alert">{$LECT_EDIT_P}</p>                    
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_NAME}
                        </label>
                        <div class="col-xs-12">
                          <input type="text" id="editLectureName" required="required" class="form-control col-xs-12"></input>
                        </div>
                      </div>
                      
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_DESC}
                        </label>
                        <div class="col-xs-12">
                          <textarea style="width: 100%;border: 1px solid #e5e5e5;resize:vertical;" name="Text1" id="editLectureDesc" rows="5" class="form-control col-xs-12"></textarea>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_STATUS}
                        </label>
                        <div class="col-xs-12">
                          <div id="status" class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default" data-toggle-class="btn-success" data-toggle-passive-class="btn-default">
                              <input name="status" value="1" data-parsley-multiple="status" class="label label-success" type="radio"> <span class="label label-success">{$PROJECT_ACTIVE}</span>
                            </label>
                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input name="status" value="0" data-parsley-multiple="status" type="radio"> <span class="label label-danger">{$PROJECT_PASSIVE}</span>
                            </label>
                          </div>
                        </div>
                      </div>

                      
                      <div class="form-group">
                      <div class="col-xs-12">
                      <hr>
                      <button class="btn btn-sm btn-danger pull-right" onclick="dersSil_AJAX({$dersim.DersID})">{$PROJECT_DELETE_P}</button>
                      </div>
                      </div>

                 
                  </div>
                </div>

              </div>
              <div class="modal-footer">
              <button onclick="" id="editBtn" type="submit" class="btn btn-success">{$MODAL_SAVE}</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">{$MODAL_CLOSE}</button>
              </div>

            </div>
          </div>
        </div>

        <div class="modal-body">
            {if {$dersim.ders}=='var'}
                <div class="x_panel">
                  <div class="x_content">

                    <h3 id="lectureName" class="name"> {$dersim.DersAdi} </h3>
                    <h5>{$dersim.DersUniversite}</h5>
                    <h6>{$CREATED} {$dersim.Tarih|date_format:"%D"}</h6>
                    <br>
                    <p class="well" id="lectureDesc">
                    {$dersim.Aciklama}
                    </p>
                  </div>
                </div>
                <ul class="stats-overview">
                  <li>
                    <span class="name"> {$PROJECT_SUBS} </span>
                    <a href="viewSubs.php?id={$dersim.DersID}" class="value text-success" id="lectureSubs"> {$dersim.subs} </a>
                  </li>
                  <li>
                    <span class="name"> {$PROJECT_PROJS} </span>
                    <a href="Projects.php" class="value text-success" id="lectureProjects"> {$dersim.projects} </a>
                  </li>
                  <li class="hidden-phone">
                    <span class="name"> {$PROJECT_STAT} </span>
                    <span class="value text-primary" id="lectureStatus"> 
                    {if {$dersim.Aktif}=='1'}
                <button type="button" class="btn btn-success btn-xs">{$PROJECT_ACTIVE}</button>
                {else}
                <button type="button" class="btn btn-danger btn-xs">{$PROJECT_PASSIVE}</button>
                {/if}
                     </span>
                  </li>
                </ul>
                <p class="alert alert-success">{$LECTURE_SUB_CODE}<strong id="lectureCode">{$dersim.Kod}</strong></p>
                <!--<p class="alert">Duyuru yapmak için aşağıdaki alana duyurunuzu yazıp submit butonuna basın. Derse abone olan herkese bildirim gidecektir.</p>
               <p for="first-name">Announcement</p>
                <textarea style="width: 100%;border: 1px solid #e5e5e5;resize:vertical;" name="Text1" id="first-name" rows="5" required="required"></textarea>-->
                {else}
                <p class="alert alert-info">{$LECTURE_NEW}</p>
                {/if}

              </div>

            

 

      </div>
    </div>
  </div>
</div>
</div>
</div>
<!-- /page content -->
{/block}

{block name="footer"}
<!-- FastClick -->
<script src="../_Vendors/Proje/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../_Vendors/Proje/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="../_Vendors/Proje/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
{/block}

{block name="customJs"}
<script type="text/javascript">

  $( "#dersOlustur" ).click(function() {
    var dersAdi=$("#dersAdiTxt").val();
    var univ=$("#universiteTxt").val();
    $.ajax({
      type: 'POST',
      url: 'AJAX/createLecture.php',
      data: 'dersAdi='+ dersAdi + '&univ='+univ,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {
          location.reload();
        }else{
                        //hata
                      }
                    },
                    error: function () {
                      alert('ERROR!');
                    }
                  });
  });


  function dersSil_AJAX(ID) {
    if (confirm('Silmek istediğinizden emin misiniz?')) {
                // do it!
                if (ID != "") {
                  $.ajax({
                    type: 'POST',
                    url: 'AJAX/deleteLecture.php',
                    data: 'dersID='+ ID,
                    success: function (data) {
                      var data = $.parseJSON(data);      
                      if( data.status == 'success' ) {
                        location.reload();
                      }else{
                        //hata
                      }
                    },
                    error: function () {
                      alert('ERROR!');
                    }
                  })
                }
              }   
            }

            function dersDuzenleGoster(ID) {

              if (ID != "") {

                $.ajax({
                  type: 'POST',
                  url: 'AJAX/getLecture.php',
                  data: 'dersID='+ ID,
                  success: function (data) {
                    var data = $.parseJSON(data);   
                    if( data.status == 'success' ) {
                      $('#editBtn').attr('onclick', 'dersDuzenle_AJAX('+ID+')');
                      $("#editLectureName").val(data.name);
                      $("#editLectureDesc").html(data.desc);
                        if(data.active==1){
                          $('input:radio[name=status][value=1]').click();
                        }else{
                          $('input:radio[name=status][value=0]').click();
                        }
                      }else{
                        //hata
                      }
                    },
                    error: function () {
                      alert('ERROR!');
                    }
                  })
              }
            }

        function dersDuzenle_AJAX(ID) {

                if (ID != "") {
                  var dersAdi=$("#editLectureName").val();
                  var dersAciklama=$("#editLectureDesc").val();
                  var dersStatus=$('input[name=status]:checked').val();
                  $.ajax({
                    type: 'POST',
                    url: 'AJAX/editLecture.php',
                    data: 'dersID=' + ID + '&dersAdi=' + dersAdi + '&dersAciklama=' + dersAciklama + '&dersStatus=' + dersStatus,
                    success: function (data) {
                      var data = $.parseJSON(data);    
                      if( data.status == 'success' ) {
                        //başarılı
                        location.reload();
                      }else{
                        //hata
                      }
                    },
                    error: function () {
                      alert('ERROR!');
                    }
                  })
                }
                
            }

          </script>
          {/block}