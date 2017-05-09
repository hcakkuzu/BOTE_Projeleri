{extends file='Proje/_layout.tpl'}
<!-- Index File -->

<!-- Load Lang Files -->
{if $LANG == 'tr'}
{include file='Proje/_lang_TR.tpl' scope=parent}
{block name="title"}Proje Detayları | BÖTE Projeleri{/block}
{else}
{include file='Proje/_lang_EN.tpl' scope=parent}
{block name="title"}Project Details | CEIT Projects{/block}
{/if}


{block name="head"}
<!-- NProgress -->
<link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="../_Vendors/Proje/bootstrap-datetimepicker-master/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

{/block}

{block name="body"}
<!-- page content -->
<div class="right_col" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>{$PROJECT_DETAILS}</h3>
      </div>
    </div>

    <div class="clearfix"></div>

    <div class="row">
      <div class="col-md-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>{$MENU_MYPROJECT}</h2>
            {if $projeYoneticisi == 'yes'}
            <ul class="nav navbar-right panel_toolbox">
             <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
             </li>
             <li><a data-toggle="modal" data-target=".editProject"><i class="fa fa-pencil"></i> {$PROJECT_EDIT}</a></li>
             <li><a data-toggle="modal" data-target=".inviteMember"><i class="fa fa-plus"></i> {$PROJECT_INVITE}</a></li>
           </ul>
           {/if}

           <div class="clearfix"></div>
         </div>

         <div class="x_content">


         <div class="modal fade gorevDegistir" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">{$PROJECT_JOB_EDIT}</h4>
                </div>
                <div class="modal-body">

                  <form class="form-horizontal form-label-left" novalidate="" onsubmit="return false;">
                    <div class="form-group" id="giris">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_JOB}</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="gorevTxt" placeholder="{$PROJECT_JOB_PLCHOLDER} {$ETC}..." required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                <button id="gorevKaydet" type="button" class="btn btn-primary" data-dismiss="modal">{$MODAL_SAVE}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>
                </div>

              </div>
            </div>
          </div>


         <div class="modal fade projeOnay" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">
                    {if $projeDetaylariDizi.Durum=='0'}
                    <button class="btn btn-danger">Unapproved</button>
                    {/if}
                    {if $projeDetaylariDizi.Durum=='1'}
                    <button class="btn btn-warning">Suspended</button>
                    {/if}
                    {if $projeDetaylariDizi.Durum=='2,'}
                    <button class="btn btn-success">Approved</button>
                    {/if}
                      
                  </h4>
                </div>
                <div class="modal-body">
                  <h4>Feedback</h4>
                  <p class="well">
                    {$projeDetaylariDizi.Geribildirim}
                    <small class="pull-right">{$projeDetaylariDizi.GeribildirimTarih|date_format:'%d-%m-%Y %H:%M'} | {$ogretmenAdi}</small>
                  </p>

                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>
                </div>

              </div>
            </div>
          </div>


          <div class="modal fade editProject" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">{$PROJECT_EDIT}</h4>
                </div>
                <div class="modal-body">

                  <form class="form-horizontal form-label-left" novalidate="" onsubmit="return false;">
                    <div class="form-group" id="giris">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">{$PROJECT_NAME}
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="projeAdiTxt" placeholder="{$BRAND_NAME} {$ETC}..." required="required" class="form-control col-md-7 col-xs-12" value="{$projeDetaylariDizi.ProjeAdi}">
                      </div>
                    </div>
                    <div class="form-group" >
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">{$PROJECT_TYPE}
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select id="projeTuruTxt" class="form-control" value="{$projeDetaylariDizi.ProjeTuru}">
                          <option value="" disabled>{$PROF_SELECT}</option>
                          <option value="yazilim">{$PROJECT_TYPE_SOFT}</option>
                          <option value="egitim">{$PROJECT_TYPE_EDU}</option>
                          <option value="sosyal">{$PROJECT_TYPE_SOCIAL}</option>
                          <option value="konferans">{$PROJECT_TYPE_CONF}</option>
                          <option value="Other">{$PROJECT_TYPE_OTHER}</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group" >
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">{$PROJECT_START}
                      </label>
                      
                      <div class='col-sm-6'>
                          <input id="baslangicTarihTxt" type="text" class="form-control" value="{$projeDetaylariDizi.Baslangic}"/>
                      </div>
                    </div>
                    <div class="form-group" >
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_FINISH}
                      </label>
                      <div class='col-sm-6'>
                          <input id="bitisTarihTxt" type="text" class="form-control" value="{$projeDetaylariDizi.Bitis}"/>
                      </div>
                    </div>
                    <div class="form-group" >
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_DESC}
                      </label>
                      <div class='col-sm-6'>
                          <textarea id="aciklamaTxt" style="resize:vertical;" class="form-control" rows="5"></textarea>
                      </div>
                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                <button id="projeDuzenleBtn" type="button" class="btn btn-primary" data-dismiss="modal" onclick="projeDuzenle({$projeDetaylariDizi.ProjeID})">{$MODAL_SAVE}</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>
                </div>

              </div>
            </div>
          </div>


          <div class="modal fade inviteMember" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">{$PROJECT_CREATE}</h4>
                </div>
                <div class="modal-body">



                  <p>{$PROJECT_CREATE_P}</p>
                  <p><i>{$PROJECT_CREATE_P2}</i></p>
                    <form onsubmit="return false;">
                    <div class="form-group" id="giris">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="kisiAdiTxt">{$PROF_NAME}
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="kisiAdiTxt" placeholder="Halil Çağrı {$ETC}..." required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group text-center">
                      <a class="btn btn-primary" id="araBtn">{$SEARCH}</a>
                    </div>
                    <div class="form-group text-center" id="sonuclarDiv">
                      </form>


                    </div>
                    <p id="hata" class="alert alert-info" style="display: none;"> {$INVITE_NULL}</p>
                  
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_SAVE}</button>
                </div>

              </div>
            </div>
          </div>


          <!-- start project-detail sidebar -->
          <div class="col-xs-12">

            <section class="panel">
              <div class="panel-body">
                <h3 class="green"><i class="fa fa-paint-brush"></i> {$projeDetaylariDizi.ProjeAdi} 
                {if $KullaniciTuru == 'Student'}
                  {if $projeDetaylariDizi.Geribildirim != ''}
                    {if $projeDetaylariDizi.Durum=='0'}
                    <button data-toggle="modal" data-target=".projeOnay" style="font-size:9px;" class="btn btn-danger">{$_UNAPPROVED}</button>
                    {/if}
                    {if $projeDetaylariDizi.Durum=='1'}
                    <button data-toggle="modal" data-target=".projeOnay" style="font-size:9px;" class="btn btn-warning">{$SUSPEND}</button>
                    {/if}
                    {if $projeDetaylariDizi.Durum=='2'}
                    <button data-toggle="modal" data-target=".projeOnay" style="font-size:9px;" class="btn btn-success">{$_APPROVED}</button>
                    {/if}
                  {/if}
                {/if}
                </h3>
                
                <h4>{$PROJECT_DESC}</h4>
                <p class="well">{$projeDetaylariDizi.Aciklama}</p>

                <div class="project_detail">

                            <p class="title">{$PROJECT_START}</p>
                            <p>{$projeDetaylariDizi.Baslangic|date_format:"%D"}</p>
                            <p class="title">{$PROJECT_FINISH}</p>
                            <p>{$projeDetaylariDizi.Bitis|date_format:"%D"}</p>
                          </div>
              
                <span style="padding-right: 10px;" class="pull-right"><small>{$PROJECT_PROGRESS} : %{$kalanGun}</small></span>
                <br>
                <div class="progress clearfix">

                  <div class="progress-bar progress-bar-success" data-transitiongoal="100" aria-valuenow="{$kalanGun}" style="width: {$kalanGun}%;">

                  </div>
                </div>

              </div>

            </section>

          </div>

          <div class="col-md-8 col-xs-12">

           <div class="project_detail">

             <h5>{$PROJECT_TEAM}</h5>

             <ul class="list-unstyled msg_list">
              <li>
                <a href="Profile.php?id={$projeDetaylariDizi.ProjeYoneticisiID}">
                  <span class="image">
                    <img src="../_Vendors/Proje/images/{$projeDetaylariDizi.ProfilFoto}?{php}echo time();{/php}" alt="img" style="min-width: 30px;">
                  </span>
                  <span>
                    <span>{$projeDetaylariDizi.Isim}</span>
                    <span class=""><i class="fa fa-star"></i></span>
                  </span>
                  <span class="message">
                    {$projeDetaylariDizi.Eposta}
                  </span>
                </a>
                <a style="width: 80%;" class="text-right">
                  <label class="btn btn-xs btn-primary">{$projeDetaylariDizi.YoneticiGorev}</label>
                  {if $USERID==$projeDetaylariDizi.ProjeYoneticisiID}<button data-toggle="modal" data-target=".gorevDegistir" onclick="gorevDegistir('{$projeDetaylariDizi.YoneticiGorev}')" class="btn btn-xs btn-warning"><i class="fa fa-pencil"></i> {$PROJECT_JOB_EDIT}</button>{/if}
                </a>
              </li>

              {foreach $projeTakimiDizi as $r} 
              <li id="uye{$r.DavetID}">
                <a href="Profile.php?id={$r.KullaniciID}">
                  <span class="image">
                    <img src="../_Vendors/Proje/images/{$r.ProfilFoto}?{php}echo time();{/php}" alt="img" style="min-width: 30px;">
                  </span>
                  <span>
                    <span>{$r.Isim}</span>
                    
                  </span>
                  <span class="message">
                    {$r.Eposta}
                  </span>
                </a>
                <a style="width: 80%;" class="text-right">
                  <label class="btn btn-xs btn-primary">{$r.Gorev}</label>
                  {if $USERID==$r.KullaniciID}<button data-toggle="modal" data-backdrop="static" data-target=".gorevDegistir" onclick="gorevDegistir('{$r.Gorev}')" class="btn btn-xs btn-warning"><i class="fa fa-pencil"></i> {$PROJECT_JOB_EDIT}</button>{/if}
                </a>
                {if $projeYoneticisi == 'yes'} <button onclick="kick({$r.DavetID})" class="btn btn-xs btn-danger"> <i class="fa fa-times"></i> {$KICK}</button> {/if}
              </li>
              {foreachelse}

              {/foreach}
              <li style="display: none;"></li>
            </ul>



          </div>

        </div>


        <div class="col-md-4 col-xs-12">

          <h5>{$PROJECT_FILES}</h5>
          <ul class="list-unstyled project_files">
          
           {foreach $projeDosyalariDizi as $r} 	
          
            <li><a href="{$r.DosyaYolu}"><i class="fa fa-file"></i>{$r.DosyaAdi}</a>
            </li>

	{/foreach}
	
          </ul>
          <br />
        {if $KullaniciTuru == 'Student'}
          <div class="mtop20">
            <a href="UploadFile.php" class="btn btn-sm btn-primary">{$ADD_FILES}</a>
          </div>
        {/if}
        </div>

        <div class="col-xs-12">

          <div>

            <h4>{$BOARD}</h4> <a class="btn btn-md btn-info" href="Pin.php?id={$projeDetaylariDizi.ProjeID} ">{$PIN_SOME}</a>

            <!-- end of user messages -->
            <ul class="messages">
             
              {foreach $projePanoDizi as $r} 	
          
                <li>
                <img src="../_Vendors/Proje/images/{$r.ProfilFoto}?{php}echo time();{/php}" class="avatar" alt="Avatar">
                <div class="message_date">
                  <small>{$r.Tarih|date_format:"%D"}</small>
                </div>
                <div class="message_wrapper">
                  <h4 class="heading"><a href="Profile.php?id={$r.KullaniciID}">{$r.Isim}</a></h4>
                  <blockquote class="message">
                    {$r.Yazi}
                  </blockquote>
                  {if {$r.DosyaYolu}!=""}
                  <br>
                  <p class="url">
                    <span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
                    <a href="{$r.DosyaYolu}"><i class="fa fa-paperclip"></i> {$r.DosyaAdi} </a>
                  </p>
                  {/if}
                </div>
              </li>

        	    {/foreach}
              

            </ul>
            <!-- end of user messages -->


          </div>

        </div>
        <!-- end project-detail sidebar -->

      </div>
    </div>
  </div>
