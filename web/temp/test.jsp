<%-- 
    Document   : test
    Created on : Sep 16, 2015, 6:19:58 PM
    Author     : yogesh
--%>

<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="jquery-1.11.2.min.js"></script>
       
    </head>
    <body>

        <script>
            
            //parseDate();
            function parseDate(){             
                var s="2015-09-04".split("-");
                var e="2015-09-25".split("-");
                var ONE_DAY = 1000 * 60 * 60 * 24;
                
                var s_year=s[0];
                var s_date=s[2];   
                var s_month=s[1]-1;
                
                var e_year=e[0];
                var e_date=e[2];   
                var e_month=e[1]-1;
                
                var start_date = new Date();
                start_date.setDate(s_date);
                start_date.setMonth(s_month);
                start_date.setFullYear(s_year);
                
                var end_date = new Date();
                end_date.setDate(e_date);
                end_date.setMonth(e_month);
                end_date.setFullYear(e_year);
                
                // Calculate the difference in milliseconds
                var difference_ms = Math.abs(start_date - end_date);
                var days=Math.round(difference_ms/ONE_DAY)+1;
                
                var weeksAry=(days/7)+"".split(".");
                var weeks=weeksAry[0];
                var daysAry=(days%7)+"".split(".");
                var weeks_days=daysAry[0];
                
                weeks=parseInt(weeks);
                weeks_days=parseInt(weeks_days);
                
                for(var i=1;i<=weeks;i++){
                    alert(start_date);
                    start_date.setDate(start_date.getDate() +6);
                    alert(start_date);
                    start_date.setDate(start_date.getDate() +1);
                }
                
            }
            
        </script>


        
        
        
    </body>
</html>
