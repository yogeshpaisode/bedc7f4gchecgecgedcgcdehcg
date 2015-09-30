<%@page import="org.hibernate.Query"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session hib_session = sessionFactory.openSession();
    Criteria criteria = hib_session.createCriteria(MovieDetail.class);
    criteria.add(Restrictions.eq("movId", 1));
    MovieDetail md = (MovieDetail) criteria.list().get(0);
    Date releaseDate = md.getMovReleaseDate();
    Date startDate = releaseDate;
    Date endDate = null;
    List dateList = new ArrayList();

    String chart = "";

    double sunday = 0;
    double monday = 0;
    double tuesday = 0;
    double wednesday = 0;
    double thursday = 0;
    double friday = 0;
    double saturday = 0;

    try {

        for (int i = 0; i < 7; ++i) {
            Calendar c = Calendar.getInstance();
            c.setTime(startDate); // Now use today date.
            c.add(Calendar.DATE, i);
            dateList.add(c.getTime());
            endDate=c.getTime();
        }

        criteria = hib_session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("movieDetail", md));
        List wo_list = criteria.list();

        for (Object o : wo_list) {
            WorkOrder wo = (WorkOrder) o;

            criteria = hib_session.createCriteria(ProfitTicketLog.class);
            criteria.add(Restrictions.eq("workOrder", wo));
            for (Object ptl_obj : criteria.list()) {
                ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;

                for (Object date_obj : dateList) {
                    Date onDate = (Date) date_obj;
                    if (onDate.equals(ptl.getLogDate())) {

                        String onDateStr = onDate.toString();
                        if (onDateStr.startsWith("Fri")) {
                            friday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Sat")) {
                            saturday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Sun")) {
                            sunday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Mon")) {
                            monday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Tue")) {
                            tuesday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Wed")) {
                            wednesday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Thu")) {
                            thursday += ptl.getNettProfit();
                        }
                    }//-Compare Date
                }//--Date Lsit


            }//--Profit Ticket log
        }//--Profit Ticket Log


        for (Object o : dateList) {
            Date onDate = (Date) o;
            
            String onDateStr = onDate.toString();
            String forDate=dateFormat.format(onDate);

            if (onDateStr.startsWith("Fri")) {
                chart = chart + "['Friday "+forDate+"', " + friday + "],";

            }
            if (onDateStr.startsWith("Sat")) {
                chart = chart + "['Saturday "+forDate+"', " + saturday + "],";

            }
            if (onDateStr.startsWith("Sun")) {
                chart = chart + "['Sunday "+forDate+"', " + sunday + "],";

            }
            if (onDateStr.startsWith("Mon")) {
                chart = chart + "['Monday "+forDate+"', " + monday + "],";

            }
            if (onDateStr.startsWith("Tue")) {
                chart = chart + "['Tuesday "+forDate+"', " + tuesday + "],";

            }
            if (onDateStr.startsWith("Wed")) {
                chart = chart + "['Wednesday "+forDate+"', " + wednesday + "],";

            }
            if (onDateStr.startsWith("Thu")) {
                chart = chart + "['Thursday "+forDate+"', " + thursday + "],";

            }
        }

       
        
        
        hib_session.close();

    } catch (Exception e) {
        out.print(e);
    }
%>

<html:html lang="true">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nawandar Films</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="plugins/select2/select2.min.css">
     <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

    <!-- Date picker
    <link rel="stylesheet" href="date/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="date/css/bootstrap-datepicker.min.css">-->
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
            google.load('visualization', '1', {packages: ['corechart', 'bar']});
            google.setOnLoadCallback(drawMultSeries);

            function drawMultSeries() {
                var data = google.visualization.arrayToDataTable([
                    ['Day', 'Profit'],
                    <% out.print(chart);%>
                    ]);

                    var options = {
                        title: 'Profit for Date <% out.print(dateFormat.format(startDate)+" To "+dateFormat.format(endDate));%>',
                        chartArea: {width: '50%'},
                        hAxis: {
                            title: 'Profit',
                            minValue: 0
                        },
                        vAxis: {
                            title: 'Days'
                        }
                    };
                    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
        </script>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="index.jsp" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>N</b>F</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Nawandar</b>FILMS</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            AdminLTE Design Team
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-red"></i> 5 new members joined
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-user text-red"></i> You changed your username
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Create a nice theme
                            <small class="pull-right">40%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">40% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Some task I need to do
                            <small class="pull-right">60%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">60% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Make beautiful transitions
                            <small class="pull-right">80%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">80% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs">Satyapal Deshmukh</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      Satyapal  - Operator
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
        
     <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Week Graph
            
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
           
            <li class="active"><% out.print(md.getMovName());%></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- SELECT2 EXAMPLE -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"><% out.print(md.getMovName());%> By: <% out.print(md.getMovProduces());%></h3>
              
            </div><!-- /.box-header -->
            <div class="box-body">
              
                <div class="row">
                    
                <div id="chart_div"></div>
                
                </div>
                
            </div><!-- /.box-body -->
           
          </div><!-- /.box -->

          

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<%@ include file="sidebar.jsp" %>
<%@ include file="footer.jsp" %>
</html:html>
     
        