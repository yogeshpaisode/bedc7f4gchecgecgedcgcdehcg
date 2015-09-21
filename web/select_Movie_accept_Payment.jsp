<%-- 
    Document   : view_MovieDetail
    Created on : Sep 11, 2015, 11:32:58 AM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Movie</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>Select Movie</h4>

        <form action="select_work_order.jsp" method="post">
        
        <%
            try {
                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();
                List movieList = null;
                int count = 1;
                String apender = "";
                
                Criteria criteria = hib_session.createCriteria(MovieDetail.class);
                movieList = criteria.list();

                for (Object o : movieList) {
                    MovieDetail md = (MovieDetail) o;
                    if (count % 4 == 0) {
                        apender = apender + "<br>";
                    }
                    apender = apender + "<input type='radio' value='" + md.getMovId() + "' name=\"mov_id\"/>&nbsp;&nbsp;" + md.getMovName();
                    count++;
                }

                out.print(apender);

                hib_session.close();

            } catch (Exception e) {
                out.print(e + "");
            }

        %>

        <br>
        <input type="submit" /><input type="reset"/>
        
        </form>


    </body>
</html>
