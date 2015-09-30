<%
session.setAttribute("mov_id",request.getParameter("mov_id").toString());
String action=request.getParameter("action").toString();
if(action.equals("wo")){
    response.sendRedirect("select_Party_Names.jsp");
}
%>