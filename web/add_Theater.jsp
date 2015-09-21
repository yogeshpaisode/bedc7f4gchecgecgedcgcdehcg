<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Theater</title>
        <html:base/>
    </head>
    <body style="background-color: white">
        <jsp:include page="header.jsp"/><br>
        <h4>Add Theater Detail</h4>
        <html:form action="/add_Theater">

            <%

                List partyList = null;

                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_Session = sessionFactory.openSession();
                Criteria criteria = hib_Session.createCriteria(PartyDetail.class);
                partyList = criteria.list();
                out.print("Select Party Name:<select name=\"p_id\">");
                for (Object o : partyList) {
                    PartyDetail partyDetail = (PartyDetail) o;
                    out.print("<option value=\"" + partyDetail.getPId() + "\">" + partyDetail.getPName() + "</option>");
                }
                out.print("</select>");
                hib_Session.close();
            %>
            <br>
            Theater Name:<input type="text" name="t_name"/><br>
            Address:<textarea name="t_address"></textarea><br>
            City:<input type="text" name="t_city"/><br>
            State:<input type="text" name="t_state"/><br>
            Country:<input type="text" name="t_country"/><br>
            Email:<input type="text" name="t_email"/><br>
            STD Code:<input type="text" name="t_std_Code"/><br>
            Phone Number:<input type="text" name="t_phone"/><br>
            Fax:<input type="text" name="t_fax"/><br>
            <input type="radio" name="t_type" value="single"/>Single&nbsp;&nbsp;<input type="radio" name="t_type" value="multiplex"/>Multiplex<br>
            No of Screen:<input type="text" name="t_no_Screen"/><br>

            <br>

            <br>
            1st Screen Detail:
            <hr>
            Screen Name:<input type="text" name="s1_name"/><br>
            Screen Number:<input type="text" name="s1_number"/><br>
            No of Seats:<input type="text" name="s1_seats"/><br>
            <hr>
            <br>

            <br>
            2nd Screen Detail:
            <hr>
            Screen Name:<input type="text" name="s2_name"/><br>
            Screen Number:<input type="text" name="s2_number"/><br>
            No of Seats:<input type="text" name="s2_seats"/><br>
            <hr>
            <br>

            <br>
            3st Screen Detail:
            <hr>
            Screen Name:<input type="text" name="s3_name"/><br>
            Screen Number:<input type="text" name="s3_number"/><br>
            No of Seats:<input type="text" name="s3_seats"/><br>
            <hr>
            <br>

            <br>
            4th Screen Detail:
            <hr>
            Screen Name:<input type="text" name="s4_name"/><br>
            Screen Number:<input type="text" name="s4_number"/><br>
            No of Seats:<input type="text" name="s4_seats"/><br>
            <hr>
            <br>



            <input type="submit"/><input type="reset"/>

        </html:form>


    </body>
</html:html>
