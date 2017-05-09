{extends file='Proje/_layout.tpl'}
<!-- Index File -->

<!-- Load Lang Files -->
{if $LANG == 'tr'}
{include file='Proje/_lang_TR.tpl' scope=parent}
{block name="title"}Proje Teklifi | BÖTE Projeleri{/block}
{else}
{include file='Proje/_lang_EN.tpl' scope=parent}
{block name="title"}Project Proposal| CEIT Projects{/block}
{/if}


{block name="head"}
<!-- NProgress -->
<link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 

{/block}

{block name="body"}
<!-- page content -->

<div class="right_col" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>{$PROJECT_PROPOSAL}</h3>
      </div>
    </div>
    
    <div class="clearfix"></div>

    <div class="row">
      <div class="col-md-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>{$PROJECT_CREATE}</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
              <li><a class="" data-toggle="modal" data-target=".subLecture"><i class="fa fa-plus"></i> {$PROJECT_CREATE}</a>
              </li>
            </ul>
            <div class="clearfix"></div>
          </div>
          <div class="x_content">

             <div class="modal fade subLecture" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">{$PROJECT_CREATE}</h4>
                        </div>
                        <div class="modal-body">



                          <p>{$PROJECT_PROPOSAL_P}</p><p><i>
                            *{$PROJECT_PROPOSAL_P2}! </i>
                          </p>
                          <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                          <div class="form-group" id="giris">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_NAME}
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="projeAdiTxt" placeholder="{$BRAND_NAME} {$ETC}..." required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                            </div>
                            <div class="form-group" >
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_TYPE}
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <select id="projeTuruTxt" class="form-control">
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
                          <input id="baslangicTarihTxt" type="text" class="form-control" size="30"/>
                      </div>
                    </div>
                    <div class="form-group" >
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROJECT_FINISH}
                      </label>
                      <div class='col-sm-6'>
                          <input id="bitisTarihTxt" type="text" class="form-control" size="30"/>
                      </div>
                    </div>
                          
                          <p id="hata" class="alert alert-danger" style="display:none;">Error! Boş girme</p>
                          <div id="sonuc" style="display:none;"><p class="alert alert-success">{$PROJECT_PROPOSAL_RESULT} <strong id="projeAdi"></strong></p><p class="alert alert-info">{$PROJECT_PROPOSAL_RESULT2}</p></div>
                          </form>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>
                          <button id="projeOlustur" type="button" class="btn btn-primary">{$PROJECT_CREATE}</button>
                        </div>

                      </div>
                    </div>
                  </div>



            <p class="alert alert-info">{$PROJECT_PROPOSAL_YET}</p>

            <table class="table table-striped projects">
              <thead>
                <tr>
                  <th style="width: 1%">#</th>
                  <th style="width: 20%">{$PROJECT_NAME}</th>
                  <th>{$PROJECT_STAT}</th>
                  <th style="width: 20%">{$ACTIONS}</th>
                </tr>
              </thead>
              <tbody>
              	{foreach $davetlerDizi as $r} 
                <tr data-id="{$r.DavetID}">
                <td>{$r.DavetID}</td>
                <td>{$r.ProjeAdi}</td>
                <td>
                {if {$r.Onay}=='1'}
                   <button type="button" class="btn btn-success btn-xs">Onaylandı</button>
                {else}
                    <button type="button" class="btn btn-info btn-xs">{$PROJECT_INVITE_NOT_APPROVE}</button>
                {/if}
                </td>
                <td>
                  <a href="#" onclick="davetKabulEt({$r.DavetID})" class="btn btn-success btn-xs"><i class="fa fa-pencil"></i> {$ACCEPT}</a>
                  <a href="#" onclick="davetSil({$r.DavetID})" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> {$DELETE}</a>
                </td>
                </tr>
                {foreachelse}
                  .. {$INVITE_NULL} .. 
                {/foreach}
              </tbody>
            </table>


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
<!-- bootstrap-progressbar -->
<script src="../_Vendors/Proje/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.14.5/polyfiller.js"></script>
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
  
        $( "#projeOlustur" ).click(function() {
        $('#hata').hide();
        var projeAdi=$("#projeAdiTxt").val();
        var projeTuru=$("#projeTuruTxt").val();
        var baslangic=$("#baslangicTarihTxt").val();
        var bitis=$("#bitisTarihTxt").val();
        alert(baslangic + "_" +bitis);
        if(bitis!="" && baslangic!="" && projeAdi!="" && projeTuru!=""){

          $.ajax({
                          type: 'POST',
                          url: 'AJAX/createProject.php',
                          data: 'projeAdi='+ projeAdi+'&projeTuru='+projeTuru+'&baslangic='+baslangic+'+&bitis='+bitis,
                          success: function (data) {
                            var data = $.parseJSON(data);
                            if( data.status == 'success' ) {
                              
                              $('#hata').hide();
                              $('#sonuc').show()
                              $('#projeAdi').html(data.projeAdi);

                            }else{
                              $('#hata').show( "slow" );
                            }
                          },
                          error: function () {
                            $('#hata').show( "slow" );
                          }
                        });

        }else{
          $('#hata').show();
        }

        
      });





        function davetKabulEt(ID) {
        $.ajax({
                          type: 'POST',
                          url: 'AJAX/davetKabulEt.php',
                          data: 'davetID='+ ID,
                          success: function (data) {
                            var data = $.parseJSON(data);
                            if( data.status == 'success' ) {
                              
                              $('#hata').hide();
                              location.reload();

                            }else{
                              $('#hata').show( "slow" );
                            }
                          },
                          error: function () {
                            $('#hata').show( "slow" );
                          }
                        });
        }

        function davetSil(ID) {
          
    if (confirm('Silmek istediğinizden emin misiniz?')) {
                // do it!
                if (ID != "") {
                  var tr=$('tr[data-id='+ID+']');

                  $.ajax({
                    type: 'POST',
                    url: 'AJAX/davetSil.php',
                    data: 'davetID='+ ID,
                    success: function (data) {
                      var data = $.parseJSON(data);      
                      if( data.status == 'success' ) {
                        tr.fadeOut(500, function(){
                          $(this).remove();
                        });
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

</script>
{/block}