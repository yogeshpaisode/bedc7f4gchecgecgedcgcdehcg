<%-- 
    Document   : select_Party_Names
    Created on : Sep 11, 2015, 3:11:46 PM
    Author     : yogesh
--%>

<%@page import="com.sun.org.apache.regexp.internal.StreamCharacterIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page import="com.nawandarfilmes.commonUtility.Common"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Work Order</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>Select Work Order</h4>
        <%
            int mov_id = 0;
            int list = 0;
            String redirectPageName = "process_Party_Payment.jsp";
            Common common = new Common();
            String rows = "";
            MovieDetail movieDetail = null;
            PartyDetail partyDetail = null;
            TheaterDetail theaterDetail = null;
            ScreenDetail screenDetail = null;

            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            mov_id = Integer.parseInt(request.getParameter("mov_id"));

            Criteria criteria = hib_session.createCriteria(MovieDetail.class);
            criteria.add(Restrictions.eq("movId", mov_id));
            movieDetail = (MovieDetail) criteria.list().get(0);

            criteria = hib_session.createCriteria(WorkOrder.class);
            criteria.add(Restrictions.eq("movieDetail", movieDetail));

            for (Object o : criteria.list()) {
                WorkOrder wo = (WorkOrder) o;
                partyDetail = wo.getPartyDetail();
                theaterDetail = wo.getTheaterDetail();
                screenDetail = wo.getScreenDetail();
                rows = rows + "<tr bgcolor=\"green\"><td>" + ++list + "</td><td>NDF-" + common.getZeros(wo.getWoId()) + wo.getWoId() + "</td><td>NDF-" + common.getZeros(partyDetail.getPId()) + partyDetail.getPId() + "</td><td>" + partyDetail.getPName() + "</td><td>" + partyDetail.getPOfficeNumber() + "</td><td>NFD-" + common.getZeros(theaterDetail.getTId()) + theaterDetail.getTId() + "</td><td>" + theaterDetail.getTName() + "</td><td>" + theaterDetail.getTPhoneNumber() + "</td><td>" + screenDetail.getSName() + "</td><td>" + screenDetail.getSNumber() + "</td><td><form action='" + redirectPageName + "' method=\"post\"><input type='password' hidden name='m_id' value='" + mov_id + "'/><input type='password' hidden name='wo_id' value='" + wo.getWoId() + "'/><input type='submit' value='Accept Payment'/></form></td></tr>";
            }

            out.print("<div align=\"center\"><h1>" + movieDetail.getMovName());
            out.print("</h1><h3>" + movieDetail.getMovProduces() + " Procution</h3><br>");

        %>

        <table>

            <tr bgcolor="yellow">
                <th>Sr.No</th>
                <th>Work Order Id:</th>
                <th>Party ID</th>
                <th>Party Name</th>
                <th>Party Phone</th>
                <th>Theater ID</th>
                <th>Theater Name</th>
                <th>Theater Phone</th>
                <th>Theater Screen Name</th>
                <th>Theater Screen Number</th>
                <th>Action</th>
            </tr>

            <%
                out.print(rows);
                hib_session.close();%>

        </table>

    </div>
</body>
</html>
