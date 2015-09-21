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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Party Detail</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>View Party Detail</h4>
        <%
            try {

                int p_id = Integer.parseInt(request.getAttribute("p_id").toString());
                List party_Detail = null;
                List party_Members_Detail = null;
                PartyDetail pd = null;

                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();

                Criteria cr = hib_session.createCriteria(PartyDetail.class);
                cr.add(Restrictions.eq("PId", p_id));
                party_Detail = cr.list();


                pd = (PartyDetail) party_Detail.get(0);


                cr = hib_session.createCriteria(MembersDetail.class);
                cr.add(Restrictions.eq("partyDetail", pd));
                party_Members_Detail = cr.list();

                out.print("Party Name:" + pd.getPName() + "<br>");
                out.print("Party State:" + pd.getPState() + "<br>");
                out.print("Party City:" + pd.getPCity() + "<br>");
                out.print("Party Circuit:" + pd.getPCircuit() + "<br>");
                out.print("Party Region:" + pd.getPCircuitRegion() + "<br>");

                if (party_Members_Detail.size() >= 1) {
                    out.print("Member Detail:<br><br>");
                    out.print("<table><th> <tr> <td>Name</td> <td>Email</td> <td>Contact</td> </tr> </th>");
                }

                for (Object o : party_Members_Detail) {
                    MembersDetail membersDetail = (MembersDetail) o;
                    out.print("<tr> <td>" + membersDetail.getMName() + "</td> <td>" + membersDetail.getMEmail() + "</td> <td>" + membersDetail.getMContact() + "</td> </tr>");
                }

                if (party_Members_Detail.size() >= 1) {
                    out.print("</table>");
                }
                hib_session.close();
            } catch (Exception e) {
                out.print(e + "");
            }



        %>
        <br><br>
        <a href="add_Party.jsp"><button>Add More Party</button></a>
    </body>
</html>
