<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <title>NFD-New Party</title>
        <%@ include file="header.jsp" %>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Movie Details
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Movie Details</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- SELECT2 EXAMPLE -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">About Movie</h3>

                </div><!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <html:form action="/add_Movie">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Movie Name</label>
                                    <input type="text" class="form-control" id="m_name" name="m_name" placeholder="Movie Name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Producer Name</label>
                                    <input type="text" class="form-control" id="m_producer" name="m_producer" placeholder="Producer Name">
                                </div>


                            </div><!-- /.col -->


                            <div class="col-md-6">


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Movie Release Date</label>

                                    <input type="text" id="m_realese_date" name="m_release_date" class="form-control" data-provide="datepicker" placeholder="month/day/year">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Movie Banner Link</label>
                                    <input type="text" class="form-control" id="m_banner_link" name="m_banner_img_link" placeholder="paste Link">
                                </div>

                                <!--model-->

                                <!--end model-->


                            </div><!-- /.col -->
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-primary">Clear</button>
                            </div>
                        </html:form>
                    </div><!-- /.row -->
                </div><!-- /.box-body -->

            </div><!-- /.box -->



        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->


    <%@ include file="sidebar.jsp" %>
    <%@ include file="footer.jsp" %>
</html:html>

