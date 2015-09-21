<%-- 
    Document   : view_MovieDetail
    Created on : Sep 11, 2015, 11:32:58 AM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Detail</title>
    </head>
    <body>
         <jsp:include page="header.jsp"/><br>
        <h4>View Movie Detail</h4>

        <%
            try {

                int mov_id = Integer.parseInt(request.getAttribute("mov_id").toString());
                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                Session hib_session = sessionFactory.openSession();
                List movieList = null;
                MovieDetail movieDetail = null;


                Criteria cr = hib_session.createCriteria(MovieDetail.class);
                cr.add(Restrictions.eq("movId", mov_id));

                movieList = cr.list();

                movieDetail = (MovieDetail) movieList.get(0);

                out.print("Movie Name:<h1>" + movieDetail.getMovName() + "</h1><br>");
                out.print("Producer Name:" + movieDetail.getMovProduces() + "<br>");
                out.print("<img src='" + movieDetail.getMovBannesImgLink() + "'/><br>");
                out.print("Movie Trailer:<br>" + movieDetail.getMovYoutubeLink() + "<br>");
                
                hib_session.close();

            } catch (Exception e) {
                out.print(e + "");
            }

    %>

    <a href="add_Movie.jsp"><button>Add More Movie</button></a>
    
    </body>
</html>
