<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Party</title>
        <script>
            window.location.hash="no-back-button";
            window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange=function(){window.location.hash="no-back-button";}
        </script> 
        <html:base/>
    </head>
    <body style="background-color: white">
        <div align="center">
            <br><br><br><br><br><br>
            <html:form action="/login_theater">
                <h3>Theater LogIn</h3>
                <html:errors property="login" />
                Unique Key:<input type="text" name="key" /><br><br>
                <input type="submit"/><input type="reset"/>
            </html:form>
        </div>
    </body>
</html:html>
