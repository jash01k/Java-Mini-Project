<%-- 
    Document   : confirmation
    Created on : 24 Aug, 2024, 7:22:45 PM
    Author     : helLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
</head>
<body>
    <h1>Booking Confirmation</h1>

    <p>Your cab has been successfully booked!</p>
    <p>Name: <%= request.getParameter("name") %></p>
    <p>Pickup Location: <%= request.getParameter("pickup") %></p>
    <p>Drop Location: <%= request.getParameter("drop") %></p>
    <p>Cab Type: <%= request.getParameter("cabType") %></p>

    <a href="index.html">Book Another Cab</a>
</body>
</html>
