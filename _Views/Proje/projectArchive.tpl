<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Meta, title, CSS, favicons, etc. -->

	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1">



	<title>{block name="title"}{/block}</title>

	<!-- Bootstrap -->

	<link href="../_Vendors/Proje/css/bootstrap.min.css" rel="stylesheet">

	<!-- Font Awesome -->

	<link href="../_Vendors/Proje/css/font-awesome.css" rel="stylesheet">



	{block name="head"}{/block}



	<!-- Custom Theme Style -->

	<link href="../_Vendors/Proje/css/custom.css" rel="stylesheet">

</head>

<body class="nav-md">

	<div class="container body">

		<div class="main_container">

				<!-- page content -->

				{block name="body"}{/block}

				<!-- /page content -->


			</div>

		</div>



		<!-- jQuery -->

		<script src="../_Vendors/Proje/js/jquery.min.js"></script>

		<!-- Bootstrap -->

		<script src="../_Vendors/Proje/js/bootstrap.min.js"></script>



		{block name="footer"}{/block}



		<!-- Custom Theme Scripts -->

		<script src="../_Vendors/Proje/js/custom.js"></script>



		

		{block name="customJs"}{/block}


</body>

</html>
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


    <div class="row">
      <div class="col-md-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>{$PROJECT_DETAILS}</h2>
           <div class="clearfix"></div>
         </div>



          <!-- start project-detail sidebar -->
          <div class="col-xs-12">

            <section class="panel">
              <div class="panel-body">
                <h3 class="green"><i class="fa fa-paint-brush"></i> {$projeDetaylariDizi.ProjeAdi} 
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
                <a href="#">
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
                </a>
              </li>

              {foreach $projeTakimiDizi as $r} 
              <li id="uye{$r.DavetID}">
                <a href="#">
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
                </a>
              </li>
              {foreachelse}

              {/foreach}
              <li style="display: none;"></li>
            </ul>



          </div>

        </div>


        <div class="col-md-4 col-xs-12">

          <h5>Project files</h5>
          <ul class="list-unstyled project_files">
          
           {foreach $projeDosyalariDizi $r} 	
          
            <li><a href="{$r.DosyaYolu}"><i class="fa fa-file"></i>{$r.DosyaAdi}</a>
            </li>

	{/foreach}
	
          </ul>
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