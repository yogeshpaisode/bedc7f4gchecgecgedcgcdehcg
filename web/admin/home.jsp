<%-- 
    Document   : index
    Created on : Sep 10, 2015, 2:05:11 AM
    Author     : Satyapal
--%>

<!DOCTYPE html>

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
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<%

    double global_Mg = 0;
    double global_amtRecv = 0;
    double global_diffrence = 0;
    double global_distributer_profit = 0;
    Common common = new Common();
    int mov_id=common.getMovie_ID();
    String chart = "";
    String day_chart = "";
    String circuit_chart = "";
    String movie_name="";
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session hib_session = sessionFactory.openSession();
    Criteria mov_criteria = hib_session.createCriteria(MovieDetail.class);
    mov_criteria.add(Restrictions.eq("movId",mov_id));
    MovieDetail movieDetail = (MovieDetail) mov_criteria.list().get(0);
    movie_name=movieDetail.getMovName();
    Criteria wo_criteria = hib_session.createCriteria(WorkOrder.class);
    wo_criteria.add(Restrictions.eq("movieDetail", movieDetail));
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date start_Date = movieDetail.getMovReleaseDate();
    Date end_Date = common.get_Last_End_Date(mov_id);
    int days_from_two = common.getDays(end_Date, start_Date);
    Date temp_Date = null;
    HashMap<String, DistributerProfit_Bean> date_Map = new HashMap<String, DistributerProfit_Bean>();
    HashMap<String, Days_Bean> week_days_Map = new HashMap<String, Days_Bean>();
    HashMap<String, Circuit_Bean> circuit_Map = new HashMap<String, Circuit_Bean>();
    List date_List = new ArrayList();
    List week_days_list = new ArrayList();
    week_days_list.add("Fri");
    week_days_list.add("Sat");
    week_days_list.add("Sun");
    week_days_list.add("Mon");
    week_days_list.add("Tue");
    week_days_list.add("Wed");
    week_days_list.add("Thu");
    List circuit_list = new ArrayList();

    for (Object o : week_days_list) {
        Days_Bean ben = new Days_Bean();
        ben.setAmount(0);
        ben.setId(o.toString());
        week_days_Map.put(o.toString(), ben);
    }

    double grand_Total = 0;


    DistributerProfit_Bean dp_b = new DistributerProfit_Bean();
    dp_b.setAmount(0);
    dp_b.setId(common.formateDate(start_Date));
    date_Map.put(common.formateDate(start_Date), dp_b);
    date_List.add(common.formateDate(start_Date));

    for (int i = 1; i < days_from_two; i++) {
        Calendar c = Calendar.getInstance();
        c.setTime(start_Date); // Now use today date.
        c.add(Calendar.DATE, i);
        temp_Date = c.getTime();
        date_List.add(common.formateDate(temp_Date));
        DistributerProfit_Bean dpb = new DistributerProfit_Bean();
        dpb.setAmount(0);
        dpb.setId(common.formateDate(temp_Date));
        date_Map.put(common.formateDate(temp_Date), dpb);

    }
    //--Create Table

    for (Object wo_obj : wo_criteria.list()) {
        WorkOrder wo = (WorkOrder) wo_obj;
        PartyDetail pd = wo.getPartyDetail();
        String circuit = pd.getPCircuit();
        if (!(circuit_list.contains(circuit))) {
            Circuit_Bean ben = new Circuit_Bean();
            ben.setAmount(0);
            ben.setId(circuit);
            circuit_Map.put(circuit, ben);
            circuit_list.add(circuit);
        }
        Common com = new Common();
        double total = 0;
        double amt_recv = common.getPaymentReceived(wo);
        global_amtRecv = global_amtRecv + amt_recv;
        if (wo.getWoMg()) {
            total = total + wo.getWoMgAmount();
            global_Mg = global_Mg + wo.getWoMgAmount();
        }
        Criteria ptl_criteria = hib_session.createCriteria(ProfitTicketLog.class);
        ptl_criteria.add(Restrictions.eq("workOrder", wo));
        ptl_criteria.add(Restrictions.between("logDate", start_Date, end_Date));

        for (Object ptl_obj : ptl_criteria.list()) {
            ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;
            //--Load Aggrement
            Criteria aggre_criteria = hib_session.createCriteria(WoAgrrement.class);
            aggre_criteria.add(Restrictions.eq("workOrder", wo));

            for (Object agree_obj : aggre_criteria.list()) {
                WoAgrrement wa = (WoAgrrement) agree_obj;
                int days = common.getDays(wa.getEndDate(), wa.getStartDate());
                if (common.checkAggrement(wa.getStartDate(), wa.getEndDate(), ptl.getLogDate())) {
                    double mg_amount = wo.getWoMgAmount();
                    double amount = 0;
                    //--com is object define at line no 101 specially use for MG
                    amount = com.getDistributerProfit(wo.getWoRent(), wo.getWoSharing(), wo.getWoMg(), wa.getTheaterRent(), wa.getDistributerShare(), mg_amount, ptl.getNettProfit(), true, days);
                    global_distributer_profit = global_distributer_profit + amount;
                    total = total + amount;
                    DistributerProfit_Bean dpb = date_Map.get(common.formateDate(ptl.getLogDate()));
                    dpb.setAmount(amount);
                    //Week Day Wise
                    Days_Bean days_Bean = week_days_Map.get(com.getDayName(ptl.getLogDate()));
                    days_Bean.setAmount(amount);
                    //Circuit Wise
                    Circuit_Bean circuit_Bean = circuit_Map.get(circuit);
                    circuit_Bean.setAmount(amount);

                    break;
                }
            }//--Aggrement Loop

        }//--PTL Loop
        global_diffrence = global_diffrence + (total - amt_recv);
    }//--Work Order Loop

    for (Object o : date_List) {
        DistributerProfit_Bean dpb = date_Map.get(o.toString());
        chart = chart + "{\"category\": \"" + dpb.getId() + "\",\"column-1\": \"" + dpb.getAmount() + "\"},";
        grand_Total = grand_Total + dpb.getAmount();
    }
    for (Object o : week_days_list) {
        Days_Bean dpb = week_days_Map.get(o.toString());
        day_chart = day_chart + "{\"category\": \"" + dpb.getId() + "\",\"column-1\": \"" + dpb.getAmount() + "\"},";
    }
    for (Map.Entry m : circuit_Map.entrySet()) {
        Circuit_Bean dpb = (Circuit_Bean) m.getValue();
        circuit_chart = circuit_chart + "{\"category\": \"" + dpb.getId() + "\",\"column-1\": \"" + dpb.getAmount() + "\"},";
    }
    hib_session.close();
