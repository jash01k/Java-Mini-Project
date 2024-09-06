<%-- 
    Document   : booking
    Created on : 24 Aug, 2024, 7:21:34 PM
    Author     : helLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cab"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Details</title>
</head>
<body>
    <h1>Booking Details</h1>

    <%
        Cab cabBooking = (Cab) request.getAttribute("cabBooking");
        if (cabBooking != null) {
    %>
        <p>Name: <%= cabBooking.getName() %></p>
        <p>Pickup Location: <%= cabBooking.getPickup() %></p>
        <p>Drop Location: <%= cabBooking.getDrop() %></p>
        <p>Cab Type: <%= cabBooking.getCabType() %></p>

        <form action="confirmation.jsp" method="post">
            <input type="hidden" name="name" value="<%= cabBooking.getName() %>">
            <input type="hidden" name="pickup" value="<%= cabBooking.getPickup() %>">
            <input type="hidden" name="drop" value="<%= cabBooking.getDrop() %>">
            <input type="hidden" name="cabType" value="<%= cabBooking.getCabType() %>">
            <input type="submit" value="Confirm Booking">
        </form>
    <%
        } else {
    %>
        <p>No booking details available.</p>
    <%
        }
    %>
</body>
</html>
