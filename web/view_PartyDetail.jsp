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
<!DOCTYPE html>
<html>
    <head>
        <title>NFD-Select Movie</title>
        <%@ include file="header.jsp" %>
        
        <%
            try {

                int p_id = Integer.parseInt(request.getAttribute("p_id").toString());
                List party_Detail = null;
                List party_Members_Detail = null;
                PartyDetail pd = null;

                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();

                Criteria cr = hib_session.createCriteria(PartyDetail.class);
                cr.add(Restrictions.eq("PId", p_id));
                party_Detail = cr.list();


                pd = (PartyDetail) party_Detail.get(0);


                cr = hib_session.createCriteria(MembersDetail.class);
                cr.add(Restrictions.eq("partyDetail", pd));
                party_Members_Detail = cr.list();

                //out.print("Party Name:" + pd.getPName() + "<br>");
                //out.print("Party State:" + pd.getPState() + "<br>");
                //out.print("Party City:" + pd.getPCity() + "<br>");
                //out.print("Party Circuit:" + pd.getPCircuit() + "<br>");
                //out.print("Party Region:" + pd.getPCircuitRegion() + "<br>");
%>
 <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Party Detail Preview
            <small>#007612</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Add Party</a></li>
            <li class="active">Party Detail Preview</li>
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
                <i class="fa fa-globe"></i> Party Details.
                <small class="pull-right">Date: 2/10/2014</small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              
              <address>
               <b>Name: <% out.print(pd.getPName());%></b><br>
              
              <b>Address:</b> <% out.print(pd.getPAddress()); %><br>
              <b>City:</b> <% out.print(pd.getPCity()); %><br>
              <b>State:</b> <% out.print(pd.getPState()); %>
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
             
              <address>
                 <b>Mobile No: <% out.print(pd.getPStdCode());%>-<% out.print(pd.getPOfficeNumber());%></b><br>
             
              <b>Email: </b> <% out.print(pd.getPEmail()); %><br>
              <b>Fax: </b> <% out.print(pd.getPFax()); %><br>
              
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              <b>Circuit Area: <% out.print(pd.getPCircuit());%></b><br>
              
              <b>Circuit Region </b> <% out.print(pd.getPCircuitRegion()); %> <br>
              <b>Country: </b> <% out.print(pd.getPCountry()); %><br>
              
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
                <%
if (party_Members_Detail.size() >= 1) {
                   // out.print("Member Detail:<br><br>");
                   // out.print("<table><th> <tr> <td>Name</td> <td>Email</td> <td>Contact</td> </tr> </th>");
             %>  
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Member Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    
                  </tr>
                </thead>
                <% }                
%>
                <tbody>
                   <%  for (Object o : party_Members_Detail) { 
                     MembersDetail membersDetail = (MembersDetail) o;                   
                        %>
                  <tr>
                    <td><% out.print(membersDetail.getMName());%></td>
                    <td><% out.print(membersDetail.getMEmail());%></td>
                    <td><% out.print(membersDetail.getMContact());%></td>
                    
                  </tr>
                  <% } %>
                </tbody>
              </table>
            </div><!-- /.col -->
          </div><!-- /.row -->

         

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
              
              <a href="add_Party.jsp"><button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Add More Party</button></a>
             
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
