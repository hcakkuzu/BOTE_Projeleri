{extends file='Proje/_layout.tpl'}

<!-- Index File -->



<!-- Load Lang Files -->

{if $LANG == 'tr'}

    {include file='Proje/_lang_TR.tpl' scope=parent}

    {block name="title"}Proje Veritabanı | BÖTE Projeleri{/block}

{else}

    {include file='Proje/_lang_EN.tpl' scope=parent}

    {block name="title"}Project Database | CEIT Projects{/block}

{/if}





{block name="head"}

    <!-- NProgress -->

    <link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">

    <!-- bootstrap-daterangepicker -->

    <link href="../_Vendors/Proje/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Ion.RangeSlider -->

    <link href="../_Vendors/Proje/normalize-css/normalize.css" rel="stylesheet">

    <link href="../_Vendors/Proje/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">

    <link href="../_Vendors/Proje/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">

    <!-- Bootstrap Colorpicker -->

    <link href="../_Vendors/Proje/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <!-- iCheck -->

    <link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-wysiwyg -->

    <link href="../_Vendors/Proje/google-code-prettify/bin/prettify.min.css" rel="stylesheet">

    <!-- Select2 -->

    <link href=".../_Vendors/Proje/select2/dist/css/select2.min.css" rel="stylesheet">

    <!-- Switchery -->

    <link href="../_Vendors/Proje/switchery/dist/switchery.min.css" rel="stylesheet">

    <!-- starrr -->

    <link href="../_Vendors/Proje/starrr/dist/starrr.css" rel="stylesheet">

    <link href="../_Vendors/Proje/cropper/dist/cropper.min.css" rel="stylesheet">

    <!-- Datatables -->

    <link href="../_Vendors/Proje/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">

    <link href="../_Vendors/Proje/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">

    <link href="../_Vendors/Proje/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">

    <link href="../_Vendors/Proje/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">

    <link href="../_Vendors/Proje/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">





{/block}



{block name="body"}

<!-- page content -->

        <div class="right_col" role="main">

          <div class="">

            <div class="page-title">

              <div class="title_left">

                <h3>{$MENU_DATABASE}</h3>

              </div>

            </div>



            <div class="clearfix"></div>



            <div class="row">

              <div class="col-md-12">



                <!-- form date pickers -->

                <div class="x_panel" style="">

                  <div class="x_title">

                    <h2>{$SEARCH_PROJECT}</h2>

                    <ul class="nav navbar-right panel_toolbox">

                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>

                      </li>

                                         </ul>

                    <div class="clearfix"></div>

                  </div>

                  <div class="x_content">





                    <div class="well" style="overflow: auto">

                      <div class="col-md-10 col-md-offset-1 col-xs-12">



                        <form action="" method="GET" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">



                      

                      <div class="form-group">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="keywordTxt">{$KEYWORD}

                        </label>

                        <div class="col-md-6 col-sm-6 col-xs-12">

                          <input type="text" id="keywordTxt" name="keywordTxt" placeholder="web {$ETC}" required="required" class="form-control col-md-7 col-xs-12">

                        </div>

                      </div>

                      <div class="form-group">

                        <label for="universityTxt" class="control-label col-md-3 col-sm-3 col-xs-12">{$PROF_UNIV}</label>

                        <div class="col-md-6 col-sm-6 col-xs-12">

                          <input id="universityTxt" class="form-control col-md-7 col-xs-12" type="text" placeholder="Trakya {$ETC}" name="universityTxt">

                        </div>

                      </div>


                      <div class="form-group">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12">{$YEAR}

                        </label>

                        <div class="col-md-6 col-sm-6 col-xs-12">

                        <input type="text" id="yearTxt" value="" name="yearTxt" />

                      </div>



                      </div>



                      <div class="ln_solid"></div>

                      <div class="form-group">

                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

                          <button type="reset" class="btn btn-primary">{$RESET}</button>

                          <button type="submit" name="submit" class="btn btn-success">{$SEARCH}</button>

                        </div>

                      </div>



                    </form>

                      </div>

                    </div>

                  </div>

                </div>

                <!-- /form datepicker -->





                

              </div>

            </div>









            <div class="clearfix"></div>

            {if {$Submit}=='true'}  

            <div class="row">



              <div class="col-md-12 col-sm-12 col-xs-12">

                <div class="x_panel">

                  <div class="x_title">

                    <h2>{$SEARCH_RESULT}</h2>

                    <ul class="nav navbar-right panel_toolbox">

                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>

                      </li>

                    </ul>

                    <div class="clearfix"></div>

                  </div>

                  <div class="x_content">

                    <p class="text-muted font-13 m-b-30">

                      {$SEARCH_RESULT_P}

                    </p>

                    <table id="datatable-buttons" class="table table-striped table-bordered">

                      <thead>

                        <tr>

                          <th>No</th>

                          <th>{$YEAR}</th>

                          <th>{$NAME_PLACEHOLDER}</th>

                          <th>{$LEADER}</th>

                          <th>{$PROF_UNIV}</th>

                        </tr>

                      </thead>





                      <tbody>



                        {foreach $AramaSonucu as $r} 

                          <tr>

                            <td>{$r.ProjeID}</td>

                            <td>{$r.Baslangic|date_format:"%Y"}</td>

                            <td><a href="#" onclick="window.open('/Proje/ProjectArchive.php?id={$r.ProjeID}', 'newwindow', 'width=600, height=750'); return false;">{$r.ProjeAdi}</a></td>

                            <td>{$r.Isim}</td>

                            <td>{$r.DersUniversite}</td>


                          </tr>

                        {foreachelse}

                          .. no results .. 

                        {/foreach}

                          

                      </tbody>

                    </table>

                  </div>

                </div>

              </div>



            </div>

            {/if}









          </div>

        </div><!-- /page content -->

