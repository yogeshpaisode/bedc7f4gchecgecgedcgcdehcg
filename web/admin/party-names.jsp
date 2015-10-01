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
                        <th>Party Name</th>
                       
                        <th>State</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Theater Name</th>
                        <th>Circuit</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                         <%
                         int id=0;
                        Common common = new Common();
                        MovieDetail movieDetail = null;
                          SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
                Criteria party_criteria = hib_session.createCriteria(PartyDetail.class);
                
                List party_List = party_criteria.list();

                String p_id = "";
                String p_name = "";
                String p_phone = "";
                String p_email="";
                String p_mobile="";
                int t_id = 0;
                String t_name = "";
                String t_phone = "";
                String s_name = "";
                String s_number = "";
                String p_state="";
                String p_address="";
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
                    p_state = pd.getPState();
                    p_address = pd.getPAddress();
                    p_email = pd.getPEmail();
                    p_mobile = pd.getPOfficeNumber();

                   

                            
%>
                      <tr>
                          <td><% out.print(++list); %></td>
                        <td><% out.print(p_name); %></td>
                        <td><% out.print(p_state);%></td>
                        <td><% out.print(p_address);%></td>
                        <td> <% out.print(p_email);%></td>
                        <td><% out.print(p_mobile);%></td>
                        <td>PVR</td>
                        <td>Bombay</td>
                      </tr>
                    <%   
                }//Party Loop

               

            %>
                      
                    </tbody>
                    <tfoot>
                      <tr>
                         <th>Sr.N</th>
                        <th>Party Name</th>
                       
                        <th>State</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Theater Name</th>
                        <th>Circuit</th>
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