%>
<html:html lang="true">
    <%@ include file="header1.jsp" %>



    <!-- amCharts javascript sources -->
    <script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
    <script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
    <!-- amCharts javascript sources -->

    <script type="text/javascript" src="http://www.amcharts.com/lib/3/pie.js"></script>
    <script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/light.js"></script>


    <script type="text/javascript" src="http://www.amcharts.com/lib/3/pie.js"></script>

    <!-- amCharts javascript code -->
    <!-- Weekly Graph-->
    <script type="text/javascript">
        AmCharts.makeChart("chartdiv3",
        {
            "type": "serial",
            "categoryField": "category",
            "angle": 30,
            "depth3D": 30,
            "startDuration": 1,
            "categoryAxis": {
                "gridPosition": "start"
            },
            "trendLines": [],
            "graphs": [
                {
                    "balloonText": "[[title]] of [[category]]:[[value]]",
                    "fillAlphas": 1,
                    "id": "AmGraph-1",
                    "title": "<%out.print(movie_name);%>",
                    "type": "column",
                    "valueField": "<%out.print(movie_name);%>"
                },
                {
                    "balloonText": "[[title]] of [[category]]:[[value]]",
                    "fillAlphas": 1,
                    "id": "AmGraph-2",
                    "title": "bajiraov Mastani",
                    "type": "column",
                    "valueField": "Bajiraov Mastani"
                }
            ],
            "guides": [],
            "valueAxes": [
                {
                    "id": "ValueAxis-1",
                    "title": "Indian Rupees"
                }
            ],
            "allLabels": [],
            "balloon": {},
            "legend": {
                "useGraphSettings": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 15,
                    "text": "Weekly Profit"
                }
            ],
            "dataProvider": [
                {
                    "category": "1 Week",
                    "<%out.print(movie_name);%>": "37000000",
                    "Bajiraov Mastani": "45000000"
                },
                {
                    "category": "2 Week",
                    "<%out.print(movie_name);%>": "33000000",
                    "Bajiraov Mastani": "35000000"
                },
                {
                    "category": "3 Week",
                    "<%out.print(movie_name);%>": "23000000",
                    "Bajiraov Mastani": "30000000"
                },
                {
                    "category": "4 Week",
                    "<%out.print(movie_name);%>": "10000000",
                    "Bajiraov Mastani": "15000000"
                },
                {
                    "category": "5 Week",
                    "<%out.print(movie_name);%>": "15000000",
                    "Bajiraov Mastani": "18000000"
                },
                {
                    "category": "6 Week",
                    "<%out.print(movie_name);%>": "25000000",
                    "Bajiraov Mastani": "32000000"
                },
                {
                    "category": "7 Week",
                    "<%out.print(movie_name);%>": "18000000",
                    "Bajiraov Mastani": "20000000"
                },
                {
                    "category": "8 Week",
                    "<%out.print(movie_name);%>": "9000000",
                    "Bajiraov Mastani": "9500000"
                }
            ]
        }
    );
    </script>


    <script type="text/javascript">
        AmCharts.makeChart("chartdiv2",
        {
            "type": "pie",
            "angle": 10.8,
            "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
            "depth3D": 18,
            "innerRadius": "41%",
            "titleField": "category",
            "valueField": "column-1",
            "theme": "default",
            "allLabels": [],
            "balloon": {},
            "legend": {
                "align": "center",
                "markerType": "circle"
            },
            "titles": [],
            "dataProvider": [
        <% out.print(day_chart);%>
                ]
            }
        );
    </script>

    <script type="text/javascript">
        AmCharts.makeChart("chartdiv1",
        {
            "type": "pie",
            "angle": 15,
            "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
            "depth3D": 15,
            "titleField": "category",
            "valueField": "column-1",
            "allLabels": [],
            "balloon": {},
            "legend": {
                "align": "center",
                "markerType": "circle"
            },
            "titles": [],
            "dataProvider": [
        <% out.print(circuit_chart);%>
                ]
            }
        );
    </script>
    <!-- amCharts javascript code -->
    <script type="text/javascript">
        AmCharts.makeChart("chartdiv",
        {
            "type": "serial",
            "categoryField": "category",
            "startDuration": 1,
            "categoryAxis": {
                "gridPosition": "start"
            },
            "trendLines": [],
            "graphs": [
                {
                    "balloonText": "[[title]] of [[category]]:[[value]]",
                    "bullet": "round",
                    "id": "AmGraph-1",
                    "title": "<%out.print(movie_name);%>",
                    "type": "smoothedLine",
                    "valueField": "column-1"
                },
                {
                    "balloonText": "[[title]] of [[category]]:[[value]]",
                    "bullet": "square",
                    "id": "AmGraph-2",
                    "title": "graph 2",
                    "type": "smoothedLine",
                    "valueField": "column-2"
                }
            ],
            "guides": [],
            "valueAxes": [
                {
                    "id": "ValueAxis-1",
                    "title": "Profit"
                }
            ],
            "allLabels": [],
            "balloon": {},
            "legend": {
                "useGraphSettings": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 15,
                    "text": "Per Day Profit"
                }
            ],
            "dataProvider": [
        <% out.print(chart);%>
                ]
            }
        );
    </script>





    <%@ include file="headermenu.jsp" %>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Nawandar Films
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>150</h3>
                            <p>Per Day Profit</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a href="profit_graph.jsp" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>53<sup style="font-size: 20px">%</sup></h3>
                            <p>Circuit Wise Profit</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="profit_graph.jsp" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3>44</h3>
                            <p>Day Wise Profit</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-film"></i>
                        </div>
                        <a href="profit_graph.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3>65</h3>
                            <p>Weekly Profit</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="profit_graph.jsp" class="small-box-footer">View <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
            </div><!-- /.row -->
            <!-- Main row -->

            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3>150</h3>
                            <p>Received Theater Log</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-university"></i>
                        </div>
                        <a href="Login_Theater.jsp" class="small-box-footer">Click Here <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3>132 <sup style="font-size: 20px">Lakh</sup></h3>
                            <p>Received Payments</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-money"></i>
                        </div>
                        <a href="select_Movie_accept_Payment.jsp" class="small-box-footer">Click Here <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>4</h3>
                            <p>Graph Analysis</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-bar-chart"></i>
                        </div>
                        <a href="profit_graph.jsp" class="small-box-footer">Click Here <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>1</h3>
                            <p>Excel Analysis</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-file-excel-o"></i>
                        </div>
                        <a href="analysis_week_EXCEL.jsp" class="small-box-footer">Click Here <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
            </div><!-- /.row -->


            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">About Movie</h3>

                </div><!-- /.box-header -->
                <div class="box-body">

                    <div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>

                </div><!-- /.box-body -->



            </div><!-- /.box -->

            <div class="row">
                <div class="col-md-6">
                    <!-- AREA CHART -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Circuit Profit</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="chartdiv1" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->

                    <!-- DONUT CHART -->
                    <!--<div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Donut Chart</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <canvas id="pieChart" style="height:250px"></canvas>
                        </div>
                    </div>-->

                </div><!-- /.col (LEFT) -->

                <div class="col-md-6">
                    <!-- LINE CHART -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Day Profit</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="chartdiv2" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->

                    <!-- BAR CHART -->
                    <!--<div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">Bar Chart</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="chart">
                                <canvas id="barChart" style="height:230px"></canvas>
                            </div>
                        </div>
                    </div>-->

                </div><!-- /.col (RIGHT) -->





            </div>




            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Weekly Profit</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <div id="chartdiv3" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->

    <%@ include file="sidebar.jsp" %>
    <%@ include file="footer.jsp" %>
</html:html>