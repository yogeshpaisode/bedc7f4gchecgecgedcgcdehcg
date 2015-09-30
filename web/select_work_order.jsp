<%-- 
    Document   : index
    Created on : Sep 10, 2015, 2:05:11 AM
    Author     : Satyapal
--%>

<%@page import="com.sun.org.apache.regexp.internal.StreamCharacterIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page import="com.nawandarfilmes.commonUtility.Common"%>
<!DOCTYPE html>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<html>

    <jsp:include page="header.jsp"/>
    <jsp:include page="sidebar.jsp"/>
    
   <%
            int mov_id = 0;
            int list = 0;
            String redirectPageName = "process_Party_Payment.jsp";
            Common common = new Common();
            String rows = "";
            MovieDetail movieDetail = null;
            PartyDetail partyDetail = null;
            TheaterDetail theaterDetail = null;
            ScreenDetail screenDetail = null;

            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            mov_id = Integer.parseInt(request.getParameter("mov_id"));

            Criteria criteria = hib_session.createCriteria(MovieDetail.class);
            criteria.add(Restrictions.eq("movId", mov_id));
            movieDetail = (MovieDetail) criteria.list().get(0);

            criteria = hib_session.createCriteria(WorkOrder.class);
            criteria.add(Restrictions.eq("movieDetail", movieDetail));

            
        %>

<div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Select Work Order
            <small><% out.print(movieDetail.getMovName()); %></small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Select Work Order</a></li>
            <li class="active">Accept Payments</li>
          </ol>
        </section>
        
        <section class="content invoice">
            
            <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <i class="fa fa-globe"></i> <% out.print(movieDetail.getMovName()); %>
                <small class="pull-right">Realese Date:<% out.print(movieDetail.getMovReleaseDate()); %></small>
              </h2>
            </div><!-- /.col -->
          </div>
           <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              
              <address>
                <strong>Movie Name.</strong><br>
                <% out.print(movieDetail.getMovName()); %><br>
                <strong>Producer:</strong><br>
                <% out.print(movieDetail.getMovProduces()); %><br>
                <strong>Realese Date.</strong><br>
                <% out.print(movieDetail.getMovReleaseDate()); %>
              </address>
            </div><!-- /.col -->
            
            <div class="col-sm-4 invoice-col">
              <div class="col-sm-6">
                          <img class="img-responsive" src="https://starfriday.files.wordpress.com/2015/07/poster_h1.jpg" alt="Photo">
                        </div><!-- /.col -->
            </div><!-- /.col -->
          </div><!-- /.row -->
            
          <div class="row">
            <div class="col-xs-12">
              

              <div class="box">
                
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>Sr.No</th>
                    <th>Order Id:</th>
                    <th>Party ID</th>
                    <th>Party Name</th>
                    <th>Party Phone</th>
                    <th>Theater ID</th>
                    <th>Theater Name</th>
                    <th>Theater Phone</th>
                    <th>Screen Name</th>
                    <th>Screen Number</th>
                    <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                       <%  for (Object o : criteria.list()) {
                WorkOrder wo = (WorkOrder) o;
                partyDetail = wo.getPartyDetail();
                theaterDetail = wo.getTheaterDetail();
                screenDetail = wo.getScreenDetail();
                //rows = rows + "<tr bgcolor=\"green\"><td>" + ++list + "</td><td>NDF-" + common.getZeros(wo.getWoId()) + wo.getWoId() + "</td><td>NDF-" + common.getZeros(partyDetail.getPId()) + partyDetail.getPId() + "</td><td>" + partyDetail.getPName() + "</td><td>" + partyDetail.getPOfficeNumber() + "</td><td>NFD-" + common.getZeros(theaterDetail.getTId()) + theaterDetail.getTId() + "</td><td>" + theaterDetail.getTName() + "</td><td>" + theaterDetail.getTPhoneNumber() + "</td><td>" + screenDetail.getSName() + "</td><td>" + screenDetail.getSNumber() + "</td><td><form action='" + redirectPageName + "' method=\"post\"><input type='password' hidden name='m_id' value='" + mov_id + "'/><input type='password' hidden name='wo_id' value='" + wo.getWoId() + "'/><input type='submit' value='Accept Payment'/></form></td></tr>";
            
                       %>
                      <tr>
                        <td><% out.print(++list); %></td>
                        <td><% out.print(common.getZeros(wo.getWoId())+ wo.getWoId()); %></td>
                        <td><% out.print(common.getZeros(partyDetail.getPId())+ partyDetail.getPId()); %></td>
                        <td><% out.print(partyDetail.getPName()); %></td>
                        <td><% out.print(partyDetail.getPOfficeNumber()); %></td>
                        <td><% out.print(common.getZeros(theaterDetail.getTId())+ theaterDetail.getTId()); %></td>
                        <td><% out.print(theaterDetail.getTName()); %></td>
                        <td><% out.print(theaterDetail.getTPhoneNumber()); %></td>
                        
                        <td><% out.print(screenDetail.getSName()); %></td>
                        <td><% out.print(screenDetail.getSNumber()); %></td>
                        <td><form action='<% out.print(redirectPageName); %>' method=\"post\"><input type='password' hidden name='m_id' value='<% out.print( mov_id); %>'/><input type='password' hidden name='wo_id' value='<% out.print( wo.getWoId()); %>'/><input type='submit' value='Accept Payment'/></form></td>
                        
                        
                      </tr>
                      
                      <%}

           // out.print("<div align=\"center\"><h1>" + movieDetail.getMovName());
            //out.print("</h1><h3>" + movieDetail.getMovProduces() + " Procution</h3><br>");

        %>
                      
                      <tr>
                          
                          
                          </tbody>
                    <tfoot>
                      <tr>
                        <th>Sr.No</th>
                    <th>Order Id:</th>
                    <th>Party ID</th>
                    <th>Party Name</th>
                    <th>Party Phone</th>
                    <th>Theater ID</th>
                    <th>Theater Name</th>
                    <th>Theater Phone</th>
                    <th>Screen Name</th>
                    <th>Screen Number</th>
                    <th>Action</th>
                      </tr>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2015 <a href="#">Nawander Film Studio</a>.</strong> All rights reserved.
      </footer>

      
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- page script -->
    <script>
      $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
          "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false
        });
      });
      
      
    </script>
  </body>
</html>
