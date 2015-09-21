<%-- 
    Document   : analysis_week_EXCEL
    Created on : Sep 18, 2015, 1:55:49 PM
    Author     : yogesh
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page import="com.nawandarfilmes.commonUtility.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excel Analysis</title>
        <script src="js/jquery-1.11.2.min.js"></script>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/><br><br>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date start_Date = sdf.parse("2015-09-04");
            Date end_Date = sdf.parse("2015-09-14");
            Common common = new Common();
            int days_from_two = common.getDays(end_Date, start_Date);
            String distri_Print="";
            Date temp_Date = null;
            List date_List = new ArrayList();
            List date_bean_List = new ArrayList();            
            HashMap<String, DistributerProfit_Bean> date_Map = new HashMap<String, DistributerProfit_Bean>();

            double grand_Total = 0;


            DistributerProfit_Bean dp_b = new DistributerProfit_Bean();
            dp_b.setAmount(0);
            dp_b.setId(common.formateDate(start_Date) + "distritotal");
            date_Map.put(common.formateDate(start_Date) + "distritotal", dp_b);

            //--Create Table            
            String th = "";
            String tr = "";
            date_List.add(start_Date);
            th = th + "<th>Theater Name</th><th>" + common.formateDate(start_Date) + "</th><th>" + common.formateDate(start_Date) + "<br>Distributer Profit</th>";
            for (int i = 1; i < days_from_two; i++) {
                Calendar c = Calendar.getInstance();
                c.setTime(start_Date); // Now use today date.
                c.add(Calendar.DATE, i);
                temp_Date = c.getTime();
                date_List.add(temp_Date);
                DistributerProfit_Bean dpb = new DistributerProfit_Bean();
                dpb.setAmount(0);
                dpb.setId(common.formateDate(temp_Date) + "distritotal");
                date_Map.put(common.formateDate(temp_Date) + "distritotal", dpb);
                th = th + "<th>" + common.formateDate(temp_Date) + "<br>Gross Profit</th><th>" + common.formateDate(temp_Date) + "<br>Distributer Profit</th>";
            }
            th = th + "<th>Distributer Total NETT Profit</th>";
            //--Create Table

            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            int mov_id = 1;

            Criteria mov_criteria = hib_session.createCriteria(MovieDetail.class);
            mov_criteria.add(Restrictions.eq("movId", mov_id));
            MovieDetail movieDetail = (MovieDetail) mov_criteria.list().get(0);

            Criteria wo_criteria = hib_session.createCriteria(WorkOrder.class);
            wo_criteria.add(Restrictions.eq("movieDetail", movieDetail));

            for (Object wo_obj : wo_criteria.list()) {
                WorkOrder wo = (WorkOrder) wo_obj;
                double total = 0;

                int wo_id = wo.getWoId();
                tr = tr + "<tr><td>" + wo.getTheaterDetail().getTName() + "</td></td>";
                for (Object date_obj : date_List) {
                    Date tr_date = (Date) date_obj;
                    tr = tr + "<td id='" + common.formateDate(tr_date) + wo_id + "total'></td><td id='" + common.formateDate(tr_date) + wo_id + "dis'></td>";
                }

                Criteria ptl_criteria = hib_session.createCriteria(ProfitTicketLog.class);
                ptl_criteria.add(Restrictions.eq("workOrder", wo));
                ptl_criteria.add(Restrictions.between("logDate", start_Date, end_Date));

                for (Object ptl_obj : ptl_criteria.list()) {
                    ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;
                    DateBean db = new DateBean();
                    db.setId("" + common.formateDate(ptl.getLogDate()) + wo_id + "total");
                    db.setAmount(ptl.getNettProfit() + "");
                    date_bean_List.add(db);

                    //--Load Aggrement
                    Criteria aggre_criteria = hib_session.createCriteria(WoAgrrement.class);
                    aggre_criteria.add(Restrictions.eq("workOrder", wo));

                    for (Object agree_obj : aggre_criteria.list()) {
                        WoAgrrement wa = (WoAgrrement) agree_obj;
                        int days = common.getDays(wa.getEndDate(), wa.getStartDate());
                        if (common.checkAggrement(wa.getStartDate(), wa.getEndDate(), ptl.getLogDate())) {
                            double mg_amount = wo.getWoMgAmount();
                            double amount = 0;
                            amount = common.getDistributerProfit(wo.getWoRent(), wo.getWoSharing(), wo.getWoMg(), wa.getTheaterRent(), wa.getDistributerShare(), mg_amount, ptl.getNettProfit(), true, days);
                            total = total + amount;
                            DateBean bean = new DateBean();
                            bean.setAmount(amount + "");
                            bean.setId(common.formateDate(ptl.getLogDate()) + wo_id + "dis");
                            date_bean_List.add(bean);
                            DistributerProfit_Bean dpb = date_Map.get(common.formateDate(ptl.getLogDate()) + "distritotal");                            
                            dpb.setAmount(amount);
                            break;
                        }
                    }//--Aggrement Loop

                }//--PTL Loop

                tr = tr + "<td>" + total + "</td></tr>";
            }//--Work Order Loop
            tr = tr + "<tr><td>Grand Total</td></td>";

            for (Object date_obj : date_List) {
                Date tr_date = (Date) date_obj;
                tr = tr + "<td id='" + common.formateDate(tr_date) + "neettotal'></td><td id='" + common.formateDate(tr_date) + "distritotal'>00</td>";
            }

            for (Object wo_obj : wo_criteria.list()) {
                WorkOrder wo = (WorkOrder) wo_obj;

                for (Object date_obj : date_List) {
                    double totalProfit = 0;
                    Date on_date = (Date) date_obj;
                    Criteria ptl_criteria = hib_session.createCriteria(ProfitTicketLog.class);
                    ptl_criteria.add(Restrictions.eq("logDate", on_date));
                    ptl_criteria.add(Restrictions.eq("workOrder", wo));

                    for (Object ptl_obj : ptl_criteria.list()) {
                        ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;
                        totalProfit = totalProfit + ptl.getNettProfit();                        
                    }//--PTL Loop
                    DateBean db = new DateBean();
                    db.setId("" + common.formateDate(on_date) + "neettotal");
                    db.setAmount(totalProfit + "");
                    date_bean_List.add(db);

                }//--Date Loop
            }//--Work Order
            for (Map.Entry m : date_Map.entrySet()) {
                    DistributerProfit_Bean dpb = (DistributerProfit_Bean) m.getValue();
                    distri_Print=distri_Print+"$('#" + dpb.getId() + "').html('" + dpb.getAmount() + "');";
                    grand_Total = grand_Total + dpb.getAmount();
                }
            tr = tr + "<td>" + (long) grand_Total + "</td></tr>";

        %>

        <script>
            $(document).ready(function(){
            <%
                for (Object date_obj : date_bean_List) {
                    DateBean db = (DateBean) date_obj;
                    out.print("$('#" + db.getId() + "').html('" + db.getAmount() + "');");
                }

                out.print(distri_Print);

            %>
                });
        </script>

        <table align="center">

            <tr>
                <% out.print(th + tr);%>
            </tr>
        </table>
    </body>
</html>
