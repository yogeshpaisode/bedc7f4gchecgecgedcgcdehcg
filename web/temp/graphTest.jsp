
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

    double global_Mg = 0;
    double global_amtRecv = 0;
    double global_diffrence = 0;
    double global_distributer_profit = 0;
    int mov_id = 1;
    String chart = "";
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session hib_session = sessionFactory.openSession();
    Criteria mov_criteria = hib_session.createCriteria(MovieDetail.class);
    mov_criteria.add(Restrictions.eq("movId", mov_id));
    MovieDetail movieDetail = (MovieDetail) mov_criteria.list().get(0);
    Criteria wo_criteria = hib_session.createCriteria(WorkOrder.class);
    wo_criteria.add(Restrictions.eq("movieDetail", movieDetail));
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date start_Date = movieDetail.getMovReleaseDate();
    Date end_Date = sdf.parse("2015-09-11");
    Common common = new Common();
    int days_from_two = common.getDays(end_Date, start_Date);
    Date temp_Date = null;
    HashMap<Date, DistributerProfit_Bean> date_Map = new HashMap<Date, DistributerProfit_Bean>();
    HashMap<String, Days_Bean> week_days_Map = new HashMap<String, Days_Bean>();
    HashMap<String, Circuit_Bean> circuit_Map = new HashMap<String, Circuit_Bean>();

    List week_days_list = new ArrayList();
    week_days_list.add("Fri");
    week_days_list.add("Sat");
    week_days_list.add("Sun");
    week_days_list.add("Mon");
    week_days_list.add("Tue");
    week_days_list.add("Wed");
    week_days_list.add("Thu");
    List circuit_list = new ArrayList();

    for (Object o : week_days_list) {
        Days_Bean ben = new Days_Bean();
        ben.setAmount(0);
        ben.setId(o.toString());
        week_days_Map.put(o.toString(), ben);
    }

    double grand_Total = 0;


    DistributerProfit_Bean dp_b = new DistributerProfit_Bean();
    dp_b.setAmount(0);
    dp_b.setId(common.formateDate(start_Date));
    date_Map.put(start_Date, dp_b);

    for (int i = 1; i < days_from_two; i++) {
        Calendar c = Calendar.getInstance();
        c.setTime(start_Date); // Now use today date.
        c.add(Calendar.DATE, i);
        temp_Date = c.getTime();

        DistributerProfit_Bean dpb = new DistributerProfit_Bean();
        dpb.setAmount(0);
        dpb.setId(common.formateDate(temp_Date));
        date_Map.put(temp_Date, dpb);

    }

    System.out.println("\n" + date_Map + "\n");
    //--Create Table

    for (Object wo_obj : wo_criteria.list()) {
        WorkOrder wo = (WorkOrder) wo_obj;
        PartyDetail pd = wo.getPartyDetail();
        String circuit = pd.getPCircuit();
        if (!(circuit_list.contains(circuit))) {
            Circuit_Bean ben = new Circuit_Bean();
            ben.setAmount(0);
            ben.setId(circuit);
            circuit_Map.put(circuit, ben);
        }
        Common com = new Common();
        double total = 0;
        double amt_recv = common.getPaymentReceived(wo);
        global_amtRecv = global_amtRecv + amt_recv;
        if (wo.getWoMg()) {
            total = total + wo.getWoMgAmount();
            global_Mg = global_Mg + wo.getWoMgAmount();
        }
        Criteria ptl_criteria = hib_session.createCriteria(ProfitTicketLog.class);
        ptl_criteria.add(Restrictions.eq("workOrder", wo));
        ptl_criteria.add(Restrictions.between("logDate", start_Date, end_Date));

        for (Object ptl_obj : ptl_criteria.list()) {
            ProfitTicketLog ptl = (ProfitTicketLog) ptl_obj;
            //--Load Aggrement
            Criteria aggre_criteria = hib_session.createCriteria(WoAgrrement.class);
            aggre_criteria.add(Restrictions.eq("workOrder", wo));

            for (Object agree_obj : aggre_criteria.list()) {
                WoAgrrement wa = (WoAgrrement) agree_obj;
                int days = common.getDays(wa.getEndDate(), wa.getStartDate());
                if (common.checkAggrement(wa.getStartDate(), wa.getEndDate(), ptl.getLogDate())) {
                    double mg_amount = wo.getWoMgAmount();
                    double amount = 0;
                    //--com is object define at line no 101 specially use for MG
                    amount = com.getDistributerProfit(wo.getWoRent(), wo.getWoSharing(), wo.getWoMg(), wa.getTheaterRent(), wa.getDistributerShare(), mg_amount, ptl.getNettProfit(), true, days);
                    global_distributer_profit = global_distributer_profit + amount;
                    total = total + amount;
                    DistributerProfit_Bean dpb = date_Map.get(ptl.getLogDate());
                    dpb.setAmount(amount);
                    //Week Day Wise
                    Days_Bean days_Bean = week_days_Map.get(com.getDayName(ptl.getLogDate()));
                    days_Bean.setAmount(amount);
                    //Circuit Wise
                    Circuit_Bean circuit_Bean = circuit_Map.get(circuit);
                    circuit_Bean.setAmount(amount);
                    
                    break;
                }
            }//--Aggrement Loop

        }//--PTL Loop
        global_diffrence = global_diffrence + (total - amt_recv);
    }//--Work Order Loop

    for (Map.Entry m : date_Map.entrySet()) {
        DistributerProfit_Bean dpb = (DistributerProfit_Bean) m.getValue();
        chart = chart + "{\"category\": \"" + dpb.getId() + "\",\"column-1\": \"" + dpb.getAmount() + "\"},";
        grand_Total = grand_Total + dpb.getAmount();
    }
    hib_session.close();
%>

<html:html lang="true">

    <script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
    <script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
    <script type="text/javascript">
        AmCharts.makeChart("chartdiv",
        {
            "type": "serial",
            "categoryField": "category",
            "startDuration": 1,
            "categoryAxis": {
                "gridPosition": "start"
            },
            "trendLines": [],
            "graphs": [
                {
                    "balloonText": "[[value]]",
                    "bullet": "round",
                    "id": "AmGraph-1",
                    "title": "",
                    "type": "smoothedLine",
                    "valueField": "column-1"
                }
            ],
            "guides": [],
            "valueAxes": [
                {
                    "id": "ValueAxis-1",
                    "title": "PROFIT"
                }
            ],
            "allLabels": [],
            "balloon": {},
            "legend": {
                "useGraphSettings": true
            },
            "dataProvider": [
        <%out.print(chart);%>
                ]
            }
        );
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>NFD-Graph Analysis</title>
    <style>
        table 
        {
            border-collapse:separate;
            border-spacing:0 2px;
        }
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">


    <section class="content">
        <h1 align="center"><% out.print(movieDetail.getMovName());%></h1>
        <h4 align="center">By <% out.print(movieDetail.getMovProduces());%></h4>
        <!--div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF; overflow-x: scroll;" ></div-->
    </section>
    <%

        for (Map.Entry m : week_days_Map.entrySet()) {
            Days_Bean days_Bean = (Days_Bean) m.getValue();
            out.print("Day: " + days_Bean.getId() + " Amount:" + days_Bean.getAmount() + "<br>");
        }
        out.print("<br><br>");
        for (Map.Entry m : circuit_Map.entrySet()) {
            Circuit_Bean circuit_Bean = (Circuit_Bean) m.getValue();
            out.print("Circuit: " + circuit_Bean.getId() + " Amount:" + circuit_Bean.getAmount() + "<br>");
        }

    %>

</body>
</html:html>
