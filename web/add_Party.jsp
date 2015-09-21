<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Party</title>
        <html:base/>
    </head>
    <body style="background-color: white">
        <jsp:include page="header.jsp"/><br>
        <h4>Add Party Detail</h4>
        <html:form action="/add_Party">

            Party Name:<input type="text" name="p_name" /><br>
            STD Code:<input type="text" name="p_std_code" /><br>
            Office Number:<input type="text" name="p_std_number" /><br>
            Email :<input type="text" name="p_email" /><br>
            Address:<textarea name="p_address"></textarea></br>
            State:<input type="text" name="p_state" /><br>
            City:<input type="text" name="p_city" /><br>
            Fax:<input type="text" name="p_fax" /><br>
            Country:<input type="text" name="p_country" /><br>
            Circuit:<input type="text" name="p_circuit" /><br>
            Region:<input type="text" name="p_circuit_region" /><br>

            <br>

            <br>
            <hr>
            1st Member Detail:
            Name:<input type="text" name="m1_name"/><br>
            Email:<input type="email" name="m1_email"/><br>
            Contact Number:<input type="text" name="m1_contact"/><br>
            <hr>
            <br>

            <br>
            <hr>
            2nd Member Detail:
            Name:<input type="text" name="m2_name"/><br>
            Email:<input type="email" name="m2_email"/><br>
            Contact Number:<input type="text" name="m2_contact"/><br>
            <hr>
            <br>

            <br>
            <hr>
            3rd Member Detail:
            Name:<input type="text" name="m3_name"/><br>
            Email:<input type="email" name="m3_email"/><br>
            Contact Number:<input type="text" name="m3_contact"/><br>
            <hr>
            <br>


            <br>
            <hr>
            4th Member Detail:
            Name:<input type="text" name="m4_name"/><br>
            Email:<input type="email" name="m4_email"/><br>
            Contact Number:<input type="text" name="m4_contact"/><br>
            <hr>
            <br>

            <br>
            <hr>
            5th Member Detail:
            Name:<input type="text" name="m5_name"/><br>
            Email:<input type="email" name="m5_email"/><br>
            Contact Number:<input type="text" name="m5_contact"/><br>
            <hr>
            <br>


            <input type="submit"/><input type="reset"/>

        </html:form>



    </body>
</html:html>
