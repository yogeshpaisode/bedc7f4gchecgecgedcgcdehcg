<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nawandar Films</title>

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
                    "title": "Welcome Back",
                    "type": "column",
                    "valueField": "Welcome Back"
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
                    "Welcome Back": "37000000",
                    "Bajiraov Mastani": "45000000"
                },
                {
                    "category": "2 Week",
                    "Welcome Back": "33000000",
                    "Bajiraov Mastani": "35000000"
                },
                {
                    "category": "3 Week",
                    "Welcome Back": "23000000",
                    "Bajiraov Mastani": "30000000"
                },
                {
                    "category": "4 Week",
                    "Welcome Back": "10000000",
                    "Bajiraov Mastani": "15000000"
                },
                {
                    "category": "5 Week",
                    "Welcome Back": "15000000",
                    "Bajiraov Mastani": "18000000"
                },
                {
                    "category": "6 Week",
                    "Welcome Back": "25000000",
                    "Bajiraov Mastani": "32000000"
                },
                {
                    "category": "7 Week",
                    "Welcome Back": "18000000",
                    "Bajiraov Mastani": "20000000"
                },
                {
                    "category": "8 Week",
                    "Welcome Back": "9000000",
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
                {
                    "category": "Sunday",
                    "column-1": "12"
                },
                {
                    "category": "Monday",
                    "column-1": "6"
                },
                {
                    "category": "Tuesday",
                    "column-1": "2"
                },
                {
                    "category": "Wensday",
                    "column-1": "3"
                },
                {
                    "category": "Thursday",
                    "column-1": "1"
                },
                {
                    "category": "Friday",
                    "column-1": "4"
                },
                {
                    "category": "Saturday",
                    "column-1": "8"
                }
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
                {
                    "category": "Bombay",
                    "column-1": 8
                },
                {
                    "category": "Delhi",
                    "column-1": 6
                },
                {
                    "category": "Nizam",
                    "column-1": 2
                },
                {
                    "category": "East Punjab",
                    "column-1": "3"
                },
                {
                    "category": "Easten",
                    "column-1": "1"
                },
                {
                    "category": "C. P. Berar",
                    "column-1": "12"
                },
                {
                    "category": "Central India",
                    "column-1": "13"
                },
                {
                    "category": "Rajasthan",
                    "column-1": "10"
                },
                {
                    "category": "Mysore",
                    "column-1": "2"
                },
                {
                    "category": "Tamil Nadu",
                    "column-1": "3"
                },
                {
                    "category": "Andhra",
                    "column-1": "11"
                }
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
                    "title": "Welcome Back",
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
                    "title": "Lakh"
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
                {
                    "category": "04-Sep-2015",
                    "column-1": "50"
                },
                {
                    "category": "05-Sep-2015",
                    "column-1": "40"
                },
                {
                    "category": "06-Sep-2015",
                    "column-1": "30"
                },
                {
                    "category": "07-Sep-2015",
                    "column-1": "35"
                },
                {
                    "category": "08-Sep-2015",
                    "column-1": "20"
                },
                {
                    "category": "09-Sep-2015",
                    "column-1": "10"
                },
                {
                    "category": "10-Sep-2015",
                    "column-1": "60"
                }
            ]
        }
    );
    </script>



    <%@ include file="headermenu.jsp" %>
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

        <!-- Main content -->
        <section class="content">

            <!-- SELECT2 EXAMPLE -->
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

