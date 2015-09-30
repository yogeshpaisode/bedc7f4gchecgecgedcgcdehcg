<%-- 
    Document   : view_MovieDetail
    Created on : Sep 11, 2015, 11:32:58 AM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
     <%@ include file="header.jsp" %>
   
     <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Work Order
            
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
           
            <li class="active">Work Order</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- SELECT2 EXAMPLE -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Movie allotment</h3>
              
            </div><!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                  
                   <%
            try {
                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();
                List movieList = null;
                int count = 1;
                String apender = "";
                
                Criteria criteria = hib_session.createCriteria(MovieDetail.class);
                movieList = criteria.list();

                for (Object o : movieList) {
                    MovieDetail md = (MovieDetail) o;
                   
                   
                   %>
                   <input type="hidden" name="mov_id" value="<% md.getMovId(); %>">
                    <a href="select_work_order.jsp?mov_id=<% out.print(md.getMovId()); %>">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-envelope-o"></i></span>
                <div class="info-box-content">
                  <span class="info-box-number"><% out.print(md.getMovName()); %></span>
                  <span class="info-box-text">Nawandar Films</span>
                  <span class="info-box-text">Realease Date: <br><% out.print(md.getMovReleaseDate()); %> </span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col --></a>
                   
                   
                   
                <%}
%>
               <% out.print(apender);

                hib_session.close();

            } catch (Exception e) {
                out.print(e + "");
            }

        %>

                  
                  
                  
                  
                  
                  
            
            
            
          </div><!-- /.row -->
            </div><!-- /.box-body -->
           
          </div><!-- /.box -->

          

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<%@ include file="sidebar.jsp" %>
<%@ include file="footer.jsp" %>
</html>
     
        