{/block}



{block name="footer"}

	<!-- FastClick -->

    <script src="../_Vendors/Proje/fastclick/lib/fastclick.js"></script>

    <!-- NProgress -->

    <script src="../_Vendors/Proje/nprogress/nprogress.js"></script>

    <!-- bootstrap-daterangepicker -->

    <script src="../_Vendors/Proje/moment/min/moment.min.js"></script>

    <script src="../_Vendors/Proje/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Datatables -->

    <script src="../_Vendors/Proje/datatables.net/js/jquery.dataTables.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-buttons/js/dataTables.buttons.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-buttons/js/buttons.flash.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-buttons/js/buttons.html5.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-buttons/js/buttons.print.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-responsive/js/dataTables.responsive.min.js"></script>

    <script src="../_Vendors/Proje/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>

    <script src="../_Vendors/Proje/datatables.net-scroller/js/datatables.scroller.min.js"></script>

    <script src="../_Vendors/Proje/jszip/dist/jszip.min.js"></script>

    <script src="../_Vendors/Proje/pdfmake/build/pdfmake.min.js"></script>

    <script src="../_Vendors/Proje/pdfmake/build/vfs_fonts.js"></script>

        <!-- Ion.RangeSlider -->

    <script src="../_Vendors/Proje/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>

{/block}



{block name="customJs"}

<!-- Datatables -->

    <script>

      $(document).ready(function() {

        var handleDataTableButtons = function() {

          if ($("#datatable-buttons").length) {

            $("#datatable-buttons").DataTable({

              dom: "Bfrtip",

              buttons: [

                {

                  extend: "csv",

                  className: "btn-sm"

                },

                {

                  extend: "excel",

                  className: "btn-sm"

                },

                {

                  extend: "pdfHtml5",

                  className: "btn-sm"

                },

                {

                  extend: "print",

                  className: "btn-sm"

                },

              ],

              responsive: true

            });

          }

        };



        TableManageButtons = function() {

          "use strict";

          return {

            init: function() {

              handleDataTableButtons();

            }

          };

        }();



        $('#datatable').dataTable();



        $('#datatable-keytable').DataTable({

          keys: true

        });



        $('#datatable-responsive').DataTable();



        $('#datatable-scroller').DataTable({

          ajax: "js/datatables/json/scroller-demo.json",

          deferRender: true,

          scrollY: 380,

          scrollCollapse: true,

          scroller: true

        });



        $('#datatable-fixed-header').DataTable({

          fixedHeader: true

        });



        var $datatable = $('#datatable-checkbox');



        $datatable.dataTable({

          'order': [[ 1, 'asc' ]],

          'columnDefs': [

            { orderable: false, targets: [0] }

          ]

        });

        $datatable.on('draw.dt', function() {

          $('input').iCheck({

            checkboxClass: 'icheckbox_flat-green'

          });

        });



        TableManageButtons.init();

      });

    </script>

    <!-- /Datatables -->



 <!-- Ion.RangeSlider -->

    <script>

      $(document).ready(function() {



        $("#yearTxt").ionRangeSlider({

          hide_min_max: false,

          keyboard: true,

          min: 2000,

          max:  {'Y'|date},

          from: 2000,

          to:  {'Y'|date},

          type: 'double',

          step: 1,

          prefix: "",

          grid: true,

          prettify_enabled: false

        });





      

      });

    </script>

    <!-- /Ion.RangeSlider -->



