<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Movie</title>
        <html:base/>
    </head>
    <body style="background-color: white">
        
        <jsp:include page="header.jsp"/>
        <html:form action="/add_Movie">
            
            Movie Name:<input type="text" name="m_name"/><br>
            Producer Name:<input type="text" name="m_producer"/><br>
            Release Date:<input type="date" name="m_release_date"/><br>
            Banner Image URL:<input type="text" name="m_banner_img_link"/><br>
            YouTube URL:<textarea name="m_youtube_link"></textarea><br>
            
            <br><input type="submit"/><input type="reset"/>
            
        </html:form>
        
    </body>
</html:html>
