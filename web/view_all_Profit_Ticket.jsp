<%-- 
    Document   : view_all_Profit_Ticket
    Created on : Sep 14, 2015, 4:14:53 PM
    Author     : yogesh
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log</title>
        <script src="js/jquery-1.11.2.min.js"></script>

        <script type="text/javascript">
            function disableF5(e) { if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82) e.preventDefault(); };
            $(document).ready(function(){
                $(document).on("keydown", disableF5);
            });
            window.location.hash="no-back-button";
            window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange=function(){window.location.hash="no-back-button";}
        </script>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>View Theater Profit Detail:</h4>

        <br><br><br>


        <table align="center">
            <tr>
                <th>Sr.No:</th>
                <th>Log Date:</th>
                <th>Entry Date:</th>
                <th>Total Ticket Sold:</th>
                <th>Profit:</th>
            </tr>


            <%
                int wo_id = Integer.parseInt(request.getAttribute("wo_id").toString());
                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();
                int count = 0;
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
                Criteria criteria = hib_session.createCriteria(WorkOrder.class);
                criteria.add(Restrictions.eq("woId", wo_id));

                WorkOrder wo = (WorkOrder) criteria.list().get(0);
                criteria = hib_session.createCriteria(ProfitTicketLog.class);
                criteria.add(Restrictions.eq("workOrder", wo));
                double totalProfit = 0;
                for (Object o : criteria.list()) {

                    ProfitTicketLog log = (ProfitTicketLog) o;
                    totalProfit = totalProfit + log.getNettProfit();
                    out.print("<tr><td>" + (++count) + "</td><td>" + dateFormat.format(log.getLogDate()) + "</td><td>" + dateFormat.format(log.getEntryDateTime()) + "</td><td>" + log.getTicketSold() + "</td><td>" + log.getNettProfit() + "</td></tr>");
                }
                out.print("<tr><td></td><td></td><td></td><td>Total Profit:</td><td>" + totalProfit + "</td></tr>");

            %>

        </table>

    </body>
</html>
