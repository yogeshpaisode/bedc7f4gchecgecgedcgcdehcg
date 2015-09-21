<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter Sell and Profit</title>
        <script>
            window.location.hash="no-back-button";
            window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange=function(){window.location.hash="no-back-button";}
        </script> 
        <html:base/>
    </head>
    <body style="background-color: white">
         <jsp:include page="header.jsp"/><br>
        <h4>Add Ticket Sell and Profit</h4>

        <div align='center'>

            <%
                String date = null;
                int wo_id = 0;
                String flag = "";
                String hidden = "";
                try {
                    flag = request.getAttribute("flag").toString();
                    date = request.getAttribute("date").toString();
                    WorkOrder wo = null;
                    wo_id = Integer.parseInt(request.getAttribute("wo_id").toString());

                    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                    Session hib_session = sessionFactory.openSession();
                    Criteria criteria = hib_session.createCriteria(WorkOrder.class);
                    criteria.add(Restrictions.eq("woId", wo_id));

                    wo = (WorkOrder) criteria.list().get(0);

                    PartyDetail p = wo.getPartyDetail();
                    MovieDetail m = wo.getMovieDetail();
                    TheaterDetail t = wo.getTheaterDetail();
                    ScreenDetail s = wo.getScreenDetail();


                    out.print("<table>");

                    out.print("<th align='left'><h3>Work Order Detail:</h3>");
                    out.print("<h5>Unique Id: NFD-" + wo.getWoId() + "</h5></th>");
                    out.print("<th align='left'><h3>Movie Detail:</h3>");
                    out.print("<h5>Name: " + m.getMovName() + "</h5><h5>Producer: " + m.getMovProduces() + "</h5></th>");
                    out.print("<th align='left'><h3>Theater and Screen Detal</h3>");
                    out.print("<h5>Unique Id: NFD-" + t.getTId() + "</h5>");
                    out.print("<h5>Theater Name:" + t.getTName() + "</h5>");
                    out.print("<th align='left'><h3>Screen Detail:</h3>");
                    out.print("<h5>Screen Name:" + s.getSName() + "</h5>");
                    out.print("<h5>Screen Seats Capacity:" + s.getSSeats() + "</h5><th></th>");

                    out.print("</table><hr>");

                    hib_session.close();

                } catch (Exception e) {
                    out.print(e);
                }


                if (flag.equals("false")) {
                    String message = request.getAttribute("msg").toString();
                    out.print(message);
                    hidden = "hidden=\"\"";
                }
            %>





            <div <% out.print(hidden);%>>

                <html:form action="/sell_profit">
                    <input type="text" name="date" value="<% out.print(date);%>" hidden="">
                    <input type="text" name="wo_id" value="<% out.print(wo_id);%>" hidden="">

                    Log Date:<h2><% out.print(date);%></h2>
                    Ticket Sold:<input type="number" name="ticket" value="30"/><br>
                    Gross Income:<input type="number" name="gross" value="556350"/><br><br>
                    NETT Income:<input type="number" name="nett"/><br><br>
                    ED.TAX:<input type="number" name="edtax" value="13098"/><br><br>
                    

                    <input type="submit"/>
                </html:form>

            </div>


        </div>

    </body>
</html:html>
