<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Party Payment</title>
        <html:base/>
    </head>
    <body style="background-color: white">
         <jsp:include page="header.jsp"/><br>
        <h4>Select Payment Method</h4>
        <%

            int wo_id = Integer.parseInt(request.getParameter("wo_id").toString());

            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            Session hib_session = sessionFactory.openSession();
            WorkOrder wo = null;
            Criteria criteria = hib_session.createCriteria(WorkOrder.class);
            criteria.add(Restrictions.eq("woId", wo_id));
            wo = (WorkOrder) criteria.list().get(0);

        %>


        <html:form action="/party_payment">

            <table>
                <th><input type="radio" name="payment" value="cash"/>&nbsp;&nbsp;Cash</th>
                <th><input type="radio" name="payment" value="rtgs"/>&nbsp;&nbsp;RTGS</th>
                <th><input type="radio" name="payment" value="neft"/>&nbsp;&nbsp;NEFT</th>
                <th><input type="radio" name="payment" value="cheaque"/>&nbsp;&nbsp;Cheaque</th>
            </table>

            <input type="password" name="wo_id" value="<% out.print(wo_id); %>" hidden=""/>
            Amount Recev:<input type="number" name="amt_recv"/><br>
            Recev Date:<input type="date" name="date"/><br>
            Recev Time:<input type="time" name="time"/><br>
            <br>
            UTR No:<input type="text" name="utr"/><br>
            Cheaque No:<input type="text" name="cheq_no"/><br>
            Bank Name:<input type="text" name="bank"/><br>
            Depositor Name:<input type="text" name="depo_name"/><br>
            <input type="submit"/><br>


        </html:form>

    </body>
</html:html>
