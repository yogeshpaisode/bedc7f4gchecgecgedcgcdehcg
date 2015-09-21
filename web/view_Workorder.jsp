<%-- 
    Document   : view_Workorder
    Created on : Sep 12, 2015, 6:16:37 PM
    Author     : yogesh
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Work Order</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>View Work Order</h4>


        <%
            PartyDetail par = (PartyDetail) request.getAttribute("partyDetail");
            MovieDetail mov = (MovieDetail) request.getAttribute("movieDetail");
            TheaterDetail the = (TheaterDetail) request.getAttribute("theaterDetail");
            ScreenDetail scrn = (ScreenDetail) request.getAttribute("screenDetail");
            WorkOrder wo = (WorkOrder) request.getAttribute("wo");
            int wo_id = Integer.parseInt(request.getAttribute("wo_id").toString());

        %>

        <h3>Movie Detail:</h3>
        ID:<% out.print(mov.getMovId());%><br>
        Name:<% out.print(mov.getMovName());%><br>
        Producer:<% out.print(mov.getMovProduces());%><br>
        Release Date:<% out.print(mov.getMovReleaseDate());%><br>
        <hr>

        <h3>Party Detail:</h3>
        ID:<% out.print(par.getPId());%><br>
        Name:<% out.print(par.getPName());%><br>
        Phone:<% out.print(par.getPStdCode() + "-" + par.getPOfficeNumber());%><br>
        Email:<% out.print(par.getPEmail());%><br>        
        <hr>

        <h3>Theater Detail:</h3>
        ID:<% out.print(the.getTId());%><br>
        Name:<% out.print(the.getTName());%><br>
        Phone:<% out.print(the.getTPhoneNumber());%><br>
        Email:<% out.print(the.getTEmail());%><br>
        Screen Name:<% out.print(scrn.getSName());%><br>
        Screen No:<% out.print(scrn.getSNumber());%><br>
        Screen Seats Capacity:<% out.print(scrn.getSSeats());%><br>

        <hr>

        <h3>Work Order Detail:</h3>
        ID:<% out.print(wo.getWoId());%><br>
        Agreement Type:<%

            if (wo.getWoMg() == true) {
                out.print("MG");
            } else if (wo.getWoRent() == true) {
                out.print("Rent");
            } else {
                out.print("Sharing");
            }
        %><br>

        <hr>

    </body>
</html>
