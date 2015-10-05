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
                Party Detail :            
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="add_Party.jsp">Master</a></li>
                <li class="active"><a href="add_Party.jsp">Add New Party Detail</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- SELECT2 EXAMPLE -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">About Party</h3>              
                </div><!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <html:form action="/add_Party">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Party Name <font color="red"><html:errors property="login" /></font></label>
                                    <input type="text" class="form-control" id="p_name" name="p_name" placeholder="Party Name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mobile Number <font color="red"><html:errors property="login" /></font></label>
                                    <input type="number" class="form-control" id="p_contact" name="p_contact" placeholder="Party Mobile Number">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Address <font color="red"><html:errors property="login" /></font></label>
                                    <textarea class="form-control" rows="3" placeholder="Full Address" id="p_address" name="p_address" style="height: 113px;"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Fax Number <font color="red"><html:errors property="login" /></font></label>
                                    <input type="number" class="form-control" id="p_fax" name="p_fax" placeholder="Fax Number">
                                </div>
                                <div class="form-group">

                                    <label for="exampleInputEmail1">Circuit Area <font color="red"><html:errors property="login" /></font></label>
                                    <select id="p_circuit" name="p_circuit" class="form-control">
                                        <option>Bombay </option>
                                        <option>Delhi</option>
                                        <option>East Punjab Circuit</option>
                                        <option>CP-CI-Rajasthan Circuit</option>
                                        <option>Eastern Circuit</option>
                                        <option>South India Circuit</option>
                                        <option>Over Sea Circuit</option>
                                    </select>
                                </div>
                            </div><!-- /.col -->


                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address <font color="red"><html:errors property="login" /></font></label>
                                    <input type="email" class="form-control" id="p_email" name="p_email" placeholder="Enter email">
                                </div>
                                <div class="form-inline">
                                    <div class="form-group">
                                        <label  for="exampleInputEmail1">STD Code <font color="red"><html:errors property="login" /></font></label><br>
                                        <input type="number" class="form-control" id="p_std_code" name="p_std_code" placeholder="Std Code">
                                    </div>
                                    <div class="form-group">
                                        <label  for="exampleInputPassword1">Phone Number <font color="red"><html:errors property="login" /></font></label><br>
                                        <input type="number" class="form-control" id="p_std_number" name="p_std_number" placeholder="Phone Number">
                                    </div>
                                    <div class="form-group">
                                        <br>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Add Members</button>
                                    </div>
                                </div><br>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">City <font color="red"><html:errors property="login" /></font></label>
                                    <input type="text" class="form-control" id="p_city" name="p_city" placeholder="City">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">State <font color="red"><html:errors property="login" /></font></label>
                                    <input type="text" class="form-control" id="p_state" name="p_state" placeholder="State">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Country <font color="red"><html:errors property="login" /></font></label>
                                    <input type="text" class="form-control" id="p_country" name="p_country" value="India">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Circuit Region <font color="red"><html:errors property="login" /></font></label>
                                    <input type="text" class="form-control" id="p_circuit_region" name="p_circuit_region" placeholder="Your Circuit Region">
                                </div>
                                <!--model-->
                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="box box-default">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title">Member Details <font color="red"><html:errors property="login" /></font></h3>
                                                    <div class="box-tools pull-right">

                                                        <button type="button" class="btn btn-box-tool" data-dismiss="modal"><i class="fa fa-remove"></i></button>
                                                    </div>
                                                </div><!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Member1 Name</label>
                                                                <input type="text" class="form-control" id="m_name1" name="m1_name" placeholder="Member Name">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Mobile1 Number</label>
                                                                <input type="number" class="form-control" id="m_contact1" name="m1_contact" placeholder="Mobile Number">
                                                            </div>
                                                        </div><!-- /.col -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Email1 address</label>
                                                                <input type="email" class="form-control" id="m_email1" name="m1_email" placeholder="Enter email">
                                                            </div>
                                                        </div><!-- /.col -->
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Member2 Name</label>
                                                                <input type="text" class="form-control" id="m_name2" name="m2_name" placeholder=" Member Name">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Mobile2 Number</label>
                                                                <input type="number" class="form-control" id="m_contact2" name="m2_contact" placeholder="Mobile Number">
                                                            </div>
                                                        </div><!-- /.col -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Email2 address</label>
                                                                <input type="email" class="form-control" id="m_email2" name="m2_email" placeholder="Enter email">
                                                            </div>
                                                        </div><!-- /.col -->
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Member3 Name</label>
                                                                <input type="text" class="form-control" id="m_name3" name="m3_name" placeholder=" Member Name">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Mobile3 Number</label>
                                                                <input type="number" class="form-control" id="m_contact3" name="m3_contact" placeholder="Mobile Number">
                                                            </div>
                                                        </div><!-- /.col -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Email3 address</label>
                                                                <input type="email" class="form-control" id="m_email3" name="m3_email" placeholder="Enter email">
                                                            </div>
                                                        </div><!-- /.col -->
                                                    </div><!-- /.row -->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Member4 Name</label>
                                                                <input type="text" class="form-control" id="m_name3" name="m4_name" placeholder=" Member Name">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Mobile4 Number</label>
                                                                <input type="number" class="form-control" id="m_contact3" name="m4_contact" placeholder="Mobile Number">
                                                            </div>
                                                        </div><!-- /.col -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Email4 address</label>
                                                                <input type="email" class="form-control" id="m_email3" name="m4_email" placeholder="Enter email">
                                                            </div>
                                                        </div><!-- /.col -->
                                                    </div><!-- /.row -->
                                                </div><!-- /.box-body -->
                                            </div><!-- /.box -->
                                        </div>
                                    </div>
                                </div>
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

