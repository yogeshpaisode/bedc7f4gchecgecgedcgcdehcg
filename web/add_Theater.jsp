<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<html:html lang="true">
    <head>
        <title>NFD-New Theater</title>
        <%@ include file="header.jsp" %>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Theater Detail
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="add_Theater.jsp">Master</a></li>
                <li class="active"><a href="add_Theater.jsp">Theater Details</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- SELECT2 EXAMPLE -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">About Theaters</h3>                   
                </div><!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <html:form action="/add_Theater">

                            <%

                                List partyList = null;
                                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                Session hib_Session = sessionFactory.openSession();
                                Criteria criteria = hib_Session.createCriteria(PartyDetail.class);
                                partyList = criteria.list();
                            %>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Party Name</label>
                                    <select class="form-control" id="t_o_name" name="p_id">
                                        <%
                                            for (Object o : partyList) {
                                                PartyDetail partyDetail = (PartyDetail) o;
                                                out.print("<option value=\"" + partyDetail.getPId() + "\">" + partyDetail.getPName() + "</option>");
                                            }
                                            hib_Session.close();
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Theater Name</label>
                                    <input type="text" class="form-control" id="t_name" name="t_name" placeholder="Theater name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Theater Address</label>
                                    <textarea class="form-control" rows="3" id="t_address" name="t_address" placeholder="Full Address" style="height: 113px;"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mobile Number</label>
                                    <input type="number" class="form-control" id="t_number" name="t_number" placeholder="Fax Number">
                                </div>

                            </div><!-- /.col -->


                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email Address</label>
                                    <input type="email" class="form-control" id="t_email" name="t_email" placeholder="Enter email">
                                </div>
                                <div class="form-inline">
                                    <div class="form-group">
                                        <label  for="exampleInputEmail1">STD Code</label><br>
                                        <input type="number" class="form-control" id="t_std_code" name="t_std_Code" placeholder="Std Code">
                                    </div>
                                    <div class="form-group">
                                        <label  for="exampleInputPassword1">LandLine/Mobile Number</label><br>
                                        <input type="number" class="form-control" id="t_std_num" name="t_phone" placeholder="Phone Number">
                                    </div>

                                </div><br>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">City</label>
                                    <input type="text" class="form-control" id="t_city" name="t_city" placeholder="City">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">State</label>
                                    <input type="text" class="form-control" id="t_state" name="t_state" placeholder="State">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Country </label>
                                    <input type="text" class="form-control" id="t_country" name="t_country" value="India">
                                </div>
                                <div class="form-group">

                                    <label for="exampleInputEmail1">Screen Type</label>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="t_type" id="t_type1" value="Single Screen" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-single">
                                            Single Screen
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="t_type" id="t_type2" value="Multiple Screen" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">
                                            Multiple Screen
                                        </label>
                                    </div>

                                </div>
                                <!--model multiscreen-->
                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="box box-default">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Multiple Screen</h3>
                                                    <div class="box-tools pull-right">

                                                        <button type="button" class="btn btn-box-tool" data-dismiss="modal"><i class="fa fa-remove"></i></button>
                                                    </div>
                                                </div><!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Screen1 Details</h3>

                                                        </div><!-- /.box-header -->
                                                        <div class="col-xs-3">
                                                            <label for="exampleInputEmail1">Name of Screen</label>
                                                            <input type="text" class="form-control" id="s_name1" name="s1_name" placeholder="Screen Name like Audi1">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="exampleInputEmail1">Seat Capacity</label>
                                                            <input type="number" class="form-control" id="s_capa1" name="s1_seats" placeholder="Total Seat Capacity">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="exampleInputEmail1">Screen Number</label>
                                                            <input type="number" class="form-control" id="s_num1" name="s1_number" placeholder="Searial Number of scree" value="1">
                                                        </div>
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Screen2 Details</h3>

                                                        </div><!-- /.box-header -->
                                                        <div class="col-xs-3">
                                                            <label for="exampleInputEmail1">Name of Screen</label>
                                                            <input type="text" class="form-control" id="s_name2" name="s2_name" placeholder="Screen Name like Audi2">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="exampleInputEmail1">Seat Capacity</label>
                                                            <input type="number" class="form-control" id="s_capa2" name="s2_seats" placeholder="Total Seat Capacity">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="exampleInputEmail1">Screen Number</label>
                                                            <input type="number" class="form-control" id="s_num2" name="s2_number" placeholder="Searial Number of scree" value="2">
                                                        </div>
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Screen3 Details</h3>

                                                        </div><!-- /.box-header -->
                                                        <div class="col-xs-3">
                                                            <label for="exampleInputEmail1">Name of Screen</label>
                                                            <input type="text" class="form-control" id="s_name3" name="s3_name" placeholder="Screen Name like Audi3">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="exampleInputEmail1">Seat Capacity</label>
                                                            <input type="number" class="form-control" id="s_capa3" name="s3_seats" placeholder="Total Seat Capacity">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="exampleInputEmail1">Screen Number</label>
                                                            <input type="number" class="form-control" id="s_num3" name="s3_number" placeholder="Searial Number of scree" value="3">
                                                        </div>
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Screen4 Details</h3>

                                                        </div><!-- /.box-header -->
                                                        <div class="col-xs-3">
                                                            <label for="exampleInputEmail1">Name of Screen</label>
                                                            <input type="text" class="form-control" id="s_name4" name="s4_name" placeholder="Screen Name like Audi4">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="exampleInputEmail1">Seat Capacity</label>
                                                            <input type="number" class="form-control" id="s_capa4" name="s4_seats" placeholder="Total Seat Capacity">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="exampleInputEmail1">Screen Number</label>
                                                            <input type="number" class="form-control" id="s_num4" name="s4_number" placeholder="Searial Number of scree" value="4">
                                                        </div>
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Screen5 Details</h3>

                                                        </div><!-- /.box-header -->
                                                        <div class="col-xs-3">
                                                            <label for="exampleInputEmail1">Name of Screen</label>
                                                            <input type="text" class="form-control" id="s_name5" name="s5_name" placeholder="Screen Name like Audi5">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="exampleInputEmail1">Seat Capacity</label>
                                                            <input type="number" class="form-control" id="s_capa5" name="s5_seats" placeholder="Total Seat Capacity">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="exampleInputEmail1">Screen Number</label>
                                                            <input type="number" class="form-control" id="s_num5" name="s5_number" placeholder="Searial Number of scree" value="5">
                                                        </div>
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Screen6 Details</h3>

                                                        </div><!-- /.box-header -->
                                                        <div class="col-xs-3">
                                                            <label for="exampleInputEmail1">Name of Screen</label>
                                                            <input type="text" class="form-control" id="s_name6" name="s6_name" placeholder="Screen Name like Audi6">
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label for="exampleInputEmail1">Seat Capacity</label>
                                                            <input type="number" class="form-control" id="s_capa6" name="s6_seats" placeholder="Total Seat Capacity">
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label for="exampleInputEmail1">Screen Number</label>
                                                            <input type="number" class="form-control" id="s_num6" name="s6_number" placeholder="Searial Number of scree" value="6">
                                                        </div>
                                                    </div><!-- /.row -->

                                                    <div class="form-inline"><br>
                                                        <div class="form-group">
                                                            <button type="button" class="btn btn-block btn-primary" data-dismiss="modal">Save</button>
                                                        </div>
                                                        <div class="form-group">
                                                            <button type="button" class="btn btn-block btn-primary" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>

                                                </div><!-- /.box-body -->
                                            </div><!-- /.box -->
                                        </div>
                                    </div>
                                </div>
                                <!--end model end Multiscreen-->

                                <!-- Start Model Single Screen-->
                                <!--model-->
                                <div class="modal fade bs-example-modal-lg-single" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="box box-default">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Single Screen</h3>
                                                    <div class="box-tools pull-right">


                                                        <button type="button" class="btn btn-box-tool" data-dismiss="modal"><i class="fa fa-remove"></i></button>
                                                    </div>
                                                </div><!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Name of Screen</label>
                                                                <input type="text" class="form-control" id="exampleInputEmail1" name="ss_name" placeholder="Screen Name">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Screen Number</label>
                                                                <input type="number" class="form-control" id="exampleInputEmail1"  name="ss_number" value="1">
                                                            </div>
                                                        </div><!-- /.col -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Total Seat</label>
                                                                <input type="number" class="form-control" id="exampleInputEmail1" name="ss_seats" placeholder="Enter Total Seat in theater">
                                                            </div>
                                                            <div class="form-inline"><br>
                                                                <div class="form-group">
                                                                    <button type="button" class="btn btn-block btn-primary" data-dismiss="modal">Save</button>
                                                                </div>
                                                                <div class="form-group">
                                                                    <button type="button" class="btn btn-block btn-primary" data-dismiss="modal">Cancel</button>
                                                                </div>
                                                            </div>
                                                        </div><!-- /.col -->
                                                    </div><!-- /.row -->


                                                </div><!-- /.box-body -->
                                            </div><!-- /.box -->
                                        </div>
                                    </div>
                                </div>
                                <!--end model-->


                                <!-- end Model Single Screen-->


                            </div><!-- /.col -->
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-primary">Clear</button>
                            </html:form>
                        </div><!-- /.row -->
                    </div><!-- /.box-body -->

                </div><!-- /.box -->



        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->


    <%@ include file="sidebar.jsp" %>
    <%@ include file="footer.jsp" %>
</html:html>


