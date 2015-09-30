<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">

    <jsp:include page="header.jsp"/>
    <jsp:include page="sidebar.jsp"/>
    

    <%
        String p_id = request.getParameter("p_id").toString();
        String s_id = request.getParameter("s_id").toString();
        String m_id = request.getParameter("m_id").toString();
        String t_id = request.getParameter("t_id").toString();

        String p_name = request.getParameter("p_name").toString();
        String p_phone = request.getParameter("p_phone").toString();

        String t_name = request.getParameter("t_name").toString();
        String t_phone = request.getParameter("t_phone").toString();
        String s_name = request.getParameter("s_name").toString();
        String s_no = request.getParameter("s_no").toString();
    %>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Invoice
                <small><% out.print(p_id);%></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"><% out.print(p_name);%></a></li>
                <li class="active"><% out.print(t_name);%></li>
            </ol>
        </section>



        <!-- Main content -->
        <section class="invoice">
            <!-- title row -->
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i> Welcome Back.
                        <small class="pull-right">Date: <%= new java.util.Date()%></small>
                    </h2>
                </div><!-- /.col -->
            </div>
            <!-- info row -->
            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                    <address>
                        <b>Party Details</b><br>
                        <br>
                        <b>Party ID:</b>  <% out.print(p_id);%><br>
                        <b>Party Name:</b> <% out.print(p_name);%><br>
                        <b>Mobile No:</b> <% out.print(p_phone);%><br>
                        <b>Address:</b> Address<br>
                        <b>Email Id:</b> sadlogic@gmail.com
                    </address>
                </div><!-- /.col -->
                <div class="col-sm-4 invoice-col">
                    <address>
                        <b>Theater Details</b><br>
                        <br>
                        <b>Theater ID:</b> <% out.print(t_id);%><br>
                        <b>Theater Name:</b> <% out.print(t_name);%><br>
                        <b>Address:</b> Subham Nagar, Hingna, Nagpur<br>
                        <b>Mobile No:</b><% out.print(t_phone);%><br>
                        <b>Screen Type:</b> Single
                    </address>
                </div><!-- /.col -->
                <div class="col-sm-4 invoice-col">
                    <b>Screen Details</b><br>
                    <br>
                    <b>Screen ID:</b> <% out.print(s_id);%><br>
                    <b>Screen Name:</b> <% out.print(s_name);%><br>
                    <b>Total Seats:</b> <% out.print(s_no);%>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <html:form action="/add_workorder">
                <div class="row">
                    <!-- accepted payments column -->
                    <input type="password" hidden="" name="p_id" value="<% out.print(p_id);%>"/><input type="password" hidden="" name="t_id" value="<% out.print(t_id);%>"/><input type="password" hidden="" name="s_id" value="<% out.print(s_id);%>"/><input type="password" hidden="" name="mov_id" value="<% out.print(m_id);%>"/>
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i> Theater Agreement Details
                        <small class="pull-right">Date: <%= new java.util.Date()%></small>
                    </h2>
                </div>
                   
            
                <div class="box-body">
                    <div class="row">

                        <div class="box box-primary">
                            <div class="col-md-6">
                                <div class="box-header">
                                    <h3 class="box-title">Select Start and end date:</h3>
                                </div>
                                <div class="box-body">
                                    <!-- Date range -->
                                    <div class="form-group">
                                        <label>Start Date :</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <!-- <input type="text" class="form-control pull-right" id="reservation">-->
                                            <input  type="date" name="start_date" id="start_date">
                                        </div><!-- /.input group -->
                                    </div><!-- /.form group -->

                                    <div class="form-group">
                                        <label>End Date:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>

                                            <input  type="date" id="end_date" name="end_date" onchange="parseDate();">
                                        </div><!-- /.input group -->
                                    </div><!-- /.form group -->


                                </div><!-- /.box-body -->
                            </div>

                            <div class="col-md-6">
                                <div class="box-header">
                                    <h3 class="box-title">Total Days and Week:</h3>
                                </div>
                                <div class="form-group">
                                    <label>Total Days:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" id="total_days" class="form-control" disabled="disabled" data-mask>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->

                                <div class="form-group">
                                    <label>Total Week:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" value="1" disabled="disabled" data-mask>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                                <div class="form-group">
                                    <label>Show Per Week:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" name="shows_per_day" value="4"  data-mask>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->


                            </div>
                        </div><!-- /.box -->



                    </div>
                </div>

                    <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-xs-6">
                        <p class="lead">Agreement Type:</p>
                      
                    
                  <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width:50%">Choose one:</th>
                                    <td><div class="form-group">
                                         <select class="form-control select2" style="width: 100%;" id="ddlCategory" name="wo_type">
                                            <option selected="selected" value="sharing">Sharing</option>
                                            <option value="rent">Rent</option>
                                            <option value="mg">MG(Minimal Guarantee)</option>
                                            
                                        </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="pm" style="display: none">
                                    <th style="width:50%">Payment Method:</th>
                                    <td><div class="form-group">
                                         <select id="paymeth" name="payment_Method" class="form-control select2" style="width: 100%;">
                                            <option selected="selected" value="cash">CASH</option>
                                            <option value="neft">NEFT</option>
                                            <option value="rtgs">RTGS</option>
                                            <option value="cheque">CHEQUE</option>
                                        </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="mga" style="display: none">
                                    <th style="width:50%">MG Amount:</th>
                                    <td><div class="form-group">
                                          <input type="text" name="mg_amount" value="00" class="form-control" placeholder="MG Amount ...">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="dn" style="display: none">
                                    <th>Depositor Name:</th>
                                    <td><div class="form-group">
                                          <input type="text" name="depositor_name" class="form-control" placeholder="Depositor Name ...">
                                        </div></td>
                                </tr>
                                <tr id="ar" style="display: none">
                                    <th>Amount Received:</th>
                                    <td><div class="form-group">
                                          <input type="text" name="amount_recv" value="00" class="form-control" placeholder="Amount Received ...">
                                        </div></td>
                                </tr>
                                
                            </table>
                        </div>
                  
                  
                  
                  
                    </div><!-- /.col -->
                    <div class="col-xs-6">
                        <p class="lead"><br></p>
                        <div class="table-responsive">
                            <table class="table">
                                <tr id="utr" style="display: none">
                                    <th style="width:50%">UTR No:</th>
                                    <td><div class="form-group">
                                          <input type="text" name="utr_no" value="00" class="form-control" placeholder="UTR No ...">
                                        </div></td>
                                </tr>
                                <tr id="cn" style="display: none">
                                    <th>Cheque No.:</th>
                                    <td><div class="form-group">
                                          <input type="text" name="cheaque_no" value="00" class="form-control" placeholder="Cheque No">
                                        </div></td>
                                </tr>
                                <tr id="bn" style="display: none">
                                    <th>Bank Name:</th>
                                    <td><div class="form-group">
                                          <input type="text" name="bank_name" class="form-control" placeholder="Bank Name">
                                        </div></td>
                                </tr>
                                <tr id="ard" style="display: none">
                                    <th>Amount Received Date:</th>
                                    <td><div class="form-group">
                                          <input type="date" name="amount_recv_date" class="form-control" placeholder="Amount Received Date">
                                        </div></td>
                                </tr>
                                <tr id="art" style="display: none">
                                    <th>Amount Received Time:</th>
                                    <td><div class="form-group">
                                          <input type="time" name="amount_recv_time" class="form-control" placeholder="Amount Received Time">
                                        </div></td>
                                </tr>
                            </table>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->


                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Week</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Theater Rent</th>
                                    <th>Distributor Share</th>
                                    <th>Owner Share</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="1week">1 Week</td>
                                    <td id="1start"></td>
                                    <td id="1end"></td>
                                    <td><div class="input-group">
                                            <input type="text" hidden=""  name="d_1" id="1detil">
                                            <input type="text" class="form-control" value="00" name="t1_rent">
                                            <span class="input-group-addon">Rs.</span>
                                        </div></td>
                                    <td style="width:30%;"> <div class="input-group">
                                            <input type="text" class="form-control" value="00" name="distr1_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                    <td style="width:30%;"><div class="input-group">
                                            <input type="text" class="form-control" value="00" name="owner1_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="2week">2 Week</td>
                                    <td id="2start"></td>
                                    <td id="2end"></td>
                                    <td><div class="input-group">
                                            <input type="text" hidden=""  name="d_2" id="2detil">
                                            <input type="text" class="form-control" value="00" name="t2_rent">
                                            <span class="input-group-addon">Rs.</span>
                                        </div></td>
                                    <td style="width:30%;"> <div class="input-group">
                                            <input type="text" class="form-control" value="00" name="distr2_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                    <td style="width:30%;"><div class="input-group">
                                            <input type="text" class="form-control" value="00" name="owner2_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="1week">3 Week</td>
                                    <td id="3start"></td>
                                    <td id="3end"></td>
                                    <td><div class="input-group">
                                            <input type="text" hidden=""  name="d_3" id="3detil">
                                            <input type="text" class="form-control" value="00" name="t3_rent">
                                            <span class="input-group-addon">Rs.</span>
                                        </div></td>
                                    <td style="width:30%;"> <div class="input-group">
                                            <input type="text" class="form-control" value="00" name="distr3_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                    <td style="width:30%;"><div class="input-group">
                                            <input type="text" class="form-control" value="00" name="owner3_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td id="1week">4 Week</td>
                                    <td id="4start"></td>
                                    <td id="4end"></td>
                                    <td><div class="input-group">
                                            <input type="text" hidden=""  name="d_4" id="4detil">
                                            <input type="text" class="form-control" value="00" name="t4_rent">
                                            <span class="input-group-addon">Rs.</span>
                                        </div></td>
                                    <td style="width:30%;"> <div class="input-group">
                                            <input type="text" class="form-control" value="00" name="distr4_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                    <td style="width:30%;"><div class="input-group">
                                            <input type="text" class="form-control" value="00" name="owner4_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="1week">5 Week</td>
                                    <td id="5start"></td>
                                    <td id="5end"></td>
                                    <td><div class="input-group">
                                            <input type="text" hidden=""  name="d_5" id="5detil">
                                            <input type="text" class="form-control" value="00" name="t5_rent">
                                            <span class="input-group-addon">Rs.</span>
                                        </div></td>
                                    <td style="width:30%;"> <div class="input-group">
                                            <input type="text" class="form-control" value="00" name="distr5_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                    <td style="width:30%;"><div class="input-group">
                                            <input type="text" class="form-control" value="00" name="owner5_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="1week">6 Week</td>
                                    <td id="6start"></td>
                                    <td id="6end"></td>
                                    <td><div class="input-group">
                                            <input type="text" hidden=""  name="d_6" id="6detil">
                                            <input type="text" class="form-control" value="00" name="t6_rent">
                                            <span class="input-group-addon">Rs.</span>
                                        </div></td>
                                    <td style="width:30%;"> <div class="input-group">
                                            <input type="text" class="form-control" value="00" name="distr6_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                    <td style="width:30%;"><div class="input-group">
                                            <input type="text" class="form-control" value="00" name="owner6_share">
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div><!-- /.col -->
                </div><!-- /.row -->

                <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-xs-6">
                       <div class="col-xs-3" style="width:50%;">
                       <label>
                          <input type="radio" name="woSentEmail" id="optionsRadios1" value="option1" checked>
                          Received Payment and Send Email Notification
                        </label>
                    </div>
                    <div class="col-xs-4" style="width:50%;">
                      <label>
                          <input type="radio" name="woSentEmail" id="optionsRadios2" value="option2">
                          Payment Not Received Yet
                        </label>
                    </div>
                    </div><!-- /.col -->
                    <div class="col-xs-6">
                        
                    </div><!-- /.col -->
                </div><!-- /.row -->

                <!-- this row will not appear when printing -->
                <div class="row no-print">
                    <div class="col-xs-12">
                       
                        <button type="submit" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment</button>
                        
                    </div>
                </div>
            </html:form>
        </section><!-- /.content -->
        <!-- Main content -->

    </div><!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2015 <a href="#">Nawendar Film Studio</a>.</strong> All rights reserved.
    </footer>

    <!-- Control Sidebar -->

    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div><!-- ./wrapper -->

