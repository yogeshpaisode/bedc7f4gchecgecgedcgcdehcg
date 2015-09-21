<%-- 
    Document   : view_PartyDetail
    Created on : Sep 10, 2015, 4:15:00 PM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theater Detail</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>View Theater Detail</h4>
        <%
            try {

                int p_id = Integer.parseInt(request.getAttribute("p_id").toString());
                int t_id = Integer.parseInt(request.getAttribute("t_id").toString());
                PartyDetail partyDetail = null;
                TheaterDetail theaterDetail = null;
                ScreenDetail screenDetail = null;
                List partyList = null;
                List theaterlist = null;
                List screeList = null;

                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();

                Criteria cr = hib_session.createCriteria(PartyDetail.class);

                cr.add(Restrictions.eq("PId", p_id));
                partyList = cr.list();
                partyDetail = (PartyDetail) partyList.get(0);

                out.print("<h1>" + partyDetail.getPName() + "</h1>");


                cr = hib_session.createCriteria(TheaterDetail.class);
                cr.add(Restrictions.eq("TId", t_id));
                theaterlist = cr.list();
                theaterDetail = (TheaterDetail) theaterlist.get(0);

                out.print("Theater Name:" + theaterDetail.getTName() + "<br>");
                out.print("Theater Type:" + theaterDetail.getTType() + "<br>");

                cr = hib_session.createCriteria(ScreenDetail.class);
                cr.add(Restrictions.eq("theaterDetail", theaterDetail));
                screeList = cr.list();

                if (screeList.size() >= 1) {
                    out.print("Screen Detail:<br><br>");
                    out.print("<table><th> <tr> <td>Screen Name</td> <td>Screen Number</td> <td>Screen Seats</td> </tr> </th>");
                }


                for (Object o : screeList) {
                    ScreenDetail sd = (ScreenDetail) o;
                    out.print("<tr> <td>" + sd.getSName() + "</td> <td>" + sd.getSNumber() + "</td> <td>" + sd.getSSeats() + "</td> </tr>");
                }

                if (screeList.size() >= 1) {
                    out.print("</table>");
                }
                hib_session.close();

            } catch (Exception e) {
                out.print(e + "");
            }



        %>
        <br><br>
        <a href="add_Theater.jsp"><button>Add More Theater</button></a>
    </body>
</html>
