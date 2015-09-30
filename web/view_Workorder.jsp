<%-- 
    Document   : view_Workorder
    Created on : Sep 12, 2015, 6:16:37 PM
    Author     : yogesh
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="sidebar.jsp"/>
    <%
            PartyDetail par = (PartyDetail) request.getAttribute("partyDetail");
            MovieDetail mov = (MovieDetail) request.getAttribute("movieDetail");
            TheaterDetail the = (TheaterDetail) request.getAttribute("theaterDetail");
            ScreenDetail scrn = (ScreenDetail) request.getAttribute("screenDetail");
            WorkOrder wo = (WorkOrder) request.getAttribute("wo");
            SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
            Session hib_session=sessionFactory.openSession();
            Criteria criteria=hib_session.createCriteria(WoAgrrement.class);
            criteria.add(Restrictions.eq("workOrder", wo));
            for(Object o:criteria.list()){
                WoAgrrement wa=(WoAgrrement)o;
           
            }
            
            
            int wo_id = Integer.parseInt(request.getAttribute("wo_id").toString());

        %>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Preview
            <small><% out.print(par.getPId());%></small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#"><% out.print(par.getPName());%></a></li>
            <li class="active"><% out.print(par.getPId());%></li>
          </ol>
        </section>

        

        <!-- Main content -->
    ;    <section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <i class="fa fa-globe"></i> <% out.print(mov.getMovName());%>
                <small class="pull-right"><% out.print(mov.getMovId());%></small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
                <b> Party Name: </b><% out.print(par.getPId());%><br>
              <address><br>
                <strong><% out.print(par.getPName());%>,<% out.print(par.getPCity());%></strong><br>
                <% out.print(par.getPAddress());%><br>
                <b>Office No:</b> <% out.print(par.getPStdCode() + "-" + par.getPOfficeNumber());%><br>
                <b>Fax No:</b> <% out.print(par.getPFax());%><br>
                <b>Email:</b> <% out.print(par.getPEmail());%><br>
               
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <b>Theater name:</b> <% out.print(the.getTId());%><br>
              <address><br>
                <strong><% out.print(the.getTName());%>,<% out.print(the.getTCity());%></strong><br>
                <% out.print(the.getTAddress());%><br>
                <b>Screen Name:</b><% out.print(scrn.getSName());%><br>
                <b>Screen No:</b><% out.print(scrn.getSNumber());%><br>
                <b>Screen Seats Capacity:</b><% out.print(scrn.getSSeats());%><br>
                <b>Phone:</b><% out.print(the.getTPhoneNumber());%><br>
                <b> Email:</b><% out.print(the.getTEmail());%>
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              <b>Movie Detail:</b><% out.print(mov.getMovId());%><br>
              <br>
              <b>Name:</b> <% out.print(mov.getMovName());%><br>
              <b>Producer:</b> <% out.print(mov.getMovProduces());%><br>
              <b>Release Date:</b> <% out.print(mov.getMovReleaseDate());%>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <div class="row">
            <!-- accepted payments column -->
            <div class="col-xs-6">
              <p class="lead">Agreement Type:</p>
              <div class="table-responsive">
                <table class="table">
                  <tr>
                    <th style="width:50%">Your Type:</th>
                    <td>Sample</td>
                  </tr>
                  <tr>
                    <th>Payment Method:</th>
                    <td>$10.34</td>
                  </tr>
                  <tr>
                    <th>Depositor Name:</th>
                    <td>$5.80</td>
                  </tr>
                  <tr>
                    <th>Amount Received:</th>
                    <td>$265.24</td>
                  </tr>
                </table>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-6">
              <p class="lead"><br></p>
              <div class="table-responsive">
                <table class="table">
                  <tr>
                    <th style="width:50%">UTR No.:</th>
                    <td>$250.30</td>
                  </tr>
                  <tr>
                    <th>Cheque No.:</th>
                    <td>$10.34</td>
                  </tr>
                  <tr>
                    <th>Bank Name:</th>
                    <td>$5.80</td>
                  </tr>
                  <tr>
                    <th>Amount Received Date:</th>
                    <td>$265.24</td>
                  </tr>
                </table>
              </div>
            </div><!-- /.col -->
          </div><!-- /.row -->
          
          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Week</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Theater rent</th>
                    <th>Distributor Share</th>
                    <th>Owner Share</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1 Week</td>
                    <td>04/09/2015</td>
                    <td>10/09/2015</td>
                    <td>520200</td>
                    <td>50%</td>
                    <td>50%</td>
                  </tr>
                  <tr>
                    <td>2 Week</td>
                    <td>04/09/2015</td>
                    <td>10/09/2015</td>
                    <td>520200</td>
                    <td>50%</td>
                    <td>50%</td>
                  </tr>
                  <tr>
                    <td>3 Week</td>
                    <td>04/09/2015</td>
                    <td>10/09/2015</td>
                    <td>520200</td>
                    <td>50%</td>
                    <td>50%</td>
                  </tr>
                  
                </tbody>
              </table>
            </div><!-- /.col -->
          </div><!-- /.row -->

          

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
              <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
              <a href="select_Party_Names.jsp?mov_id=<% out.print (mov.getMovId());%>">  <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Add More Work Order</button></a>
              <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;"><i class="fa fa-download"></i> Generate PDF</button>
            </div>
          </div>
        </section><!-- /.content -->
        <div class="clearfix"></div>
      </div><!-- /.content-wrapper -->
    
    
    
    <%@ include file="footer.jsp" %>
</html>