</div>
</div>
</div>
<!-- /page content -->
{/block}

{block name="footer"}
<!-- jquery ui-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<!-- FastClick -->
<script src="../_Vendors/Proje/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../_Vendors/Proje/nprogress/nprogress.js"></script>
<!-- EChart.js -->
<script src="../_Vendors/Proje/echarts/dist/echarts.min.js"></script>


{/block}

{block name="customJs"}
  <script>
  $( function() {
    $( "#baslangicTarihTxt" ).datepicker();
    $( "#bitisTarihTxt" ).datepicker();
    $( "#baslangicTarihTxt" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
    $( "#bitisTarihTxt" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
  } );
  </script>
<script type="text/javascript">




$( document ).ready(function() {
    $("#projeTuruTxt").val("{$projeDetaylariDizi.ProjeTuru}").change();
    $("#baslangicTarihTxt").val('{$projeDetaylariDizi.Baslangic|date_format:"%Y-%m-%d"}');
    $("#bitisTarihTxt").val('{$projeDetaylariDizi.Bitis|date_format:"%Y-%m-%d"}');
    $("#projeAciklama").val('{$projeDetaylariDizi.Aciklama}');


    var wage = document.getElementById("kisiAdiTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#araBtn" ).click();
    }
});

var wage = document.getElementById("projeAdiTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});

var wage = document.getElementById("projeTuruTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});
var wage = document.getElementById("baslangicTarihTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});
var wage = document.getElementById("bitisTarihTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});

var wage = document.getElementById("gorevTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#gorevKaydet" ).click();
    }
});

});

  function gorevDegistir(str){
    $('#gorevTxt').val(str);
  }

  function sonucEkle(ID,Isim,Foto){
    $('<div class="col-md-4 col-sm-4 col-xs-12 profile_details"><div class="well profile_view"><div class="col-sm-12"><div class="left col-xs-7"><h2>'+Isim+'</h2></div><div class="right col-xs-5 text-center"><img alt="" class="img-circle img-responsive" src="../_Vendors/Proje/images/'+Foto+'?{php}echo time();{/php}"></div></div><div class="col-xs-12 bottom text-center"><div class="col-xs-12 text-center"><a id="btn'+ID+'" class="btn btn-primary btn-xs" onclick="davetEt('+ID+')"><i class="fa fa-user"></i> Davet Et</a></div></div></div></div>').appendTo("#sonuclarDiv");
  }




  $( "#gorevKaydet" ).click(function() {
    var gorev=$('#gorevTxt').val();

    $.ajax({
      type: 'POST',
      url: 'AJAX/gorevDegistir.php',
      data: 'Gorev='+ gorev,
      success: function (data) {

        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          location.reload();

        }else{
          $('#hata').show( "slow" );
        }
      },
      error: function () {
        $('#hata').show( "slow" );
      }
    });
  });


  $( "#araBtn" ).click(function() {
    var kisiAdi=$("#kisiAdiTxt").val();
    $("#sonuclarDiv").html(" ");
    $.ajax({
      type: 'POST',
      url: 'AJAX/kisilerdeAra.php',
      data: 'kisiAdi='+ kisiAdi,
      success: function (data) {

        var data = $.parseJSON(data);

        if( data.status == 'success' ) {

          $('#hata').hide();
          for(var i=0 ; i <= data.dizi.length-1;i++)
          {
            var item = data.dizi[i];
            sonucEkle(item.KullaniciID,item.Isim,item.ProfilFoto);
          } 

        }else{
          $('#hata').show( "slow" );
        }
      },
      error: function () {
        $('#hata').show( "slow" );
      }
    });
  });


