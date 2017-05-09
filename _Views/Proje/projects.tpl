{extends file='Proje/_layout.tpl'}

<!-- Index File -->



<!-- Load Lang Files -->

{if $LANG == 'tr'}

{include file='Proje/_lang_TR.tpl' scope=parent}

{block name="title"}Projeler | BÖTE Projeleri{/block}

{else}

{include file='Proje/_lang_EN.tpl' scope=parent}

{block name="title"}Projects | CEIT Projects{/block}

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

        <h3>{$MENU_PROJECTS}</h3>

      </div>

    </div>

    

    <div class="clearfix"></div>



    <div class="modal fade projeOnay" tabindex="-1" role="dialog" aria-hidden="true">

            <div class="modal-dialog modal-lg">

              <div class="modal-content">



                <div class="modal-header">

                  <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>

                  </button>

                  <h4 class="modal-title" id="myModalLabel">

                    {$PROJECT_STAT}

                  </h4>

                </div>

                <div class="modal-body">



                  <h4>{$FEEDBACK} <span id="projectName"></span></h4>

                  <textarea id="geriBildirimTxt" style="width: 100%;border: 1px solid #e5e5e5;resize:vertical;" class="form-control"></textarea>

                    <small class="pull-right">{$smarty.now|date_format:'%d-%m-%Y %H:%M'} | {$Name}</small>

                  <select name="statusTxt" id="statusTxt" class="form-control" style="margin-top:25px;">

                    <option value="" disabled>{$PROF_SELECT}</option>

                    <option value="0" selected>{$_UNAPPROVED}</option>

                    <option value="1">{$SUSPEND}</option>

                    <option value="2">{$_APPROVED}</option>

                  </select>



                </div>

                <div class="modal-footer">

                <button id="projeOnayBtn" type="button" class="btn btn-primary" data-dismiss="modal" onclick="projeOnayla()">{$MODAL_SAVE}</button>

                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>

                </div>



              </div>

            </div>

          </div>



    <div class="row">

      <div class="col-md-12">

        <div class="x_panel">

          <div class="x_title">

            <h2>{$MENU_PROJECTS}</h2>

            <div class="clearfix"></div>

          </div>

          <div class="x_content">

            <!-- start project list -->

            <table class="table table-striped projects">

              <thead>

                <tr>

                  <th style="width: 1%">#</th>

                  <th style="width: 20%">{$PROJECT_NAME}</th>

                  <th>{$MANAGER}</th>

                  <th>{$PROJ_PROG}</th>

                  <th>{$PROJECT_STATUS}</th>

                  <th style="width: 20%">#</th>

                </tr>

               </thead>

              <tbody>



              {foreach $projelerDizi as $r} 

              

              <tr>

                  <td>#</td>

                  <td>

                    <a>{$r.ProjeAdi}</a>

                    <br />

                    <small>{$CREATED} {$r.Baslangic|date_format:"%D"}</small>

                  </td>

                  <td>

                    <ul class="list-inline">

                      <li>

                        <img src="../_Vendors/Proje/images/{$r.ProfilFoto}?{php}echo time();{/php}" class="avatar" style="vertical-align:middle!important;" alt="Avatar" /> <span style="padding-left: 8px;">{$r.Isim}</span>

                      </li>



                    </ul>

                  </td>

                  <td class="project_progress">

                    <div class="progress progress_sm">

                      <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="{$projeSureleri[$r@index]}"></div>

                    </div>

                    <small>%{$projeSureleri[$r@index]} {$COMPLATE}</small>

                  </td>

                  <td>



                    {if {$r.Durum}=='2'}

                      <button type="button" data-toggle="modal" data-target=".projeOnay" onclick="onayEkran({$r.ProjeID},'{$r.ProjeAdi}')" class="btn btn-success btn-xs">{$_APPROVED}</button>

                    {/if}

                    {if {$r.Durum}=='1'}

                      <button type="button" data-toggle="modal" data-target=".projeOnay" onclick="onayEkran({$r.ProjeID},'{$r.ProjeAdi}')" class="btn btn-warning btn-xs">{$SUSPEND}</button>

                    {/if}

                    {if {$r.Durum}=='0'}

                    <button type="button" data-toggle="modal" data-target=".projeOnay" onclick="onayEkran({$r.ProjeID},'{$r.ProjeAdi}')" class="btn btn-danger btn-xs">{$_UNAPPROVED}</button>

                    {/if}

                  </td>

                  <td>

                    <a href="ProjectDetails.php?id={$r.ProjeID}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> {$VIEW} </a>

                    <a href="#" onclick="projeSil({$r.ProjeID})" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> {$DELETE} </a>

                  </td>

                </tr>

                 {foreachelse}

                  .. {$NO_RESULT} .. 

                  {/foreach}

              </tbody>

            </table>

            <!-- end project list -->



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



<script>  

function onayEkran(id,isim){

  $('#projectName').html(isim);

  $('#projeOnayBtn').attr("onclick","projeOnayla("+id+")");

}



function projeOnayla(id){

  var geriBildirim = $('#geriBildirimTxt').val();

  var status = $('#statusTxt').val();

  $.ajax({

                    type: 'POST',

                    url: 'AJAX/projeOnayla.php',

                    data: 'ID='+ id+'&status='+status+'&geriBildirim='+geriBildirim,

                    success: function (data) {

                      var data = $.parseJSON(data);      

                      if( data.status == 'success' ) {

                        location.reload();

                      }else{

                        location.reload();

                      }

                    },

                    error: function () {

                      alert('ERROR!');

                    }

                  })

}

</script>



{/block}