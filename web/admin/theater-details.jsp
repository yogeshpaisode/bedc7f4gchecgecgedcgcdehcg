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

<html:html lang="true">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nawandar Films</title>

    <%@ include file="header1.jsp" %>




    <%@ include file="headermenu.jsp" %>
    <%@ include file="sidebar.jsp" %>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Party Details

            </h1>
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>

                <li class="active">All Party Names</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">All Party Names</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Sr.N</th>
                                <th>Theater Name</th>
                                <th>Circuit</th>
                                <th>Owner Name</th>
                                <th>Screen Type</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>Email</th>
                                <th>Mobile</th>

                            </tr>
                        </thead>

                        <tbody>
                            <%
                                int list = 1;
                                int id = 0;
                                //Common common = new Common();
                                //MovieDetail movieDetail = null;

                                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                Session hib_session = sessionFactory.openSession();

                                Criteria theater_details = hib_session.createCriteria(TheaterDetail.class);
                                List party_List = theater_details.list();

                                for (Object to : party_List) {

                                    TheaterDetail pd = (TheaterDetail) to;
                                    id = pd.getTId();                                    
                                    PartyDetail p=pd.getPartyDetail();

                            %>
                            <tr>
                                <td><% out.print(++list);%></td>
                                <td><% out.print(pd.getTName());%></td>
                                <td><% out.print(p.getPCircuit());%></td>
                                <td><% out.print(p.getPName());%></td>
                                <td><% out.print(pd.getTType());%></td>
                                <td><% out.print(pd.getTAddress());%></td>
                                <td> <% out.print(pd.getTCity());%></td>
                                <td><% out.print(pd.getTEmail());%></td>
                                <td><% out.print(pd.getTPhoneNumber());%></td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Sr.N</th>
                                <th>Theater Name</th>
                                <th>Circuit</th>
                                <th>Owner Name</th>
                                <th>Screen Type</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>Email</th>
                                <th>Mobile</th>

                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->





        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->



    <%@ include file="footer.jsp" %>
    <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>
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
</html:html>

