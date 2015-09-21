<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place Work Order:</title>
        <script src="js/jquery-1.11.2.min.js"></script>
        <html:base/>
    </head>
    <body style="background-color: white">
         <jsp:include page="header.jsp"/><br>
       
        <h1>Place New Work Order</h1>
        <%
            String p_id = request.getParameter("p_id").toString();
            String s_id = request.getParameter("s_id").toString();
            String m_id = request.getParameter("m_id").toString();
            String t_id = request.getParameter("t_id").toString();

            String p_name = request.getParameter("p_name").toString();
            String p_phone = request.getParameter("p_phone").toString();
            String t_name = request.getParameter("t_name").toString();
            String t_phone = request.getParameter("t_phone").toString();
            String s_name = request.getParameter("s_name").toString();
            String s_no = request.getParameter("s_no").toString();
        %>
        <hr>
        <table>

            <th align="left">
            <h3>Party Detail:</h3>        
            ID:<% out.print(p_id);%><br>
            Name:<% out.print(p_name);%><br>
            Number:<% out.print(p_phone);%>
            </th>

            <th align="left">
            <h3>Theater Detail:</h3>
            ID:<% out.print(t_id);%><br>
            Name:<% out.print(t_name);%><br>
            Phone:<% out.print(t_phone);%>
            </th>

            <th align="left">
            <h3>Screen Detail:</h3>
            ID:<% out.print(s_id);%><br>
            Name:<% out.print(s_name);%><br>
            No:<% out.print(s_no);%>
            </th>

        </table>
        <hr>

        <script>
            
            
            function parseDate(){
                 for(var j=1;i<=6;i++){
                      $("#"+i+"week").html("");
                 }
                var s=$("#start_date").val().split("-");
                var e=$("#end_date").val().split("-");
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
                $("#total_days").val(days);
                var weeksAry=(days/7)+"".split(".");
                var weeks=weeksAry[0];
                var daysAry=(days%7)+"".split(".");
                var weeks_days=daysAry[0];
                
                weeks=parseInt(weeks);
                weeks_days=parseInt(weeks_days);
                for(var i=1;i<=weeks;i++){
                    var date="";
                    date=date+start_date+" To ";
                    start_date.setDate(start_date.getDate() +6);
                    date=date+start_date;
                    start_date.setDate(start_date.getDate() +1);
                    $("#"+i+"week").html("Week "+i+" Detail: "+date);
                    $("#"+i+"detil").val(date);
                    
                }
                
                if(weeks_days>=1){
                    var date=start_date+"";
                    start_date.setDate(start_date.getDate() +(weeks_days-1));
                    date=date+" To "+start_date;
                    $("#"+(weeks+1)+"week").html("Last "+weeks_days+" Days Detail: "+date);
                    $("#"+i+"detil").val(date);
                    
                }
               
               
            }
            
        </script>


        <html:form action="/add_workorder">
            <input type="password" hidden="" name="p_id" value="<% out.print(p_id);%>"/><input type="password" hidden="" name="t_id" value="<% out.print(t_id);%>"/><input type="password" hidden="" name="s_id" value="<% out.print(s_id);%>"/><input type="password" hidden="" name="mov_id" value="<% out.print(m_id);%>"/>
            <h3>Theater Agreement Detail:</h3>
            Start Date:<input type="date" name="start_date" id="start_date"/>&nbsp;&nbsp;End Date:<input type="date" id="end_date" name="end_date" onchange="parseDate();"/><br>
            <br>
            Total Days:<input type="number" id="total_days" disabled=""/>
            Shows Per Day:<input type="number" name="shows_per_day" value="4"/>
            <br><br>
            <h4 id="1week"></h4><br>
            <input type="text" name="d_1" id="1detil"/>
            Total Theater Rent:<input type="number" name="t1_rent" style="width: 80px;" value="0.0"/>&nbsp;&nbsp;Distributer Share:<input type="number" name="distr1_share" style="width: 50px;" value="0.0"/>%&nbsp;&nbsp;Theater Owner Share:<input type="number" name="owner1_share" style="width: 50px;" value="0.0"/>%<br><br>

            <h4 id="2week"></h4><br>
            <input type="text" name="d_2" id="2detil"/>
            Total Theater Rent:<input type="number" name="t2_rent" style="width: 80px;" value="0.0"/>&nbsp;&nbsp;Distributer Share:<input type="number" name="distr2_share" style="width: 50px;" value="0.0"/>%&nbsp;&nbsp;Theater Owner Share:<input type="number" name="owner2_share" style="width: 50px;" value="0.0"/>%<br><br>

            <h4 id="3week"></h4><br>          
            <input type="text" name="d_3" id="3detil"/>
            Total Theater Rent:<input type="number" name="t3_rent" style="width: 80px;" value="0.0"/>&nbsp;&nbsp;Distributer Share:<input type="number" name="distr3_share" style="width: 50px;" value="0.0"/>%&nbsp;&nbsp;Theater Owner Share:<input type="number" name="owner3_share" style="width: 50px;" value="0.0"/>%<br><br>

            <h4 id="4week"></h4><br>          
            <input type="text" name="d_4" id="4detil"/>
            Total Theater Rent:<input type="number" name="t4_rent" style="width: 80px;" value="0.0"/>&nbsp;&nbsp;Distributer Share:<input type="number" name="distr4_share" style="width: 50px;" value="0.0"/>%&nbsp;&nbsp;Theater Owner Share:<input type="number" name="owner4_share" style="width: 50px;" value="0.0"/>%<br><br>

            <h4 id="5week"></h4><br>          
            <input type="text" name="d_5" id="5detil"/>
            Total Theater Rent:<input type="number" name="t5_rent" style="width: 80px;" value="0.0"/>&nbsp;&nbsp;Distributer Share:<input type="number" name="distr5_share" style="width: 50px;" value="0.0"/>%&nbsp;&nbsp;Theater Owner Share:<input type="number" name="owner5_share" style="width: 50px;" value="0.0"/>%<br><br>

            <h4 id="6week"></h4><br>          
            <input type="text" name="d_6" id="6detil"/>
            Total Theater Rent:<input type="number" name="t6_rent" style="width: 80px;" value="0.0"/>&nbsp;&nbsp;Distributer Share:<input type="number" name="distr6_share" style="width: 50px;" value="0.0"/>%&nbsp;&nbsp;Theater Owner Share:<input type="number" name="owner6_share" style="width: 50px;" value="0.0"/>%


            <hr>
            <h3>MG Detail</h3>
            <input type="radio" name="wo_type" value="mg"/>MG<br>
            MG Amount:<input type="number" name="mg_amount" value="0.0"/><br>
            <br>
            <table>
                <th align="left">
                <h2>
                    <input type="radio" name="payment_Method" value="cash"/>&nbsp;&nbsp;CASH</h2>
            </th>
            <th align="left">
            <h2>
                <input type="radio" name="payment_Method" value="neft"/>&nbsp;&nbsp;NEFT</h2>
        </th>
        <th align="left">
        <h2>
            <input type="radio" name="payment_Method" value="rtgs"/>&nbsp;&nbsp;RTGS</h2>
    </th>
    <th align="left">
    <h2> <input type="radio" name="payment_Method" value="cheque"/>&nbsp;&nbsp;CHEQUE</h2>
</th>
</table>

<h2>Bank Detail:</h2>
UTR NO(for NEFT & RTGS):<input type="text" name="utr_no"/><br>--OR--<br>
Cheaque No(for CHEAQUE):<input type="text" name="cheaque_no"/><br>
Bank Name:<input type="number" name="bank_name"/><br>
<h2>Depositor Name if available:</h2>
Depositor Name(optional):<input type="text" name="depositor_name"/><br>
<h2>Amount Received Detail:</h1>
Amt Received:<input type="number" name="amount_recv" value="0.0"/><br>
Amt Received Date:<input type="date" name="amount_recv_date"/><br>
Amt Received Time:<input type="time" name="amount_recv_time"/><br>




<hr>

<h3>Rent Detail</h3>
<input type="radio" name="wo_type" value="rent"/>Rent
<hr>

<h3>Sharing Detail</h3>
<input type="radio" name="wo_type" value="sharing"/>Sharing
<hr>

<input type="radio" name="woSentEmail" value="true">&nbsp;&nbsp;Received Payment and Send Email Notification&nbsp;&nbsp;<input type="radio" name="woSentEmail" value="false">Payment Not Received Yet<br>
<input type="submit"/><input type="reset"/>

</html:form>

</body>
</html:html>
