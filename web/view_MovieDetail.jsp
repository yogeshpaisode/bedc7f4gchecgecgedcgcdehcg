<%-- 
    Document   : view_MovieDetail
    Created on : Sep 11, 2015, 11:32:58 AM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NFD-Movie Preview</title>
        <%@ include file="header.jsp" %>

        <%
            try {

                int mov_id = Integer.parseInt(request.getAttribute("mov_id").toString());
                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();
                List movieList = null;
                MovieDetail movieDetail = null;


                Criteria cr = hib_session.createCriteria(MovieDetail.class);
                cr.add(Restrictions.eq("movId", mov_id));

                movieList = cr.list();

                movieDetail = (MovieDetail) movieList.get(0);

                //out.print("Movie Name:<h1>" + movieDetail.getMovName() + "</h1><br>");
                //out.print("Producer Name:" + movieDetail.getMovProduces() + "<br>");
                //out.print("<img src='" + movieDetail.getMovBannesImgLink() + "'/><br>");
                //out.print("Movie Trailer:<br>" + movieDetail.getMovYoutubeLink() + "<br>");
                %>
                <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Movie Detail Preview
            <small>#007612</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Add Movie</a></li>
            <li class="active">Movie Detail Preview</li>
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
                <i class="fa fa-globe"></i> Movie Details.
                <small class="pull-right">Date: 2/10/2014</small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              
              <address>
               <b> Movie Name: <% out.print(movieDetail.getMovName());%></b><br>
              
              <b>Producer Name: </b> <% out.print(movieDetail.getMovProduces()); %><br>
              
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
             
              <div class="col-sm-6">
                        <img class="img-responsive" src="<% out.print(movieDetail.getMovBannesImgLink());%>" alt="Photo">
                    </div><!-- /.col -->
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              
              
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Table row -->
          

         

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
