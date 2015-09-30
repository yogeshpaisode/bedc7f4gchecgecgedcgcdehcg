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

          

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<%@ include file="sidebar.jsp" %>
<%@ include file="footer.jsp" %>
 </html:html>
     
