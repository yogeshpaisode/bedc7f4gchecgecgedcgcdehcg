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
<%@page import="com.nawandarfilmes.commonUtility.Common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NFD-Select Movie</title>
        <%@ include file="header.jsp" %>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Select Movie and Action:
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Select movie</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form action="process_selected_movie.jsp" method="post">
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
                                    Criteria criteria = hib_session.createCriteria(MovieDetail.class);
                                    movieList = criteria.list();
                                    Common com = new Common();
                                    for (Object o : movieList) {
                                        MovieDetail md = (MovieDetail) o;


                            %>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box">
                                    <span class="info-box-icon bg-aqua"><i class="fa fa-film"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-number"><% out.print(md.getMovName());%></span>
                                        <span class="info-box-text"><% out.print(md.getMovProduces());%></span>
                                        <span class="info-box-text">Realease Date: <br><input type="radio" name="mov_id" value="<%out.print(md.getMovId());%>"/><%out.print(com.formateDate(md.getMovReleaseDate()));%> </span>
                                    </div><!-- /.info-box-content -->
                                </div><!-- /.info-box -->
                            </div><!-- /.col -->
                            <%
                                    }

                                    hib_session.close();

                                } catch (Exception e) {
                                    out.print(""+e+ "");
                                }

                            %>
                        </div><!-- /.row -->
                    </div><!-- /.box-body -->
                </div><!-- /.box -->

                <input type="radio" name="action" value="wo"/>New Work Order<br>
                <input type="submit"/>
            </form>

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->


    <%@ include file="sidebar.jsp" %>
    <%@ include file="footer.jsp" %>
</html>

