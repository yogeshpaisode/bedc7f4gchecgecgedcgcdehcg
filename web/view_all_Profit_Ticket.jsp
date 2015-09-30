<%-- 
    Document   : view_all_Profit_Ticket
    Created on : Sep 14, 2015, 4:14:53 PM
    Author     : yogesh
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<!DOCTYPE html>
<html:html lang="true">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nawander Films | Theater</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        <script type="text/javascript">
            function disableF5(e) { if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82) e.preventDefault(); };
            $(document).ready(function(){
                $(document).on("keydown", disableF5);
            });
            window.location.hash="no-back-button";
            window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange=function(){window.location.hash="no-back-button";}
        </script>
        <html:base/>
    </head>
     <%
                int wo_id = Integer.parseInt(request.getAttribute("wo_id").toString());
                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();
                int count = 0;
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
                Criteria criteria = hib_session.createCriteria(WorkOrder.class);
                criteria.add(Restrictions.eq("woId", wo_id));
                WorkOrder wo = (WorkOrder) criteria.list().get(0);
                
                MovieDetail m=wo.getMovieDetail();
                PartyDetail p=wo.getPartyDetail();
                TheaterDetail t=wo.getTheaterDetail();                
                ScreenDetail s=wo.getScreenDetail();
                
                criteria = hib_session.createCriteria(ProfitTicketLog.class);
                criteria.add(Restrictions.eq("workOrder", wo));
                double totalProfit = 0;
               %>
    <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="../../index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>N</b>F</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Nawander</b>FILMS</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                
              </li>
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
               
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs"><% out.print(t.getTName()); %></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      <% out.print(s.getSName()); %>
                      <small><% out.print(m.getMovName()); %>: <% out.print(m.getMovReleaseDate()); %></small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  
                  <!-- Menu Footer-->
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
              
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><% out.print(s.getSName()); %></p>
              <a href="#"><i class="fa fa-circle text-success"></i> <% out.print(m.getMovName()); %></a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            View Theater Profit Detail
            <small><%  out.print(s.getSId());%></small>
          </h1>
          
        </section>

       

        <!-- Main content -->
        <section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <i class="fa fa-globe"></i> <% out.print(s.getSName()); %> : <% out.print(m.getMovName()); %>
                <small class="pull-right">Date: 2/10/2014</small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
                <b>Party Name:</b><br>
              <address><br>
                <strong><% out.print(p.getPName()); %></strong><br>
                <% out.print(p.getPAddress());%><br>
                <% out.print(p.getPCity());%>,<% out.print(p.getPState()); %><br>
                <b>Phone:</b> <%  out.print(p.getPStdCode());%>-<% out.print(p.getPOfficeNumber()); %><br>
                <b>Email:</b> <% out.print(p.getPEmail());%>
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
             <b> Theater Details:</b><br>
              <address><br>
                  <strong><% out.print(t.getTName());%>, <% out.print(t.getTCity()); %></strong><br>
                  <% out.print(t.getTAddress()); %><br>
                  <b>Screen type:</b><% out.print(t.getTType());%><br>
                  <b>Phone:</b> <% out.print(t.getTPhoneNumber());%><br>
                  <b>Email:</b> <% out.print(t.getTEmail());%>
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <b>Screen Detail <% out.print(s.getSId());%></b><br>
              <br>
              <b>Screen Name:</b> <% out.print(s.getSName());%><br>
              <b>Screen Number:</b> <%  out.print(s.getSNumber());%><br>
              <b>Seat Capacity:</b> <% out.print(s.getSSeats());%>
            </div><!-- /.col -->
          </div><!-- /.row -->

          
     <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Sr.No:</th>
                    <th>Log Date:</th>
                    <th>Entry Date:</th>
                    <th>Total Ticket Sold:</th>
                    <th>Profit:</th>
                  </tr>
                </thead>
                <tbody>
                   <% for (Object o : criteria.list()) {

                    ProfitTicketLog log = (ProfitTicketLog) o;
                    totalProfit = totalProfit + log.getNettProfit();
                    //out.print("<tr><td>" + (++count) + "</td><td>" + dateFormat.format(log.getLogDate()) + "</td><td>" + dateFormat.format(log.getEntryDateTime()) + "</td><td>" + log.getTicketSold() + "</td><td>" + log.getNettProfit() + "</td></tr>");
               %>
                  <tr>
                    <td><% out.print(++count);%></td>
                    <td><% out.print(dateFormat.format(log.getLogDate()));%></td>
                    <td><% out.print(dateFormat.format(log.getEntryDateTime()));%></td>
                    <td><% out.print(log.getTicketSold());%></td>
                    <td><% out.print(log.getNettProfit());%></td>
                    
                  </tr>
                 <% }
                //out.print("<tr><td></td><td></td><td></td><td>Total Profit:</td><td>" + totalProfit + "</td></tr>");

            %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><b>Total Profit</b></td>
                <td><% out.print(totalProfit);%></td>
            </tr>
                </tbody>
              </table>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
              
              <button type="submit" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Add More</button>
              
            </div>
          </div>
          </html:form>
        </section><!-- /.content -->
        
        <div class="clearfix"></div>
      </div><!-- /.content-wrapper -->
      
      
      
      <footer class="main-footer no-print">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2015 <a href="#">Nawander Film Studio</a>.</strong> All rights reserved.
      </footer>

     
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

     <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script src="plugins/fastclick/fastclick.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="dist/js/demo.js"></script>
  </body>
</html:html>
