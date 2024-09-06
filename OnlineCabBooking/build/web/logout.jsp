<%-- 
    Document   : logout
    Created on : 24 Aug, 2024, 7:33:41 PM
    Author     : helLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    out.println("Logging out...");
    session.invalidate();
    response.sendRedirect("index.html");
%>