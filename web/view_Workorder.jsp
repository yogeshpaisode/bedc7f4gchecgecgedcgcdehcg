<%-- 
    Document   : view_Workorder
    Created on : Sep 12, 2015, 6:16:37 PM
    Author     : yogesh
--%>

<%@page import="com.nawandarfilmes.commonUtility.Common"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="sidebar.jsp"/>
    <%
        Common common = new Common();
        WorkOrder wo = null;
        int wo_id = Integer.parseInt(request.getAttribute("wo_id").toString());
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session hib_session = sessionFactory.openSession();
        Criteria criteria = hib_session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("woId", wo_id));
        wo = (WorkOrder) criteria.list().get(0);
        criteria = hib_session.createCriteria(WoAgrrement.class);
        criteria.add(Restrictions.eq("workOrder", wo));
        PartyDetail par = wo.getPartyDetail();
        MovieDetail mov = wo.getMovieDetail();
        TheaterDetail the = wo.getTheaterDetail();
        ScreenDetail scrn = wo.getScreenDetail();


    %>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Preview Work Order No: 
                <small><% out.print("#NFD-" + common.getZeros(wo_id) + wo_id);%></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"><% out.print(par.getPName());%></a></li>
                <li class="active"><% out.print("#NFD-" + common.getZeros(wo_id) + wo_id);%></li>
            </ol>
        </section>



        <!-- Main content -->
        ;    <section class="invoice">
            <!-- title row -->
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i> <% out.print(mov.getMovName());%>
                    </h2>
                </div><!-- /.col -->
            </div>
            <!-- info row -->
            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                    <b> Party Name: </b><% out.print("#NFD-" + common.getZeros(par.getPId()) + par.getPId());%><br>
                    <address><br>
                        <strong><% out.print(par.getPName());%>,<% out.print(par.getPCity());%></strong><br>
                        <% out.print(par.getPAddress());%><br>
                        <b>Office No:</b> <% out.print(par.getPStdCode() + "-" + par.getPOfficeNumber());%><br>
                        <b>Fax No:</b> <% out.print(par.getPFax());%><br>
                        <b>Email:</b> <% out.print(par.getPEmail());%><br>

                    </address>
                </div><!-- /.col -->
                <div class="col-sm-4 invoice-col">
                    <b>Theater name:</b><% out.print("#NFD-" + common.getZeros(the.getTId()) + the.getTId());%><br>
                    <address><br>
                        <strong><% out.print(the.getTName());%>,<% out.print(the.getTCity());%></strong><br>
                        <% out.print(the.getTAddress());%><br>
                        <b>Screen Name:</b><% out.print(scrn.getSName());%><br>
                        <b>Screen No:</b><% out.print(scrn.getSNumber());%><br>
                        <b>Screen Seats Capacity:</b><% out.print(scrn.getSSeats());%><br>
                        <b>Phone:</b><% out.print(the.getTPhoneNumber());%><br>
                        <b> Email:</b><% out.print(the.getTEmail());%>
                    </address>
                </div><!-- /.col -->
                <div class="col-sm-4 invoice-col">
                    <b>Movie Detail:</b><% out.print("#NFD-" + common.getZeros(mov.getMovId()) + mov.getMovId());%><br>
                    <br>
                    <b>Name:</b> <% out.print(mov.getMovName());%><br>
                    <b>Producer:</b> <% out.print(mov.getMovProduces());%><br>
                    <b>Release Date:</b> <% out.print(mov.getMovReleaseDate());%>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <div class="row">
                <!-- accepted payments column -->
                <div class="col-xs-6">
                    <p class="lead">Agreement Detail:</p>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th style="width:50%">Agreement Type:</th>
                                <td><%
                                    String hidden_flag = "hidden=\"\"";
                                    String no_flag = "UTR No:";
                                    String bank = "";
                                    String amt_recv_date = "";
                                    String payment_type = "";
                                    String depo_name = "";
                                    String amt_recv = "";
                                    String mg_amt = wo.getWoMgAmount() + "";
                                    String bank_flag = "";
                                    String b_flag="hidden=\"\"";
                                    String no="";

                                    String payment_flag = request.getAttribute("payment_flag").toString();

                                    if (wo.getWoMg()) {
                                        out.print("MINIMAL GURENTEE");

                                        if (payment_flag.equals("cash")) {
                                            payment_type = "CASH";
                                            Criteria c = hib_session.createCriteria(CashPayment.class);
                                            c.add(Restrictions.eq("recvMg", true));
                                            c.add(Restrictions.eq("workOrder", wo));
                                            CashPayment data = (CashPayment) c.list().get(0);
                                            depo_name = data.getDepositerName();
                                            amt_recv = data.getAmtRecv() + "";
                                            amt_recv_date=common.formateDate(data.getAmtRecvDate());
                                            bank_flag = "hidden=\"\"";
                                            
                                        } else if (payment_flag.equals("neft")) {
                                            
                                            Criteria c = hib_session.createCriteria(NeftRtgsPayment.class);
                                            c.add(Restrictions.eq("recvMg", true));
                                            c.add(Restrictions.eq("workOrder", wo));
                                            NeftRtgsPayment data = (NeftRtgsPayment) c.list().get(0);
                                            depo_name = data.getDepositerName();
                                            amt_recv = data.getAmtRecv() + "";
                                            amt_recv_date=common.formateDate(data.getAmtRecvDate());
                                            bank_flag = "";
                                            payment_type = "NEFT";
                                            no=data.getUtrNo();
                                        } else if (payment_flag.equals("rtgs")) {
                                            Criteria c = hib_session.createCriteria(NeftRtgsPayment.class);
                                            c.add(Restrictions.eq("recvMg", true));
                                            c.add(Restrictions.eq("workOrder", wo));
                                            NeftRtgsPayment data = (NeftRtgsPayment) c.list().get(0);
                                            depo_name = data.getDepositerName();
                                            amt_recv = data.getAmtRecv() + "";
                                            amt_recv_date=common.formateDate(data.getAmtRecvDate());
                                            bank_flag = "";
                                            payment_type = "RTGS";
                                            no=data.getUtrNo();
                                        } else if (payment_flag.equals("cheque")) {
                                            Criteria c = hib_session.createCriteria(CheaquePayment.class);
                                            c.add(Restrictions.eq("recvMg", true));
                                            c.add(Restrictions.eq("workOrder", wo));
                                            CheaquePayment data = (CheaquePayment) c.list().get(0);
                                            depo_name = data.getDepositerName();
                                            amt_recv = data.getAmtRecv() + "";
                                            amt_recv_date=common.formateDate(data.getAmtRecvDate());
                                            bank_flag = "";
                                            payment_type = "CHEQUE";
                                            bank=data.getBankName();
                                            no_flag = "Cheaque No:";
                                            b_flag="";
                                            no=data.getCheaqueNo();
                                        }
                                        hidden_flag = "";
                                    } else if (wo.getWoRent()) {
                                        out.print("RENTAL");
                                        bank_flag = "hidden=\"\"";
                                    } else {
                                        out.print("SHARING");
                                        bank_flag = "hidden=\"\"";
                                    }
                                    %></td>
                            </tr>
                            <tr <%out.print(hidden_flag);%>>
                                <th>Payment Method:</th>
                                <td><%out.print(payment_type);%></td>
                            </tr>
                            
                            <tr <%out.print(hidden_flag);%>>
                                <th>MG Amount:</th>
                                <td><%out.print(mg_amt);%></td>
                            </tr>
                            <tr <%out.print(hidden_flag);%>>
                                <th>Depositor Name:</th>
                                <td><%out.print(depo_name);%></td>
                            </tr>
                            <tr <%out.print(hidden_flag);%>>
                                <th>Amount Received:</th>
                                <td><%out.print(amt_recv);%></td>
                            </tr>
                            
                            <tr <%out.print(hidden_flag);%>>
                                <th>Amount Received Date:</th>
                                <td><%out.print(amt_recv_date);%></td>
                            </tr>
                        </table>
                    </div>
                </div><!-- /.col -->
                <div class="col-xs-6">
                    <p class="lead"><br></p>
                    <div class="table-responsive">
                        <table class="table" <%out.print(bank_flag);%>>
                            <tr>
                                <th style="width:50%"><%out.print(no_flag);%></th>
                                <td><%out.print(no);%></td>
                            </tr>
                            <tr>
                                <th <%out.print(b_flag);%>>Bank Name:</th>
                                <td><%out.print(bank);%></td>
                            </tr>
                        </table>
                    </div>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <!-- Table row -->
            <div class="row">
                <div class="col-xs-12 table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Week</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Theater rent</th>
                                <th>Distributor Share</th>
                                <th>Owner Share</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 0;
                                for (Object o : criteria.list()) {
                                    WoAgrrement wa = (WoAgrrement) o;

                            %>
                            <tr>
                                <td>Week <%out.print(++i);%></td>
                                <td><%out.print(wa.getStartDate());%></td>
                                <td><%out.print(wa.getEndDate());%></td>
                                <td><%out.print(wa.getTheaterRent());%></td>
                                <td><%out.print(wa.getDistributerShare());%></td>
                                <td><%out.print(wa.getOwnerShare());%></td>
                            </tr>
                            <%
                                }

                                hib_session.close();

                            %>
                        </tbody>
                    </table>
                </div><!-- /.col -->
            </div><!-- /.row -->



            <!-- this row will not appear when printing -->
            <div class="row no-print">
                <div class="col-xs-12">
                    <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                    <a href="select_Party_Names.jsp"><button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Add More Work Order</button></a>
                    <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;"><i class="fa fa-download"></i> Generate PDF</button>
                </div>
            </div>
        </section><!-- /.content -->
        <div class="clearfix"></div>
    </div><!-- /.content-wrapper -->



    <%@ include file="footer.jsp" %>
</html>