<!-- jQuery 2.1.4 -->
<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page script -->
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
        {
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            startDate: moment().subtract(29, 'days'),
            endDate: moment()
        },
        function (start, end) {
            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
            showInputs: false
        });
    });
      
      
    function parseDate(){
        for(var j=1;i<=6;i++){
            $("#"+i+"week").html("");
        }
        var s=$("#start_date").val().split("-");
        var e=$("#end_date").val().split("-");
               
        var ONE_DAY = 1000 * 60 * 60 * 24;
                
        var s_year=s[0];
        var s_date=s[2];   
        var s_month=s[1]-1;
                
        var e_year=e[0];
        var e_date=e[2];   
        var e_month=e[1]-1;
                
        var start_date = new Date();
        start_date.setDate(s_date);
        start_date.setMonth(s_month);
        start_date.setFullYear(s_year);
                
        var end_date = new Date();
        end_date.setDate(e_date);
        end_date.setMonth(e_month);
        end_date.setFullYear(e_year);
                
        // Calculate the difference in milliseconds
        var difference_ms = Math.abs(start_date - end_date);
        var days=Math.round(difference_ms/ONE_DAY)+1;
        $("#total_days").val(days);
        var weeksAry=(days/7)+"".split(".");
        var weeks=weeksAry[0];
        var daysAry=(days%7)+"".split(".");
        var weeks_days=daysAry[0];
                
        weeks=parseInt(weeks);
        weeks_days=parseInt(weeks_days);
        for(var i=1;i<=weeks;i++){
            var date="";
            date=date+start_date+" To ";
            $("#"+i+"start").html((""+start_date).substring(4,15));
            start_date.setDate(start_date.getDate() +6);                   
            date=date+start_date;
            //$("#"+i+"week").html("Week "+i+" Detail: "+date);                    
            $("#"+i+"end").html((""+start_date).substring(4,15));
            start_date.setDate(start_date.getDate() +1);
                    
            $("#"+i+"detil").val(date);
                    
        }
                
        if(weeks_days>=1){
            $("#"+(weeks+1)+"start").html((""+start_date).substring(4,15));
            var date=start_date+"";
            start_date.setDate(start_date.getDate() +(weeks_days-1));
            date=date+" To "+start_date;
            // $("#"+(weeks+1)+"week").html("Last "+weeks_days+" Days Detail: "+date);
            
            $("#"+(weeks+1)+"end").html((""+start_date).substring(4,15));
                    
            $("#"+i+"detil").val(date);
                    
        }
               
               
    }
    
  
   
        $(document).ready(function () {
            $('#ddlCategory').change(function () {
                if (this.value == "mg") {
                    $('#pm').show();
                    //$('#mga').show();
                    $('#dn').show();
                    $('#ar').show();
                    //$('#utr').show();
                    //$('#cn').show();
                    //$('#bn').show();
                    $('#ard').show();
                    $('#art').show();
                } else {
                    $('#pm').hide();
                    $('#mga').hide();
                    $('#dn').hide();
                    $('#ar').hide();
                    $('#utr').hide();
                    $('#cn').hide();
                    $('#bn').hide();
                    $('#ard').hide();
                    $('#art').hide();
                }

            });
            
            $('#paymeth').change(function () {
                if (this.value == "neft"||this.value == "rtgs") {
                    $('#pm').show();
                    //$('#mga').show();
                    $('#dn').show();
                    $('#ar').show();
                    $('#utr').show();
                    //$('#cn').show();
                    //$('#bn').show();
                    $('#ard').show();
                    $('#art').show();
                } else {
                    
                    $('#utr').hide();
                    
                }
                if (this.value == "cheque") {
                    $('#pm').show();
                    //$('#mga').show();
                    $('#dn').show();
                    $('#ar').show();
                    //$('#utr').show();
                    $('#cn').show();
                    $('#bn').show();
                    $('#ard').show();
                    $('#art').show();
                } else {
                    
                    //$('#utr').hide();
                    $('#cn').hide();
                    $('#bn').hide();
                    
                }
                

            });
            
            
        });
        
</script>
</body>
</html:html>