function projeDuzenle(ID){
  var projeAdi=$("#projeAdiTxt").val();
  var projeAciklama=$("#aciklamaTxt").val();
  var projeTuru=$("#projeTuruTxt").val();
  var baslangic=$("#baslangicTarihTxt").val();
  var bitis=$("#bitisTarihTxt").val();

     $.ajax({
      type: 'POST',
      url: 'AJAX/projeDuzenle.php',
      data: 'ID='+ ID+'&projeAdi='+projeAdi+'&projeAciklama='+projeAciklama+'&projeTuru='+projeTuru+'&baslangic='+baslangic+'&bitis='+bitis,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          location.reload();

        }else{
          alert('ERROR!');
        }
      },
      error: function () {
        alert('ERROR!');
      }
    });
  }

  function davetEt(ID){
    var btn = $("#btn"+ID);
    $.ajax({
      type: 'POST',
      url: 'AJAX/projeyeDavetEt.php',
      data: 'ID='+ ID,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          btn.html('Invited');
          btn.attr('class', 'btn btn-success btn-xs');
          btn.attr('onclick', '');

        }else{
          alert('ERROR!');
        }
      },
      error: function () {
        alert('ERROR!');
      }
    });
  }

  function kick(ID){
    $.ajax({
      type: 'POST',
      url: 'AJAX/projedenAt.php',
      data: 'ID='+ ID,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          $("#uye"+ID).hide();

        }else{
          alert('ERROR!');
        }
      },
      error: function () {
        alert('ERROR!');
      }
    });
  }
</script>



<!-- ECharts -->
<script src="../_Vendors/Proje/echarts/dist/echartsCustom.js"></script>
<!-- /ECharts -->

{/block}