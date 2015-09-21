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
        <title>Select Theater</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>select Theater</h4>
        <%
            int mov_id = 0;
            int id=0;
            Common common = new Common();
            MovieDetail movieDetail = null;
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            mov_id = Integer.parseInt(request.getParameter("mov_id"));

            Criteria criteria = hib_session.createCriteria(MovieDetail.class);
            criteria.add(Restrictions.eq("movId", mov_id));

            movieDetail = (MovieDetail) criteria.list().get(0);

            out.print("<div align=\"center\"><h1>" + movieDetail.getMovName());
            out.print("</h1><h3>" + movieDetail.getMovProduces() + " Procution</h3><br>");

        %>

        <table>

            <tr bgcolor="yellow">
                <th>Sr.No</th>
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
                Criteria party_criteria = hib_session.createCriteria(PartyDetail.class);
                List party_List = party_criteria.list();

                String p_id = "";
                String p_name = "";
                String p_phone = "";
                int t_id = 0;
                String t_name = "";
                String t_phone = "";
                String s_name = "";
                String s_number = "";
                String zero = "";
                String color = "";
                String actionName = "";
                String redirectPageName = "";

                int list = 1;


                for (Object po : party_List) {
                    PartyDetail pd = (PartyDetail) po;
                    id = pd.getPId();
                    p_id = "NFD-" + common.getZeros(id) + pd.getPId();
                    p_name = pd.getPName();
                    p_phone = pd.getPOfficeNumber();

                    Criteria theater_criteria = hib_session.createCriteria(TheaterDetail.class);
                    theater_criteria.add(Restrictions.eq("partyDetail", pd));
                    List theater_List = theater_criteria.list();

                    for (Object to : theater_List) {
                        TheaterDetail td = (TheaterDetail) to;
                        t_name = td.getTName();
                        t_phone = td.getTPhoneNumber();
                        t_id = td.getTId();

                        Criteria screen_criteria = hib_session.createCriteria(ScreenDetail.class);
                        screen_criteria.add(Restrictions.eq("theaterDetail", td));
                        List screeen_List = screen_criteria.list();

                        for (Object so : screeen_List) {

                            ScreenDetail sd = (ScreenDetail) so;
                            s_name = sd.getSName();
                            s_number = sd.getSNumber() + "";
                            int s_no=sd.getSNumber();
                            int s_id=sd.getSId();

                            Criteria work_order_Criteria = hib_session.createCriteria(WorkOrder.class);
                            work_order_Criteria.add(Restrictions.eq("movieDetail", movieDetail));
                            work_order_Criteria.add(Restrictions.eq("theaterDetail", td));
                            work_order_Criteria.add(Restrictions.eq("partyDetail", pd));
                            work_order_Criteria.add(Restrictions.eq("screenDetail", sd));
                            work_order_Criteria.add(Restrictions.eq("woAggrement", true));

                            if (work_order_Criteria.list().size() >= 1) {
                                color = "red";
                                actionName = "Update Work Order";
                                redirectPageName = "";
                            } else {
                                color = "green";
                                actionName = "Place Work Order";
                                redirectPageName = "add_Workorder.jsp";
                            }


                            out.print("<tr bgcolor=\""+color+"\"><td>" + ++list + "</td><td>" + p_id + "</td><td>" + p_name + "</td><td>" + p_phone + "</td><td>NFD-" + common.getZeros(t_id) + t_id + "</td><td>" + t_name + "</td><td>" + t_phone + "</td><td>" + s_name + "</td><td>" + s_number + "</td><td><form action='"+redirectPageName+"' method=\"post\"><input type='password' hidden name='p_id' value='"+id+"'/><input type='password' hidden name='p_name' value='"+p_name+"'/><input type='password' hidden name='p_phone' value='"+p_phone+"'/><input type='password' hidden name='t_id' value='"+t_id+"'/><input type='password' hidden name='t_name' value='"+t_name+"'/><input type='password' hidden name='t_phone' value='"+t_phone+"'/><input type='password' hidden name='s_name' value='"+s_name+"'/><input type='password' hidden name='s_no' value='"+s_no+"'/><input type='password' hidden name='s_id' value='"+s_id+"'/><input type='password' hidden name='m_id' value='"+mov_id+"'/><input type='submit' value='"+actionName+"'/></form></td></tr>");

                        }//Screen Loop
                    }// Theater Loop
                }//Party Loop

                hib_session.close();

            %>

        </table>

    </div>
</body>
</html>