<!-- bootstrap-daterangepicker -->

    <script>

      $(document).ready(function() {

        var cb = function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

          $('#reportrange_right span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

        };



        var optionSet1 = {

          startDate: moment().subtract(29, 'days'),

          endDate: moment(),

          minDate: '01/01/200',

          maxDate: '12/31/2099',



          showDropdowns: true,

          showWeekNumbers: true,

          timePicker: false,

          timePickerIncrement: 1,

          timePicker12Hour: true,

          ranges: {

            'Today': [moment(), moment()],

            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],

            'Last 7 Days': [moment().subtract(6, 'days'), moment()],

            'Last 30 Days': [moment().subtract(29, 'days'), moment()],

            'This Month': [moment().startOf('month'), moment().endOf('month')],

            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]

          },

          opens: 'right',

          buttonClasses: ['btn btn-default'],

          applyClass: 'btn-small btn-primary',

          cancelClass: 'btn-small',

          format: 'MM/DD/YYYY',

          separator: ' to ',

          locale: {

            applyLabel: 'Submit',

            cancelLabel: 'Clear',

            fromLabel: 'From',

            toLabel: 'To',

            customRangeLabel: 'Custom',

            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],

            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],

            firstDay: 1

          }

        };



        $('#reportrange_right span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));



        $('#reportrange_right').daterangepicker(optionSet1, cb);



        $('#reportrange_right').on('show.daterangepicker', function() {

          console.log("show event fired");

        });

        $('#reportrange_right').on('hide.daterangepicker', function() {

          console.log("hide event fired");

        });

        $('#reportrange_right').on('apply.daterangepicker', function(ev, picker) {

          console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));

        });

        $('#reportrange_right').on('cancel.daterangepicker', function(ev, picker) {

          console.log("cancel event fired");

        });



        $('#options1').click(function() {

          $('#reportrange_right').data('daterangepicker').setOptions(optionSet1, cb);

        });



        $('#options2').click(function() {

          $('#reportrange_right').data('daterangepicker').setOptions(optionSet2, cb);

        });



        $('#destroy').click(function() {

          $('#reportrange_right').data('daterangepicker').remove();

        });



      });

    </script>



    <script>

      $(document).ready(function() {

        var cb = function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

        };



        var optionSet1 = {

          startDate: moment().subtract(29, 'days'),

          endDate: moment(),

          minDate: '01/01/2012',

          maxDate: '12/31/2020',

          dateLimit: {

            days: 60

          },

          showDropdowns: true,

          showWeekNumbers: true,

          timePicker: false,

          timePickerIncrement: 1,

          timePicker12Hour: true,

          ranges: {

            'Today': [moment(), moment()],

            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],

            'Last 7 Days': [moment().subtract(6, 'days'), moment()],

            'Last 30 Days': [moment().subtract(29, 'days'), moment()],

            'This Month': [moment().startOf('month'), moment().endOf('month')],

            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]

          },

          opens: 'left',

          buttonClasses: ['btn btn-default'],

          applyClass: 'btn-small btn-primary',

          cancelClass: 'btn-small',

          format: 'MM/DD/YYYY',

          separator: ' to ',

          locale: {

            applyLabel: 'Submit',

            cancelLabel: 'Clear',

            fromLabel: 'From',

            toLabel: 'To',

            customRangeLabel: 'Custom',

            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],

            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],

            firstDay: 1

          }

        };

        $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));

        $('#reportrange').daterangepicker(optionSet1, cb);

        $('#reportrange').on('show.daterangepicker', function() {

          console.log("show event fired");

        });

        $('#reportrange').on('hide.daterangepicker', function() {

          console.log("hide event fired");

        });

        $('#reportrange').on('apply.daterangepicker', function(ev, picker) {

          console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));

        });

        $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {

          console.log("cancel event fired");

        });

        $('#options1').click(function() {

          $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);

        });

        $('#options2').click(function() {

          $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);

        });

        $('#destroy').click(function() {

          $('#reportrange').data('daterangepicker').remove();

        });

      });

    </script>



    <script>

      $(document).ready(function() {

        $('#single_cal1').daterangepicker({

          singleDatePicker: true,

          singleClasses: "picker_1"

        }, function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

        });

        $('#single_cal2').daterangepicker({

          singleDatePicker: true,

          singleClasses: "picker_2"

        }, function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

        });

        $('#single_cal3').daterangepicker({

          singleDatePicker: true,

          singleClasses: "picker_3"

        }, function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

        });

        $('#single_cal4').daterangepicker({

          singleDatePicker: true,

          singleClasses: "picker_4"

        }, function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

        });

      });

    </script>



    <script>

      $(document).ready(function() {

        $('#reservation').daterangepicker(null, function(start, end, label) {

          console.log(start.toISOString(), end.toISOString(), label);

        });



        $('#reservation-time').daterangepicker({

          timePicker: true,

          timePickerIncrement: 30,

          locale: {

            format: 'MM/DD/YYYY h:mm A'

          }

        });

      });

    </script>

    <!-- /bootstrap-daterangepicker -->



{/block}