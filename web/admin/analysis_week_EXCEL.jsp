<%-- 
    Document   : analysis_week_EXCEL
    Created on : Sep 18, 2015, 1:55:49 PM
    Author     : yogesh
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page import="com.nawandarfilmes.commonUtility.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            int srno = 0;
            double global_Mg = 0;
            double global_amtRecv = 0;
            double global_diffrence = 0;
            double global_distributer_profit = 0;
            double deduction = 0;
            Common common = new Common();
            int mov_id = common.getMovie_ID();
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            Criteria mov_criteria = hib_session.createCriteria(MovieDetail.class);
            mov_criteria.add(Restrictions.eq("movId", mov_id));
            MovieDetail movieDetail = (MovieDetail) mov_criteria.list().get(0);
            Criteria wo_criteria = hib_session.createCriteria(WorkOrder.class);
            wo_criteria.add(Restrictions.eq("movieDetail", movieDetail));


            Date start_Date = movieDetail.getMovReleaseDate();
            Date end_Date = common.get_Last_End_Date(mov_id);
            int days_from_two = common.getDays(end_Date, start_Date);
            String distri_Print = "";
            Date temp_Date = null;
            List date_List = new ArrayList();
            List date_bean_List = new ArrayList();
            HashMap<String, DistributerProfit_Bean> date_Map = new HashMap<String, DistributerProfit_Bean>();

            double grand_Total = 0;


            DistributerProfit_Bean dp_b = new DistributerProfit_Bean();
            dp_b.setAmount(0);
            dp_b.setId(common.formateDate(start_Date) + "distritotal");
            date_Map.put(common.formateDate(start_Date) + "distritotal", dp_b);

            //--neettotal

            DistributerProfit_Bean dp_t = new DistributerProfit_Bean();
            dp_t.setAmount(0);
            dp_t.setId(common.formateDate(start_Date) + "neettotal");
            date_Map.put(common.formateDate(start_Date) + "neettotal", dp_t);

            //--Create Table            
            String th = "";
            String tr = "";
            date_List.add(start_Date);
            String temp_tr = "<tr align='center'><td style=\"min-width:23px;\"><b>Sr.No</b></td><td style=\"min-width:75px;\"><b>Theater Name</b></td><td style=\"min-width:75px;\"><b>Agrrement Type</b></td>";
            th = th + "<tr><td colspan=\"3\" align='center'><b>Days</b></td><td  colspan=\"2\" align='center' style=\"min-width: 150px;\"><b>" + common.formateDate(start_Date) + "</b></td>";
            for (int i = 1; i < days_from_two; i++) {
                Calendar c = Calendar.getInstance();
                c.setTime(start_Date); // Now use today date.
                c.add(Calendar.DATE, i);
                temp_Date = c.getTime();
                date_List.add(temp_Date);
                DistributerProfit_Bean dpb = new DistributerProfit_Bean();
                dpb.setAmount(0);
                dpb.setId(common.formateDate(temp_Date) + "distritotal");
                date_Map.put(common.formateDate(temp_Date) + "distritotal", dpb);


                DistributerProfit_Bean dpt = new DistributerProfit_Bean();
                dpt.setAmount(0);
                dpt.setId(common.formateDate(temp_Date) + "neettotal");
                date_Map.put(common.formateDate(temp_Date) + "neettotal", dpt);

                th = th + "<td colspan=\"2\" align='center' style=\"min-width: 130px;\"><b>" + common.formateDate(temp_Date) + "</b></td>";
                temp_tr = temp_tr + "<td><b>G.P</b></td><td><b>D.P</b></td>";
            }
            temp_tr = temp_tr + "<td><b>G.P</b></td><td><b>D.P</b></td><td style=\"min-width: 130px;\" align='center'><b>Distributer Profit</b></td><td style=\"min-width: 130px;\" align='center'><b>Payment Received</b></td><td style=\"min-width: 130px;\" align='center'><b>Diffrence</b></td></tr>";
            th = th + "</tr>" + temp_tr;
            //--Create Table

            for (Object wo_obj : wo_criteria.list()) {
                WorkOrder wo = (WorkOrder) wo_obj;
                Common com = new Common();
                String agrrement_Type = "";
                double total = 0;
                double rent = 0;
                double nett_amt = 0;
                double amt_recv = common.getPaymentReceived(wo);
                List rent_Date_list = new ArrayList();
                global_amtRecv = global_amtRecv + amt_recv;
                if (wo.getWoMg()) {
                    total = total + wo.getWoMgAmount();
                    global_Mg = global_Mg + wo.getWoMgAmount();
                }
                int wo_id = wo.getWoId();
                if (wo.getWoRent()) {
                    agrrement_Type = "RENT";
                } else if (wo.getWoMg()) {
                    agrrement_Type = "MG";
                } else {
                    agrrement_Type = "Sharing";
                }
                tr = tr + "<tr><td align='center'>" + (++srno) + "</td><td align='center'>" + wo.getTheaterDetail().getTName() + "</td><td align='center'>" + agrrement_Type + "</td>";
                for (Object date_obj : date_List) {
                    Date tr_date = (Date) date_obj;
                    tr = tr + "<td id='" + common.formateDate(tr_date) + wo_id + "total' align='right'></td><td id='" + common.formateDate(tr_date) + wo_id + "dis' align='right'></td>";
                }

                Criteria ptl_criteria = hib_session.createCriteria(ProfitTicketLog.class);
                ptl_criteria.add(Restrictions.eq("workOrder", wo));
                ptl_criteria.add(Restrictions.between("logDate", start_Date, end_Date));

                for (Object ptl_obj : ptl_criteria.list()) {
                    ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;
                    DateBean db = new DateBean();
                    db.setId("" + common.formateDate(ptl.getLogDate()) + wo_id + "total");
                    db.setAmount(ptl.getNettProfit() + "");
                    date_bean_List.add(db);
                    nett_amt += ptl.getNettProfit();
                    //--Load Aggrement
                    Criteria aggre_criteria = hib_session.createCriteria(WoAgrrement.class);
                    aggre_criteria.add(Restrictions.eq("workOrder", wo));

                    for (Object agree_obj : aggre_criteria.list()) {
                        WoAgrrement wa = (WoAgrrement) agree_obj;
                        int days = common.getDays(wa.getEndDate(), wa.getStartDate());
                        if (common.checkAggrement(wa.getStartDate(), wa.getEndDate(), ptl.getLogDate())) {
                            double mg_amount = wo.getWoMgAmount();
                            double amount = 0;
                            double th_rent = wa.getTheaterRent();
                            double deduct=common.getDeducedRent(wa);
                            if (wo.getWoRent()||wo.getWoMg()) {
                                th_rent -= common.getDeducedRent(wa);
                            }
                            //--com is object define at line no 101 specially use for MG
                            amount = com.getDistributerProfit(wo.getWoRent(), wo.getWoSharing(), wo.getWoMg(), wa.getTheaterRent(), wa.getDistributerShare(), mg_amount, ptl.getNettProfit(), true, days,deduct);
                            if (wo.getWoSharing()) {
                                amount -= (amount / 100) * 1;
                            }
                            if (wo.getWoSharing()) {
                                global_distributer_profit += amount;
                            }
                            total += amount;
                            if (!(rent_Date_list.contains(wa.getEndDate()))) {
                                rent += th_rent;
                                rent_Date_list.add(wa.getEndDate());
                                rent_Date_list.add(wa.getEndDate());
                            }

                            DateBean bean = new DateBean();
                            bean.setAmount(amount + "");
                            bean.setId(common.formateDate(ptl.getLogDate()) + wo_id + "dis");
                            date_bean_List.add(bean);
                            DistributerProfit_Bean dpb = date_Map.get(common.formateDate(ptl.getLogDate()) + "distritotal");
                            dpb.setAmount(amount);
                            //--neettotal
                            DistributerProfit_Bean dpt = date_Map.get(common.formateDate(ptl.getLogDate()) + "neettotal");
                            dpt.setAmount(ptl.getNettProfit());
                            break;
                        }
                    }//--Aggrement Loop
                }//--PTL Loop
                if (wo.getWoRent()||wo.getWoMg()) {
                    deduction = (nett_amt / 100) * 1;
                    total = (nett_amt - deduction) - rent;
                    global_distributer_profit += total;
                }
                tr = tr + "<td align='right'>" + (long) total + "</td><td align='right'>" + (long) amt_recv + "</td><td align='right'>" + (long) (total - amt_recv) + "</td></tr>";
                global_diffrence = global_diffrence + (total - amt_recv);
            }//--Work Order Loop
            tr = tr + "<tr><td colspan=\"3\" align='center'><b>Grand Total</b></td></td>";

            for (Object date_obj : date_List) {
                Date tr_date = (Date) date_obj;
                tr = tr + "<td id='" + common.formateDate(tr_date) + "neettotal' align='right'></td><td id='" + common.formateDate(tr_date) + "distritotal' align='right'>00</td>";
            }
            for (Map.Entry m : date_Map.entrySet()) {
                DistributerProfit_Bean dpb = (DistributerProfit_Bean) m.getValue();
                distri_Print = distri_Print + "$('#" + dpb.getId() + "').html('" + (long) dpb.getAmount() + "');";
                grand_Total = grand_Total + dpb.getAmount();
            }
            tr = tr + "<td align='right'>" + (long) (global_distributer_profit + global_Mg) + "</td><td align='right'>" + (long) (global_amtRecv) + "</td><td align='right'>" + (long) (global_diffrence) + "</td></tr>";
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Excel Analysis</title>

    <jsp:include page="header1.jsp"/>

    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,'
            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
            , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
            , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
            return function (table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>


    <%@ include file="headermenu.jsp" %>
    <%@ include file="sidebar.jsp" %>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Movie Details
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Movie Details</li>
            </ol>
        </section>


        <section class="content">

            <!-- SELECT2 EXAMPLE -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">About Movie : <% out.print(movieDetail.getMovName());%></h3>

                </div><!-- /.box-header -->
                <section class="invoice">
                    <h4>G.P : Gross Profit<br>D.P : Distributer Profit</h4>

                    <div class="row no-print">
                        <div class="col-xs-12">
                            <form action="analysis_from_to_date.jsp" method="post">
                                <!--  Start Date:<input type="date" name="start_date">&nbsp;&nbsp;End Date:<input type="date" name="end_date">&nbsp;&nbsp;
                                  <button type="submit" class="btn btn-primary">Submit</button>
                              </form>-->
                                <div class="col-xs-3" style="width:20%;">
                                    <div class="form-group">
                                        <label>Select Movie</label>
                                        <select class="form-control" name="mov_id">

                                            <%
                                                Criteria criteria = hib_session.createCriteria(MovieDetail.class);
                                                for (Object o : criteria.list()) {
                                                    MovieDetail md = (MovieDetail) o;
                                                    out.print("<option value=\"" + md.getMovId() + "\">" + md.getMovName() + "</option>");
                                                }

                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-3" style="width:20%;">
                                    <label>Start Date</label>
                                    <input type="date" class="form-control" name="start_date">
                                </div>
                                <div class="col-xs-3" style="width:20%;">
                                    <label>End Date</label>
                                    <input type="date" class="form-control" name="end_date">
                                </div>
                                <div class="col-xs-3" style="width:10%;">
                                    <label><br></label>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                                <label><br></label>
                                <br>
                                <button type="button" class="btn btn-success pull-right" onclick="tableToExcel('testTable', 'Nawander Film Distibution')"><i class="fa fa-credit-card"></i> Generate Excel</button>
                                <button type="button" class="btn btn-primary pull-right" onclick="downloadPdf()" style="margin-right: 5px;"><i class="fa fa-download"></i> Generate PDF</button>
                        </div>
                    </div>
                </section>
                <div class="box-body">

                    <div class="box-body table-responsive no-padding">





                        <div  style="overflow-x: scroll;">
                            <table id="testTable" class="table table-bordered table-hover" summary="Code page support in different versions of MS Windows."
                                   rules="groups" frame="hsides" border="2" align="center" style="width: 100%">

                                <% out.print(th + tr);%>

                            </table>
                        </div>
                    </div>
                </div>
            </div><!-- /.box-body -->


        </section>
    </div>


    <%@ include file="footer.jsp" %>


    <!-- Bootstrap 3.3.5 -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>
    <script>
        <%
                for (Object date_obj : date_bean_List) {
                    DateBean db = (DateBean) date_obj;
                    out.print("$('#" + db.getId() + "').html('" + (long) Double.parseDouble(db.getAmount()) + "');");
                }

                out.print(distri_Print);
                hib_session.close();
            } catch (Exception e) {
                out.print(e);
            }
        %>
           
    </script>

</body>

</html>
