<%-- 
    Document   : sidebar
    Created on : Sep 10, 2015, 10:24:36 PM
    Author     : Satyapal
--%>

<aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>Satyapal Deshmukh</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Operator</a>
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
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li>
              <a href="index.jsp">
                <i class="fa fa-home"></i> <span>Home</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              
            </li>
            <li class="active treeview">
              <a href="add_Party.jsp">
                <i class="fa fa-dashboard"></i> <span>Add Party Details</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              
            </li>
            <li class="treeview">
              <a href="add_Theater.jsp">
                <i class="fa fa-files-o"></i>
                <span>Add Theater Details</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              
            </li>
            <li>
              <a href="add_Movie.jsp">
                <i class="fa fa-th"></i> <span>Movie Details</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li>
              <a href="select_Movie.jsp">
                <i class="fa fa-book"></i> <span>New Work Order</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li>
              <a href="Login_Theater.jsp">
                <i class="fa fa-th"></i> <span>Received Theater Log</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li>
              <a href="select_Movie_accept_Payment.jsp">
                <i class="fa fa-th"></i> <span>Received Payments</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li>
              <a href="analysis_week_GRAPH.jsp">
                <i class="fa fa-th"></i> <span>Graph Analysis</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li>
              <a href="analysis_week_EXCEL.jsp">
                <i class="fa fa-th"></i> <span>Excel Analysis</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            
            <li class="header">Terms and Condition</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
