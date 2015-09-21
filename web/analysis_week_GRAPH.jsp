<%@page import="org.hibernate.Query"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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

<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session hib_session = sessionFactory.openSession();
    Criteria criteria = hib_session.createCriteria(MovieDetail.class);
    criteria.add(Restrictions.eq("movId", 1));
    MovieDetail md = (MovieDetail) criteria.list().get(0);
    Date releaseDate = md.getMovReleaseDate();
    Date startDate = releaseDate;
    Date endDate = null;
    List dateList = new ArrayList();

    String chart = "";

    double sunday = 0;
    double monday = 0;
    double tuesday = 0;
    double wednesday = 0;
    double thursday = 0;
    double friday = 0;
    double saturday = 0;

    try {

        for (int i = 0; i < 7; ++i) {
            Calendar c = Calendar.getInstance();
            c.setTime(startDate); // Now use today date.
            c.add(Calendar.DATE, i);
            dateList.add(c.getTime());
            endDate=c.getTime();
        }

        criteria = hib_session.createCriteria(WorkOrder.class);
        criteria.add(Restrictions.eq("movieDetail", md));
        List wo_list = criteria.list();

        for (Object o : wo_list) {
            WorkOrder wo = (WorkOrder) o;

            criteria = hib_session.createCriteria(ProfitTicketLog.class);
            criteria.add(Restrictions.eq("workOrder", wo));
            for (Object ptl_obj : criteria.list()) {
                ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;

                for (Object date_obj : dateList) {
                    Date onDate = (Date) date_obj;
                    if (onDate.equals(ptl.getLogDate())) {

                        String onDateStr = onDate.toString();
                        if (onDateStr.startsWith("Fri")) {
                            friday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Sat")) {
                            saturday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Sun")) {
                            sunday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Mon")) {
                            monday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Tue")) {
                            tuesday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Wed")) {
                            wednesday += ptl.getNettProfit();
                        }
                        if (onDateStr.startsWith("Thu")) {
                            thursday += ptl.getNettProfit();
                        }
                    }//-Compare Date
                }//--Date Lsit


            }//--Profit Ticket log
        }//--Profit Ticket Log


        for (Object o : dateList) {
            Date onDate = (Date) o;
            
            String onDateStr = onDate.toString();
            String forDate=dateFormat.format(onDate);

            if (onDateStr.startsWith("Fri")) {
                chart = chart + "['Friday "+forDate+"', " + friday + "],";

            }
            if (onDateStr.startsWith("Sat")) {
                chart = chart + "['Saturday "+forDate+"', " + saturday + "],";

            }
            if (onDateStr.startsWith("Sun")) {
                chart = chart + "['Sunday "+forDate+"', " + sunday + "],";

            }
            if (onDateStr.startsWith("Mon")) {
                chart = chart + "['Monday "+forDate+"', " + monday + "],";

            }
            if (onDateStr.startsWith("Tue")) {
                chart = chart + "['Tuesday "+forDate+"', " + tuesday + "],";

            }
            if (onDateStr.startsWith("Wed")) {
                chart = chart + "['Wednesday "+forDate+"', " + wednesday + "],";

            }
            if (onDateStr.startsWith("Thu")) {
                chart = chart + "['Thursday "+forDate+"', " + thursday + "],";

            }
        }

       
        
        
        hib_session.close();

    } catch (Exception e) {
        out.print(e);
    }
%>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Analysis</title>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script>
            google.load('visualization', '1', {packages: ['corechart', 'bar']});
            google.setOnLoadCallback(drawMultSeries);

            function drawMultSeries() {
                var data = google.visualization.arrayToDataTable([
                    ['Day', 'Profit'],
                    <% out.print(chart);%>
                    ]);

                    var options = {
                        title: 'Profit for Date <% out.print(dateFormat.format(startDate)+" To "+dateFormat.format(endDate));%>',
                        chartArea: {width: '50%'},
                        hAxis: {
                            title: 'Profit',
                            minValue: 0
                        },
                        vAxis: {
                            title: 'Days'
                        }
                    };
                    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
        </script>
    </head>
    <body style="background-color: white">

        <jsp:include page="header.jsp"/>
        <h1 align="center"><% out.print(md.getMovName());%></h1>
        <h4 align="center">By <% out.print(md.getMovProduces());%></h4>
        
        <div id="chart_div"></div>
    </body>
</html:html>
