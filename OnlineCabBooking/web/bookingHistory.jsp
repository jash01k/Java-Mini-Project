<%-- 
    Document   : bookingHistory
    Created on : 24 Aug, 2024, 7:45:19 PM
    Author     : helLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking History</title>
    <style>
        /* Importing Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        /* Global styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        /* Container for the content */
        .history-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align: center;
        }

        /* Header style */
        h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        /* Link styling */
        a {
            color: #5cb85c;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="history-container">
        <h1>Booking History</h1>
        <%
            String username = (String) session.getAttribute("username");
            if (username != null) {
                List<String> bookingHistory = (List<String>) session.getAttribute("bookingHistory");
                if (bookingHistory != null && !bookingHistory.isEmpty()) {
                    out.println("<table>");
                    out.println("<tr><th>Date</th><th>Pickup Location</th><th>Drop Location</th><th>Cab Type</th><th>Fare</th></tr>");
                    for (String booking : bookingHistory) {
                        // Assuming booking details are stored in CSV format like "date,pickup,drop,cabType,fare"
                        String[] details = booking.split(",");
                        out.println("<tr>");
                        for (String detail : details) {
                            out.println("<td>" + detail + "</td>");
                        }
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } else {
                    out.println("<p>No bookings found.</p>");
                }
            } else {
                out.println("<p>Please <a href='login.jsp'>Login</a> to view your booking history.</p>");
            }
        %>
        <p><a href="index.jsp">Back to Home</a></p>
    </div>
</body>
</html>
