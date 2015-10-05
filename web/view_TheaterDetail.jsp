<%-- 
    Document   : view_PartyDetail
    Created on : Sep 10, 2015, 4:15:00 PM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NFD-Theater Preview</title>
        <%@ include file="header.jsp" %>
        
        <%
            try {

                int p_id = Integer.parseInt(request.getAttribute("p_id").toString());
                int t_id = Integer.parseInt(request.getAttribute("t_id").toString());
                PartyDetail partyDetail = null;
                TheaterDetail theaterDetail = null;
                ScreenDetail screenDetail = null;
                List partyList = null;
                List theaterlist = null;
                List screeList = null;

                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();

                Criteria cr = hib_session.createCriteria(PartyDetail.class);

                cr.add(Restrictions.eq("PId", p_id));
                partyList = cr.list();
                partyDetail = (PartyDetail) partyList.get(0);

                //out.print("<h1>" + partyDetail.getPName() + "</h1>");


                cr = hib_session.createCriteria(TheaterDetail.class);
                cr.add(Restrictions.eq("TId", t_id));
                theaterlist = cr.list();
                theaterDetail = (TheaterDetail) theaterlist.get(0);

                //out.print("Theater Name:" + theaterDetail.getTName() + "<br>");
                //out.print("Theater Type:" + theaterDetail.getTType() + "<br>");

                cr = hib_session.createCriteria(ScreenDetail.class);
                cr.add(Restrictions.eq("theaterDetail", theaterDetail));
                screeList = cr.list();
%>
                <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Theater Detail Preview
            <small>#007612</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Add Theater</a></li>
            <li class="active">Theater Detail Preview</li>
          </ol>
        </section>

        <div class="pad margin no-print">
          <div class="callout callout-info" style="margin-bottom: 0!important;">
            <h4><i class="fa fa-info"></i> Note:</h4>
            All Details are Stored.
          </div>
        </div>

        <!-- Main content -->
        <section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <i class="fa fa-globe"></i> Theater Details.
                <small class="pull-right">Date: 2/10/2014</small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              
              <address>
               <b>Party Name: <% out.print(partyDetail.getPName());%></b><br>
              
              <b>Address:</b> <% out.print(partyDetail.getPAddress()); %><br>
              <b>City:</b> <% out.print(partyDetail.getPCity()); %><br>
              <b>State:</b> <% out.print(partyDetail.getPState()); %>
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
             
              <address>
                 <b>Theater Name: <% out.print(theaterDetail.getTName());%></b><br>
             
              <b>Address </b> <% out.print(theaterDetail.getTAddress()); %><br>
              <b>Type: </b> <% out.print(theaterDetail.getTType()); %><br>
              <b>City: </b> <% out.print(theaterDetail.getTCity()); %><br>
              <b>State: </b> <% out.print(theaterDetail.getTState()); %>
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              <b>Email: <% out.print(theaterDetail.getTEmail());%></b><br>
              
              <b>Contact: </b> <% out.print(theaterDetail.getTStdCode()); %>-<% out.print(theaterDetail.getTPhoneNumber());%> <br>
              <b>No. of Screen </b> <% out.print(theaterDetail.getTNoScreens()); %>
              
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
                <%
           if (screeList.size() >= 1) {
                   // out.print("Member Detail:<br><br>");
                   // out.print("<table><th> <tr> <td>Name</td> <td>Email</td> <td>Contact</td> </tr> </th>");
             %>  
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Screen Name</th>
                    <th>Screen No.</th>
                    <th>Seats</th>
                    
                  </tr>
                </thead>
                <% }                
%>
                <tbody>
                   <%  for (Object o : screeList) {
                    ScreenDetail sd = (ScreenDetail) o;                  
                        %>
                  <tr>
                    <td><% out.print(sd.getSName());%></td>
                    <td><% out.print(sd.getSNumber());%></td>
                    <td><% out.print(sd.getSSeats());%></td>
                    
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div><!-- /.col -->
          </div><!-- /.row -->

         

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
              
              <a href="add_Theater.jsp"><button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Add More Theaters</button></a>
             
            </div>
          </div>
        </section><!-- /.content -->
        <div class="clearfix"></div>
      </div><!-- /.content-wrapper -->
                
                
                
                
                
                
                <%
               
                hib_session.close();

            } catch (Exception e) {
                out.print(e + "");
            }



        %>
     <%@ include file="sidebar.jsp" %>
    <%@ include file="footer.jsp" %>
</html>
