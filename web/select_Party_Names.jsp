<%-- 
    Document   : index
    Created on : Sep 10, 2015, 2:05:11 AM
    Author     : Satyapal
--%>

<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.nawandarfilmes.commonUtility.Common"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.criterion.Restrictions"%>

<%@page import="org.hibernate.criterion.*"%>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<html>

    <jsp:include page="header.jsp"/>
    <jsp:include page="sidebar.jsp"/>

    <%
        try {
            int mov_id = 0;
            int id = 0;
            Common common = new Common();
            MovieDetail movieDetail = null;
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            mov_id = Integer.parseInt(session.getAttribute("mov_id").toString());
            Criteria criteria = hib_session.createCriteria(MovieDetail.class);
            criteria.add(Restrictions.eq("movId", mov_id));

            movieDetail = (MovieDetail) criteria.list().get(0);


    %>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Movie Allotments
                <small><% out.print(movieDetail.getMovName());%></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Work Order</a></li>
                <li class="active">Movie Allotments</li>
            </ol>
        </section>

        <section class="content invoice">

            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i> <% out.print(movieDetail.getMovName());%>
                        <small class="pull-right">Realese Date:<% out.print(movieDetail.getMovReleaseDate());%></small>
                    </h2>
                </div><!-- /.col -->
            </div>
            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">

                    <address>
                        <strong>Movie Name.</strong><br>
                        <% out.print(movieDetail.getMovName());%><br>
                        <strong>Producer:</strong><br>
                        <% out.print(movieDetail.getMovProduces());%><br>
                        <strong>Realese Date.</strong><br>
                        <% out.print(movieDetail.getMovReleaseDate());%>
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
                                        <th>S.N.</th>
                                        <th>PartyID</th>
                                        <th>PartyName</th>
                                        <th>Mobile</th>
                                        <th>TheaterID</th>
                                        <th>Theater Name</th>
                                        <th>Screen Name.</th>
                                        <th>Screen No.</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Criteria party_criteria = hib_session.createCriteria(PartyDetail.class);
                                        List party_List = party_criteria.list();

                                        String p_id = "";
                                        String p_name = "";
                                        String p_phone = "";
                                        int t_id = 0;
                                        String t_name = "";
                                        String t_phone = "";
                                        String s_name = "";
                                        String s_number = "";
                                        String zero = "";
                                        String color = "";
                                        String actionName = "";
                                        String redirectPageName = "";

                                        int list = 1;


                                        for (Object po : party_List) {
                                            PartyDetail pd = (PartyDetail) po;
                                            id = pd.getPId();

                                            p_id = "NFD-" + common.getZeros(id) + pd.getPId();

                                            p_name = pd.getPName();
                                            p_phone = pd.getPOfficeNumber();

                                            Criteria theater_criteria = hib_session.createCriteria(TheaterDetail.class);
                                            theater_criteria.add(Restrictions.eq("partyDetail", pd));
                                            List theater_List = theater_criteria.list();

                                            for (Object to : theater_List) {
                                                TheaterDetail td = (TheaterDetail) to;
                                                t_name = td.getTName();
                                                t_phone = td.getTPhoneNumber();
                                                t_id = td.getTId();


                                                Criteria screen_criteria = hib_session.createCriteria(ScreenDetail.class);
                                                screen_criteria.add(Restrictions.eq("theaterDetail", td));
                                                List screeen_List = screen_criteria.list();

                                                for (Object so : screeen_List) {

                                                    ScreenDetail sd = (ScreenDetail) so;
                                                    s_name = sd.getSName();
                                                    s_number = sd.getSNumber() + "";
                                                    int s_no = sd.getSNumber();
                                                    int s_id = sd.getSId();

                                                    Criteria work_order_Criteria = hib_session.createCriteria(WorkOrder.class);
                                                    work_order_Criteria.add(Restrictions.eq("movieDetail", movieDetail));
                                                    work_order_Criteria.add(Restrictions.eq("theaterDetail", td));
                                                    work_order_Criteria.add(Restrictions.eq("partyDetail", pd));
                                                    work_order_Criteria.add(Restrictions.eq("screenDetail", sd));
                                                    work_order_Criteria.add(Restrictions.eq("woAggrement", true));

                                                    if (work_order_Criteria.list().size() >= 1) {
                                                        color = "red";
                                                        actionName = "Update Work Order";
                                                        redirectPageName = "";
                                                    } else {
                                                        color = "green";
                                                        actionName = "Place Work Order";
                                                        redirectPageName = "add_Workorder.jsp";
                                                    }
                                    %>
                                    <tr>
                                        <td><% out.print(list++);%></td>
                                        <td><% out.print(p_id);%></td>
                                        <td><% out.print(p_name);%></td>
                                        <td><% out.print(p_phone);%></td>
                                        <td><% out.print(common.getZeros(t_id) + t_id);%></td>
                                        <td><% out.print(t_name);%></td>
                                        <td><% out.print(s_name);%></td>
                                        <td><% out.print(s_number);%></td>

                                        <td><form action='<% out.print(redirectPageName);%>' method=\"get\"><input type='password' hidden name='mov_name' value='<%out.print(movieDetail.getMovName());%>'/><input type='password' hidden name='p_id' value='<%out.print(id);%>'/><input type='password' hidden name='p_name' value='<%out.print(p_name);%>'/><input type='password' hidden name='p_phone' value='<%out.print(p_phone);%>'/><input type='password' hidden name='t_id' value='<%out.print(t_id);%>'/><input type='password' hidden name='t_name' value='<%out.print(t_name);%>'/><input type='password' hidden name='t_phone' value='<%out.print(t_phone);%>'/><input type='password' hidden name='s_name' value='<%out.print(s_name);%>'/><input type='password' hidden name='s_no' value='<%out.print(s_no);%>'/><input type='password' hidden name='s_id' value='<%out.print(s_id);%>'/><input type='password' hidden name='m_id' value='<%out.print(mov_id);%>'/><input type='submit' value='<% out.print(actionName);%>'/></form></td>

                                    </tr>
                                    <%   }//Screen Loop
                                                }// Theater Loop
                                            }//Party Loop

                                            hib_session.close();
                                        } catch (Exception e) {
                                            System.out.print("\n\n\n" + e + "\n\n\n");
                                        }

                                    %>

                                    <tr>


                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>S.N.</th>
                                        <th>PartyID</th>
                                        <th>PartyName</th>
                                        <th>Mobile</th>
                                        <th>TheaterID</th>
                                        <th>Theater Name</th>
                                        <th>Screen Name</th>
                                        <th>Screen No.</th>
                                        <th>Status</th>
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
            <b>Version</b> 2.3.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
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
